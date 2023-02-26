import 'package:demo_riverpod/models/photos_model.dart';
import 'package:demo_riverpod/state/favorites_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/photos_api.dart';

// Basic provider for PhotosApi
final photosApiProvider = Provider<PhotosApi>((ref) => PhotosApi());

// FutureProvider for calling the api method which returns the future data
final photoStateFuture = FutureProvider<List<PhotosModel>>((ref) async {
  return ref.read(photosApiProvider).getPhotos();
});

final favoriteListProvider =
    StateNotifierProvider<FavoriteList, List<PhotosModel>>(
        (ref) => FavoriteList());
