//this is the code duplication place that
//we will be using for searched repos and starred repos

import 'package:dio/dio.dart';
import 'package:repo_viewer/core/infrastructure/dio_extension.dart';

import '../../../../core/infrastructure/network_exceptions.dart';
import '../../../../core/infrastructure/remote_responses.dart';
import '../../../core/infrastructure/github_headers.dart';
import '../../../core/infrastructure/github_headers_cache.dart';
import '../../../core/infrastructure/github_repo_dto.dart';
import '../../../core/infrastructure/pagination_config.dart';

abstract class ReposRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  ReposRemoteService(
    this._dio,
    this._headersCache,
  );

  // indicating the page number of the starred repositories to retrieve
  Future<RemoteResponse<List<GithubRepoDTO>>> getPage({
    required Uri requestUri,
    required List<dynamic> Function(dynamic json) jsonDataSelector,
  }) async {
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

        await _headersCache.saveHeaders(
            requestUri, headers); //this is to save the headers..
        final convertedData = jsonDataSelector(response
                .data) //this is to convert the response that we get from API which is in the form of json
            //we specified the [items] in the above case beacuse in the search feature the response is in the items field..this could be seen in the request uri in github.rest file
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
