import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/base.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Base {
  @override
  void initState() {
    super.initState();
    homeC.getBlogs();
    homeC.scrollController.addListener(() => homeC.loadMoreBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Example of pagination',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: homeC.isFirstTimeLoading.value
            ? Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                    strokeWidth: 2,
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(15),
                      physics: ScrollPhysics(),
                      itemCount: homeC.blogList.length,
                      controller: homeC.scrollController,
                      itemBuilder: (context, index) {
                        final item = homeC.blogList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            // height: 200,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 228, 241, 242),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(width: 1, color: Colors.amber),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '${item.title}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 20),
                                Text('${item.body}')
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (homeC.isLoadMoreRunning.value)
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    ),
                  if (!homeC.hasNextPage.value)
                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: const Center(
                        child: Text('You have fetched all of the content.'),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
