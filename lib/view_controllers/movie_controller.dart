import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/servies/http_handler.dart';

class MovieViewController extends GetxController {
  final RxList<Movie> _movieList = <Movie>[].obs;
  final Rx<bool> loading = false.obs;
  final Rx<String> searchQuery = "".obs;
  final searchController = TextEditingController(text: "").obs;
  List<Movie> get movieList => _movieList.value;
  bool sortFlag = true;
  final HttpHandler _httpHandler = HttpHandler();
  @override
  void onInit() {
    getData(query: searchController.value.text);
    super.onInit();
  }

  getData({query = String}) async {
    loading.value = true;
    final response = await _httpHandler.getData(query: query);
    loading.value = false;
    _movieList.value = response;
  }

  sort() {
    sortFlag = !sortFlag;
    if (sortFlag) {
      _movieList.sort(((a, b) {
        return (int.tryParse(a.year!) ?? 0)
            .compareTo(int.tryParse(b.year!) ?? 0);
      }));
    } else {
      _movieList.sort(((a, b) {
        return (int.tryParse(b.year!) ?? 0)
            .compareTo(int.tryParse(a.year!) ?? 0);
      }));
    }
  }
}
