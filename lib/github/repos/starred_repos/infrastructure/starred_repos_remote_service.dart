import 'package:dio/dio.dart'; //This imports the Dio package, which is an HTTP client for Dart. It allows making HTTP requests and handling responses.
import 'package:repo_viewer/core/infrastructure/dio_extension.dart';
import 'package:repo_viewer/core/infrastructure/network_exceptions.dart';
import 'package:repo_viewer/core/infrastructure/remote_responses.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';

import '../../../core/infrastructure/github_repo_dto.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers_cache.dart';

class StarredReposRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  StarredReposRemoteService(
    this._dio,
    this._headersCache,
  );

  // indicating the page number of the starred repositories to retrieve
  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    int page,
  ) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/user/starred',
      {
        'page': '$page',
        'per_page': PaginationConfig.itemsPerPage.toString(),
      },
    );

    final previousHeaders = await _headersCache.getHeaders(requestUri);

    try {
      final response = await _dio.getUri(
        //this line makes an HTTP GET request using the _dio instance.
        requestUri,
        options: Options(
          headers: {
            'If-None-Match': previousHeaders?.etag ?? '',
          },
        ),
      );
      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
          maxPage: previousHeaders?.link?.maxPage ?? 0,
        );
      } else if (response.statusCode == 200) {
        final headers = GithubHeaders.parse(response);
        headers.link?.maxPage;
        await _headersCache.saveHeaders(
            requestUri, headers); //this is to save the headers..
        final convertedData = (response.data as List<
                dynamic>) //this is to convert the response that we get from API which is in the form of json
            .map((e) => GithubRepoDTO.fromJson(e as Map<String, dynamic>))
            .toList();
        return RemoteResponse.withNewData(
          convertedData,
          maxPage: headers.link?.maxPage ?? 1,
        ); //in the remote response file if the data is outdated we will be returning the new data..
      } else {
        //suppose if the status code is not one from the documentation we will be returning the same status code..
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
