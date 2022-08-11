import 'package:code_brothers/pages/photos_page.dart';
import 'package:code_brothers/services/network_services/network_service.dart';
import 'package:dio/dio.dart';

class CommentsNetworkService {
  static Future<Response> getComments() async {
    Response response =
        await networkService.get('${NetworkService.baseUrl}/comments');

    return response;
  }
}
