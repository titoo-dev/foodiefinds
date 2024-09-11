import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../dialogs.dart';

mixin ApiRequest {
  Future<T> getRequest<T>(GetRequestParams params) async {
    if (params.showLoading) {
      Dialogs.showLoadingDialog();
    }

    final response = await params.client.get(
      params.path,
      options: Options(
        contentType: params.contentType,
        headers: params.token != null
            ? {
                'Authorization': 'Bearer ${params.token}',
                'Accept': 'application/json',
              }
            : {'Accept': 'application/json'},
      ),
      queryParameters: params.queryParameters,
      onReceiveProgress: params.onReceiveProgress,
    );

    if (params.showLoading) {
      Get.back();
    }

    if (response.statusCode != 200) {
      throw Exception(response.data.toString());
    }

    return params.onSuccess(response.data);
  }

  Future<T> postRequest<T>(PostRequestParams params) async {
    if (params.showLoading) {
      Dialogs.showLoadingDialog();
    }
    final response = await params.client.post(
      params.path,
      options: Options(
        contentType: params.contentType,
        headers: params.token != null
            ? {
                'Authorization': 'Bearer ${params.token}',
                'Accept': 'application/json',
              }
            : {'Accept': 'application/json'},
      ),
      queryParameters: params.queryParameters,
      data: params.data,
    );
    if (params.showLoading) {
      Get.back();
    }

    if (response.statusCode != 200) {
      throw Exception(response.data.toString());
    }

    return params.onSuccess(response.data);
  }
}

class GetRequestParams<T> extends Equatable {
  final Dio client;
  final String path;
  final String contentType;
  final String? token;
  final T Function(dynamic) onSuccess;
  final Map<String, dynamic>? queryParameters;
  // onReceiveProgress
  final void Function(int, int)? onReceiveProgress;
  final bool showLoading;

  const GetRequestParams({
    required this.client,
    required this.path,
    this.contentType = 'application/json',
    this.token,
    required this.onSuccess,
    this.queryParameters,
    this.onReceiveProgress,
    this.showLoading = false,
  });

  @override
  List<Object?> get props => [
        client,
        path,
        contentType,
        token,
        onSuccess,
        queryParameters,
        onReceiveProgress,
        showLoading,
      ];
}

class PostRequestParams<T> extends Equatable {
  final Dio client;
  final String path;
  final String contentType;
  final String? token;
  final Object? data;
  final T Function(dynamic) onSuccess;
  final Map<String, dynamic>? queryParameters;
  final bool showLoading;

  const PostRequestParams({
    required this.client,
    required this.path,
    this.contentType = 'application/json',
    this.token,
    this.data,
    this.queryParameters,
    required this.onSuccess,
    this.showLoading = true,
  });

  @override
  List<Object?> get props => [
        client,
        path,
        contentType,
        token,
        data,
        queryParameters,
        showLoading,
      ];
}
