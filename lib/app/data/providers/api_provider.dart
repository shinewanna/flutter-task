import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:print_color/print_color.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/enums/msg_state.dart';
import 'package:flutter_task/app/data/enums/request_type.dart';
import 'package:flutter_task/app/data/models/resp_model.dart';

class ApiProvider extends GetxController {
  Future<Resp> getReq(
    String url, {
    Map<String, dynamic>? params,
  }) async {
    return await _requestData(
      RequestType.get,
      url,
      params: params,
    );
  }

  Future<Resp> deleteReq(
    String url, {
    Map<String, dynamic>? params,
  }) async {
    return await _requestData(
      RequestType.delete,
      url,
      params: params,
    );
  }

  Future<Resp> postReq(
    String url, {
    Map<String, dynamic>? params,
    FormData? fd,
  }) async {
    return await _requestData(
      RequestType.post,
      url,
      params: params,
      fd: fd,
    );
  }

  Future<Resp> _requestData(
    RequestType rt,
    String url, {
    Map<String, dynamic>? params,
    FormData? fd,
  }) async {
    final dio = Get.find<Dio>();

    Print.white('${dio.options.baseUrl}$url');

    try {
      Response response;
      switch (rt) {
        case RequestType.get:
          response = await dio.get(
            url,
            queryParameters: params,
          );
          break;
        //* In case of Post and Delete
        case RequestType.post:
          response = await dio.post(
            url,
            data: fd,
            queryParameters: params,
          );
          break;
        case RequestType.delete:
          response = await dio.delete(
            url,
            queryParameters: params,
          );
          break;
        default:
          response = await dio.get(
            url,
            queryParameters: params,
          );
          break;
      }

      final data = response.data;

      final statusCode = response.statusCode!;

      final respOb = Resp();

      if (statusCode == 200) {
        //* In case API not success
        if (data['success'] == false) {
          respOb.message = MsgState.error;
          respOb.data = data['message'];
        } else {
          //* Data
          Print.green(response.data);
          respOb.data = response.data;
          respOb.message = MsgState.data;
        }
        return respOb;
      } else {
        //* Error
        if (statusCode == 500) {
          respOb.message = MsgState.error;
          respOb.data = 'Server maintaing, please try later';
        } else {
          respOb.message = MsgState.error;
          respOb.data = data['message'];
        }
        return respOb;
      }
    } on SocketException catch (_) {
      final respOb = Resp();
      respOb.message = MsgState.error;
      respOb.data = AppConstant.def.noInternet;
      return respOb;
    } on FormatException catch (e) {
      throw Exception('Bad response format:$e');
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        if (e.message.contains('SocketException')) {
          final respOb = Resp();
          respOb.message = MsgState.error;
          respOb.data = AppConstant.def.noInternet;
          return respOb;
        }
        throw Exception(e);
      }
      final respOb = Resp();
      respOb.message = MsgState.error;
      respOb.data = 'Server Timeout';
      return respOb;
    } catch (e) {
      final respOb = Resp();
      if (e.toString().contains('500')) {
        respOb.message = MsgState.error;
        respOb.data = 'Server maintaing, please try later';
      } else {
        respOb.message = MsgState.error;
        respOb.data = "Something wen't wrong";
      }
      return respOb;
    }
  }
}
