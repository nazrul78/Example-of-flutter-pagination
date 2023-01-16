// import 'dart:developer';

// import 'package:flutter_pagination/src/controllers/home_controller.dart';
// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
// import 'package:dio/dio.dart';

// import '../models/blog.dart';

// class HomeService {
//   final homeC = Get.put(HomeController());

//   /// To get blogs from server.
//   Future<List<Blog>> getBlogs1() async {
//     // homeC.isFirstTimeLoading.value = false;
//     try {
//       var res = await Dio().get('https://jsonplaceholder.typicode.com/posts');

//       var rawData = res.data as List;

//       if (rawData.isNotEmpty) {
//         final blogs = rawData
//             .map((e) => Blog.fromJson(e as Map<String, dynamic>))
//             .toList();

//         return blogs;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       log('$e');
//       return [];
//     }
//   }

//   /// To get blogs from server with pagination.
//   Future<List<Blog>> loadMoreBlogs1() async {
//     // if (homeC.hasNextPage == true &&
//     //     homeC.isFirstTimeLoading == false &&
//     //     homeC.isLoadMoreRunning == false &&
//     //     homeC.scrollController.position.extentAfter < 300) {
//     try {
//       // homeC.isLoadMoreRunning.value = true;
//       // homeC.page.value += 1;

//       //  var res = await Dio().get('https://jsonplaceholder.typicode.com/posts');
//       var res = await Dio().get(
//           'https://jsonplaceholder.typicode.com/posts?_page=${homeC.page}&_limit=${homeC.limit}');

//       var rawData = res.data as List;

//       if (rawData.isNotEmpty) {
//         final blogs = rawData
//             .map((e) => Blog.fromJson(e as Map<String, dynamic>))
//             .toList();
//         //  homeC.isLoadMoreRunning.value = false;
//         return blogs;
//       } else {
//         // homeC.isLoadMoreRunning.value = false;
//         return [];
//       }
//     } catch (error) {
//       log('$error');
//       //  homeC.isLoadMoreRunning.value = false;
//       return [];
//     }
//   }

//   //   return [];
//   // }
// }
