import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/widgets/custom_text_form_field.dart';

class CustomMultiSelectDropdown<T> extends StatefulWidget {
  final String? hint;
  final List<T> selectedValues;
  final List<T> items;
  final bool isString;
  final String Function(T)? getItemText;
  final Object? Function(T)? getId;
  final ValueChanged<List<T>>? onChanged;
  final String? Function(List<T>?)? validator;
  final bool isHasValidator;
  final bool enabled;
  final bool hasPagination;
  final Future<List<T>> Function(String searchQuery)? onLoadMore;
  final bool hasMoreData;
  final bool searchFromApi;

  const CustomMultiSelectDropdown({
    super.key,
    this.hint,
    this.selectedValues = const [],
    required this.items,
    this.isString = true,
    this.getItemText,
    this.getId,
    this.onChanged,
    this.validator,
    this.isHasValidator = true,
    this.enabled = true,
    this.hasPagination = false,
    this.onLoadMore,
    this.hasMoreData = false,
    this.searchFromApi = false,
  });

  @override
  State<CustomMultiSelectDropdown<T>> createState() =>
      _CustomMultiSelectDropdownState<T>();
}

class _CustomMultiSelectDropdownState<T>
    extends State<CustomMultiSelectDropdown<T>> {
  List<T> selectedValues = [];
  final TextEditingController searchController = TextEditingController();

  List<T> allItems = [];
  List<T> filteredItems = [];

  bool isLoadingMore = false;
  bool hasMore = false;

  String _getText(T item) =>
      widget.isString ? item.toString() : widget.getItemText!(item);

  bool _equals(T a, T b) {
    if (widget.getId != null) return widget.getId!(a) == widget.getId!(b);
    return a == b;
  }

  bool _isSelected(T item) => selectedValues.any((s) => _equals(s, item));

  List<T> _deduplicate(List<T> items) {
    if (widget.getId != null) {
      final seen = <Object?>{};
      final result = <T>[];
      for (final item in items) {
        if (seen.add(widget.getId!(item))) result.add(item);
      }
      return result;
    }
    return items.toSet().toList();
  }

  @override
  void initState() {
    super.initState();
    selectedValues = _deduplicate(List.from(widget.selectedValues));
    allItems = _deduplicate(widget.items);
    filteredItems = List.from(allItems);
    hasMore = widget.hasMoreData;
  }

  @override
  void didUpdateWidget(CustomMultiSelectDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedValues != widget.selectedValues) {
      selectedValues = _deduplicate(List.from(widget.selectedValues));
    }

    if (oldWidget.items != widget.items) {
      allItems = _deduplicate([...selectedValues, ...widget.items]);
      filteredItems = List.from(allItems);
    }
  }

  void _toggleItem(
    T item,
    StateSetter setModalState,
    FormFieldState<List<T>> state,
  ) {
    setModalState(() {
      if (_isSelected(item)) {
        selectedValues.removeWhere((s) => _equals(s, item));
      } else {
        if (!_isSelected(item)) {
          selectedValues.add(item);
        }
      }
    });
    setState(() {});
    state.didChange(List.from(selectedValues));
    widget.onChanged?.call(List.from(selectedValues));
  }

  void _applyLocalSearch(String query, StateSetter setModalState) {
    final q = query.trim().toLowerCase();
    setModalState(() {
      filteredItems = q.isEmpty
          ? List.from(allItems)
          : allItems
                .where((item) => _getText(item).toLowerCase().contains(q))
                .toList();
    });
  }

  Future<void> _applyApiSearch(String query, StateSetter setModalState) async {
    if (widget.onLoadMore == null) return;
    setModalState(() {
      isLoadingMore = true;
      filteredItems = [];
    });
    try {
      final results = await widget.onLoadMore!(query);
      if (query.trim().isEmpty) {
        allItems = _deduplicate([...selectedValues, ...results]);
        hasMore = widget.hasMoreData;
      }
      setModalState(() {
        filteredItems = _deduplicate(results);
        hasMore = results.isNotEmpty;
        isLoadingMore = false;
      });
    } catch (_) {
      setModalState(() => isLoadingMore = false);
    }
  }

  Future<void> _onSearchChanged(String query, StateSetter setModalState) async {
    if (widget.searchFromApi) {
      await _applyApiSearch(query, setModalState);
    } else {
      _applyLocalSearch(query, setModalState);
    }
  }

  Future<void> _loadMore(StateSetter setModalState) async {
    if (widget.onLoadMore == null || isLoadingMore || !hasMore) return;
    setModalState(() => isLoadingMore = true);
    try {
      final newItems = await widget.onLoadMore!(
        widget.searchFromApi ? searchController.text : '',
      );
      allItems = _deduplicate([...selectedValues, ...allItems, ...newItems]);
      hasMore = newItems.isNotEmpty;
      if (widget.searchFromApi) {
        setModalState(() {
          filteredItems = _deduplicate([...filteredItems, ...newItems]);
          isLoadingMore = false;
        });
      } else {
        _applyLocalSearch(searchController.text, setModalState);
        setModalState(() => isLoadingMore = false);
      }
    } catch (_) {
      setModalState(() => isLoadingMore = false);
    }
  }

  void _showBottomSheet(BuildContext context, FormFieldState<List<T>> state) {
    if (!widget.enabled) return;

    searchController.clear();

    allItems = _deduplicate([...selectedValues, ...widget.items]);
    filteredItems = List.from(allItems);
    hasMore = widget.hasMoreData;
    isLoadingMore = false;

    final sheetScrollController = ScrollController();
    bool listenerAdded = false;

    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (context, setModalState) {
              if (!listenerAdded) {
                listenerAdded = true;
                sheetScrollController.addListener(() {
                  if (!sheetScrollController.hasClients) return;
                  final pos = sheetScrollController.position;
                  if (pos.pixels >= pos.maxScrollExtent - 200 &&
                      !isLoadingMore &&
                      hasMore &&
                      widget.hasPagination) {
                    _loadMore(setModalState);
                  }
                });
              }

              return Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    Container(
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: CustomTextFormField(
                        hintText: 'بحث...',
                        controller: searchController,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.primaryColor,
                        ),
                        onChanged: (query) =>
                            _onSearchChanged(query, setModalState),
                      ),
                    ),

                    Expanded(
                      child: CustomScrollView(
                        controller: sheetScrollController,
                        slivers: [
                          if (isLoadingMore && filteredItems.isEmpty)
                            const SliverFillRemaining(
                              child: Center(child: CircularProgressIndicator()),
                            )
                          else ...[
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) =>
                                    _buildItem(index, state, setModalState),
                                childCount: filteredItems.length,
                              ),
                            ),
                            if (isLoadingMore)
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.all(16.h),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                          ],
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            'Done (${selectedValues.length})',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ).whenComplete(() {
      sheetScrollController.dispose();
    });
  }

  Widget _buildItem(
    int index,
    FormFieldState<List<T>> state,
    StateSetter setModalState,
  ) {
    final item = filteredItems[index];
    final text = _getText(item);
    final isSelected = _isSelected(item);

    return InkWell(
      onTap: () => _toggleItem(item, setModalState, state),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withValues(alpha: 0.06)
              : null,
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22.w,
              height: 22.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.primaryColor : Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 14.sp)
                  : null,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? AppColors.primaryColor : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField<List<T>>(
      initialValue: selectedValues,

      // autovalidateMode: AutovalidateMode.always,
      validator: widget.isHasValidator
          ? widget.validator ??
                (value) =>
                    (value == null || value.isEmpty) ? 'هذا الحقل مطلوب' : null
          : null,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => _showBottomSheet(context, state),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.hasError ? Colors.red : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: selectedValues.isEmpty
                          ? Text(
                              widget.hint ?? 'اختر',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            )
                          : Wrap(
                              spacing: 6.w,
                              runSpacing: 4.h,
                              children: selectedValues.map((item) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Row(
                                    spacing: 10.sp,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        _getText(item),
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedValues.removeWhere(
                                              (s) => _equals(s, item),
                                            );
                                          });
                                          state.didChange(
                                            List.from(selectedValues),
                                          );
                                          widget.onChanged?.call(
                                            List.from(selectedValues),
                                          );
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 20.sp,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: selectedValues.isEmpty
                          ? Colors.grey
                          : AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: EdgeInsets.only(top: 6.h, right: 12.w),
                child: Text(
                  state.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12.sp),
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
