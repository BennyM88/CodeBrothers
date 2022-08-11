import 'package:code_brothers/exceptions.dart';
import 'package:code_brothers/models/photos.dart';
import 'package:code_brothers/services/network_services/photos_network_service.dart';
import 'package:code_brothers/widgets/custom_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class PhotosRepositoryService {
  static Future<List<Photos>> getPhotos(BuildContext context) async {
    List<Photos> results = [];
    try {
      Response response = await PhotosNetworkService.getPhotos();
      response.data.forEach((e) {
        results.add(Photos.fromJson(e));
      });
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showCustomDialog(context, errorMessage);
    }
    return results;
  }
}
