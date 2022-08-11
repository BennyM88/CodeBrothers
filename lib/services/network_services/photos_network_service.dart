import 'package:code_brothers/pages/photos_page.dart';
import 'package:code_brothers/services/network_services/network_service.dart';
import 'package:dio/dio.dart';

class PhotosNetworkService {
  static Future<Response> getPhotos() async {
    Response response =
        await networkService.get('${NetworkService.baseUrl}/photos');

    return response;
  }
}
