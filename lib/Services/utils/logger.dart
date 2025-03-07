import 'package:dio/dio.dart';
import 'dart:developer' as developer;

const name = "Flutter_vs_MAUI";

final loggerInterceptor = InterceptorsWrapper(
  onRequest: (RequestOptions options, handler) {
    developer.log(
      "┌------------------------------------------------------------------------------",
      name: name,
    );
    developer.log("| Request: ${options.method} ${options.uri}", name: name);
    developer.log("| Payload: ${options.data.toString()}", name: name);
    developer.log("| Headers:", name: name);

    options.headers.forEach((key, value) {
      developer.log("|\t- $key: $value", name: name);
    });

    developer.log(
      "├------------------------------------------------------------------------------",
      name: name,
    );
    handler.next(options); //continue
  },
  onResponse: (Response response, handler) async {
    developer.log("| Response: [code ${response.statusCode}]:", name: name);
    developer.log("| Body: ${response.data.toString()}", name: name);
    developer.log(
      "└------------------------------------------------------------------------------",
      name: name,
    );
    handler.next(response);
    // return response; // continue
  },
  onError: (DioError error, handler) async {
    developer.log("| Error: ${error.error}", name: name);
    developer.log("| ${error.response.toString()}", name: name);
    developer.log(
      "└------------------------------------------------------------------------------",
      name: name,
    );
    handler.next(error); //continue
  },
);
