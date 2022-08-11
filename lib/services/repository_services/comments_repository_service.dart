import 'package:code_brothers/exceptions.dart';
import 'package:code_brothers/models/comments.dart';
import 'package:code_brothers/services/network_services/comments_network_service.dart';
import 'package:code_brothers/widgets/custom_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CommentsRepositoryService {
  static Future<List<Comments>> getComments(BuildContext context) async {
    List<Comments> results = [];
    try {
      Response response = await CommentsNetworkService.getComments();
      response.data.forEach((e) {
        results.add(Comments.fromJson(e));
      });
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showCustomDialog(context, errorMessage);
    }
    return results;
  }
}
