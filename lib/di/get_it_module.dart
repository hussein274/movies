import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@module
abstract class GetItModule{
  @lazySingleton



  Dio getDio(){
    Dio dio=Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: false,
        responseHeader: false,

    ));
    return dio;
  }
}