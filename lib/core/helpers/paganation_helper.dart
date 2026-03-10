import 'package:flutter/material.dart';
import 'package:task/core/networking/api_result.dart';

class PagnationHelper {
  int currentPage = 1;
  int lastPage = 1;
  bool isLoadingMore = false;
  final ScrollController scrollController = ScrollController();
  void setupScrollController(VoidCallback loadMoreClients) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        loadMoreClients();
      }
    });
  }

  bool get hasMoreData => currentPage < lastPage;
  Future<void> loadMore<T>({
    required void Function() loadingState,
    required Future<ApiResult<T>> Function() apiCall,
    required void Function() errorState,
    required void Function(T data) success,
    required void Function() timeOutState,
  }) async {
    if (isLoadingMore || currentPage >= lastPage) return;

    currentPage++;
    isLoadingMore = true;
    loadingState();

    final result = await apiCall();

    result.when(
      success: (data) => success(data),
      failure: (_) => errorState(),
      timeout: () => timeOutState(),
    );

    isLoadingMore = false;
  }

  void resetPagination() {
    currentPage = 1;
    lastPage = 1;
  }
}
