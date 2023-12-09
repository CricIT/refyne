import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import '../../app/utils.dart';
import 'api_request_representable.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 60);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;



  Future request(APIRequestRepresentable request) async {

    if (await Utils.checkInternetConnectivity()) {
     final response = await _client.request(request.url, request.method.string,
          headers: request.headers, query: request.query, body: request.body);
      try {
        print(request.url);
        print(request.body);
        return _returnResponse(response, request);
      } on SocketException catch (e) {
        throw SocketException(e.message);
      }
    }else{
      Get.defaultDialog(
        title: "Alert",
        middleText: "Internet connection not available",
      );
    }
  }

  dynamic _returnResponse(
      Response<dynamic> response, APIRequestRepresentable request) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 202:
        return response.body;
      case 201:
        return response.body;
      case 400:
        throw BadRequestException(response.bodyString);
      case 401:
        throw UnauthorisedException(response.bodyString);
      case 404:
        throw NotFoundException(response.bodyString);
      case 409:
        throw ConflictException(response.bodyString);
      case 408:
        throw TimeOutException(response.bodyString);
      case 500:
        throw InternalServerErrorException((response.bodyString));
    }
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}


class BadRequestException extends AppException {
  BadRequestException(dynamic details)
      : super(
          code: "400",
          message: "Invalid Request",
          details: details,
        );
}

class ConflictException extends AppException {
  ConflictException(dynamic details)
      : super(
          code: "409",
          message: 'Conflict occurred',
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(dynamic details)
      : super(
          code: "401",
          message: "unauthorised",
          details: details,
        );
}



class NotFoundException extends AppException {
  NotFoundException(dynamic details)
      : super(
    code: "404",
    message: "Not Found",
    details: details,
  );

}




class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "408",
          message: "Request TimeOut",
          details: details,
        );
}


class InternalServerErrorException extends AppException {
  InternalServerErrorException(dynamic details)
      : super(
    code: "500",
    message: "Unknown error occurred, please try again later.",
    details: details,
  );

}
