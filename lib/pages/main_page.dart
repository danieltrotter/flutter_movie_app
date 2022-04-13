import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/view_controllers/movie_controller.dart';

class MainPage extends GetView<MovieViewController> {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 35,
                  ).paddingAll(20),
                  Text(
                    "Movie app",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: screenSize.width,
                color: Colors.grey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.searchController.value,
                      onChanged: (value) {
                        controller.getData(query: value);
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: InkWell(
                            onTap: () {
                              controller.sort();
                            },
                            child: Icon(Icons.sort),
                          )),
                    ).paddingAll(10),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Obx(() => controller.loading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Wrap(
                              children: controller.movieList.map((Movie e) {
                                return Container(
                                  width: (screenSize.width - 40) * 0.5,
                                  height: (screenSize.width - 40) * 0.5 + 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Image.network(
                                          e.poster!,
                                          errorBuilder: (BuildContext, Object,
                                              StackTrace) {
                                            return Container(
                                              width:
                                                  (screenSize.width - 40) * 0.5,
                                              height:
                                                  (screenSize.width - 40) * 0.5,
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            );
                                          },
                                          width: (screenSize.width - 40) * 0.5,
                                          height: (screenSize.width - 40) * 0.5,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Flexible(
                                          child: Text(
                                        e.title!,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ).paddingOnly(top: 10, left: 10)),
                                      Text(e.year!)
                                          .paddingOnly(left: 10, top: 5),
                                    ],
                                  ),
                                ).paddingAll(10);
                              }).toList(),
                            )),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
