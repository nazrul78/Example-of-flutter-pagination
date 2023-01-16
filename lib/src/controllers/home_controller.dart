import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../models/blog.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final blogList = RxList<Blog>([]);
  final isFirstTimeLoading = RxBool(false);
  final hasNextPage = RxBool(true);
  final isLoadMoreRunning = RxBool(false);
  final page = RxInt(0);
  final limit = RxInt(20);

  /// To get blogs from server.
  Future<void> getBlogs() async {
    isFirstTimeLoading.value = true;
    try {
      var res = await Dio().get('https://jsonplaceholder.typicode.com/posts');

      var rawData = res.data as List;

      if (rawData.isNotEmpty) {
        final blogs = rawData
            .map((e) => Blog.fromJson(e as Map<String, dynamic>))
            .toList();
        blogList.value = blogs;
      }
      isFirstTimeLoading.value = false;
    } catch (e) {
      log('$e');
      isFirstTimeLoading.value = false;
    }
  }

  /// To get blogs from server with pagination.
  Future<void> loadMoreBlogs() async {
    log('${page.value}' '>>>>>> Page');

    if (hasNextPage == true &&
        isFirstTimeLoading == false &&
        isLoadMoreRunning == false &&
        scrollController.position.extentAfter < 300) {
      try {
        isLoadMoreRunning.value = true;
        page.value += 1;

        //  var res = await Dio().get('https://jsonplaceholder.typicode.com/posts');
        var res = await Dio().get(
            'https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=$limit');

        var rawData = res.data as List;

        if (rawData.isNotEmpty) {
          final blogs = rawData
              .map((e) => Blog.fromJson(e as Map<String, dynamic>))
              .toList();
          blogList.addAll(blogs);
          isLoadMoreRunning.value = false;
        } else {
          hasNextPage.value = false;
          isLoadMoreRunning.value = false;
        }
      } catch (error) {
        log('$error');
        isLoadMoreRunning.value = false;
      }
    }
  }
}
