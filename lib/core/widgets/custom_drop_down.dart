import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/widgets/custom_text_form_field.dart';

class CustomDropdownButton<T> extends StatefulWidget {
  final String? hint;
  final T? value;
  final List<T> items;
  final bool isString;
  final String Function(T)? getItemText;
  final Object? Function(T)? getId;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final bool isHasValidator;
  final bool enabled;

  final bool hasPagination;
  final Future<List<T>> Function(String searchQuery)? onLoadMore;
  final bool hasMoreData;
  final bool readOnly;
  final bool searchFromApi;

  const CustomDropdownButton({
    super.key,
    this.hint,
    this.value,
    required this.items,
    this.isString = true,
    this.readOnly = false,
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
  State<CustomDropdownButton<T>> createState() =>
      _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  T? selectedValue;
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

  bool _isSelected(T item) {
    if (selectedValue == null) return false;
    return _equals(item, selectedValue as T);
  }

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

  void _moveSelectedToTop() {
    if (selectedValue == null) return;
    filteredItems.sort((a, b) {
      if (_equals(a, selectedValue as T)) return -1;
      if (_equals(b, selectedValue as T)) return 1;
      return 0;
    });
  }

  void _applyLocalSearch(String query, StateSetter setModalState) {
    final q = query.trim().toLowerCase();
    setModalState(() {
      filteredItems = q.isEmpty
          ? List.from(allItems)
          : allItems
                .where((item) => _getText(item).toLowerCase().contains(q))
                .toList();
      _moveSelectedToTop();
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
        allItems = _deduplicate(results);
        hasMore = widget.hasMoreData;
      }
      setModalState(() {
        filteredItems = _deduplicate(results);
        hasMore = results.isNotEmpty;
        isLoadingMore = false;
        _moveSelectedToTop();
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

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    allItems = _deduplicate(widget.items);
    filteredItems = List.from(allItems);
    hasMore = widget.hasMoreData;
  }

  void _showBottomSheet(BuildContext context, FormFieldState<T> state) {
    if (!widget.enabled) return;

    searchController.clear();
    allItems = _deduplicate(widget.items);
    filteredItems = List.from(allItems);
    hasMore = widget.hasMoreData;
    isLoadingMore = false;
    _moveSelectedToTop();

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
                                (context, index) => _buildItem(index, state),
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

  Future<void> _loadMore(StateSetter setModalState) async {
    if (widget.onLoadMore == null || isLoadingMore || !hasMore) return;

    setModalState(() => isLoadingMore = true);

    try {
      final newItems = await widget.onLoadMore!(
        widget.searchFromApi ? searchController.text : '',
      );

      allItems = _deduplicate([...allItems, ...newItems]);
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

  Widget _buildItem(int index, FormFieldState<T> state) {
    final item = filteredItems[index];
    final text = _getText(item);
    final isSelected = _isSelected(item);

    return InkWell(
      onTap: () {
        setState(() => selectedValue = item);
        state.didChange(item);
        widget.onChanged?.call(item);
        Navigator.pop(state.context);
      },
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
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.primaryColor,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.readOnly,
      child: FormField<T>(
        initialValue: selectedValue,
        // autovalidateMode: AutovalidateMode.always,
        validator: widget.isHasValidator
            ? widget.validator ??
                  (value) => value == null ? 'هذا الحقل مطلوب' : null
            : null,
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => _showBottomSheet(context, state),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: state.hasError ? Colors.red : Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          selectedValue == null
                              ? widget.hint ?? 'اختر'
                              : _getText(selectedValue as T),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: selectedValue == null
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),

              /// 👇 دي أهم حاجة
              if (state.hasError)
                Padding(
                  padding: EdgeInsets.only(top: 6.h, left: 12.w),
                  child: Text(
                    state.errorText ?? '',
                    style: TextStyle(color: Colors.red, fontSize: 12.sp),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return FormField<T>(
  //     initialValue: selectedValue,
  //     validator: widget.isHasValidator
  //         ? widget.validator ??
  //               (value) => value == null ? 'هذا الحقل مطلوب' : null
  //         : null,
  //     builder: (state) {
  //       return InkWell(
  //         onTap: () => _showBottomSheet(context, state),
  //         child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
  //           decoration: BoxDecoration(
  //             border: Border.all(
  //               color: state.hasError ? Colors.red : Colors.grey.shade300,
  //             ),
  //             borderRadius: BorderRadius.circular(12.r),
  //           ),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: Text(
  //                   selectedValue == null
  //                       ? widget.hint ?? 'اختر'
  //                       : _getText(selectedValue as T),
  //                   style: TextStyle(
  //                     fontSize: 14.sp,
  //                     color: selectedValue == null ? Colors.grey : Colors.black,
  //                   ),
  //                 ),
  //               ),
  //               const Icon(Icons.keyboard_arrow_down),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
