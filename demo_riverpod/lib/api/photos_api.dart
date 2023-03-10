import 'package:demo_riverpod/constants/constants.dart';
import 'package:http/http.dart';

import '../models/photos_model.dart';

class PhotosApi {
  Future<List<PhotosModel>> getPhotos() async {
    Response response = await get(Uri.parse(Constants.photosUrl));
    if (response.statusCode == 200) {
      return photosModelFromJson(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
