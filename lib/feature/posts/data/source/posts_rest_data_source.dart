import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:showcase_app/base/data/http/app_http_client.dart';
import 'package:showcase_app/feature/posts/data/model/post_model.dart';
import 'package:showcase_app/feature/posts/data/source/posts_data_source.dart';

@Injectable(as: PostsDataSource)
class PostsRestDataSource implements PostsDataSource {
  PostsRestDataSource({
    required AppHttpClient appHttpClient,
    @Named('baseUrl') required String url,
    @Named('apiKey') required String apiKey,
    @Named('userId') required int userId,
  })  : _client = appHttpClient,
        _url = url,
        _apiKey = apiKey,
        _userId = userId;

  final AppHttpClient _client;
  final String _url;
  final String _apiKey;
  final int _userId;

  @override
  Future<List<PostModel>> getPosts() async {
    final url = '$_url/posts';
    final response = await _client.get(
      Uri.parse(url).toString(),
      options: Options(
        headers: await _createHeaders(),
      ),
    );
    final results = response.data as List;
    return List<PostModel>.of(
      results.map(
        (result) => PostModel.fromJson(result as Map<String, dynamic>),
      ),
    );
  }

  Future<Map<String, String>> _createHeaders() async {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $_apiKey'
    };
  }

  @override
  Future<bool> addPost(String title, String body) async {
    final url = '$_url/posts';
    final response = await _client.post(
      Uri.parse(url).toString(),
      options: Options(
        headers: await _createHeaders(),
      ),
      data: {
        'title': title,
        'body': body,
        'user_id': _userId,
      },
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
