import 'package:demo_riverpod/models/photos_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteList extends StateNotifier<List<PhotosModel>> {
  FavoriteList() : super([]);

  addToFavoritesList(dynamic item) {
    state = [...state, item];
  }
}
