

 // base url : https://newsapi.org/
// method (url) : v2/top-headlines?
 // queries : country=eg&category=business&apiKey=5de91158e349434ba986828607121ed3
 //https://newsapi.org/v2/everything?q=tesla&apiKey=5de91158e349434ba986828607121ed3

 import 'package:dio/dio.dart';

class DioHelper{
  static Dio dio=Dio();
  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getdata({
  required String url,
  required Map<String,dynamic> query
}) async
  {
    return await dio.get(url, queryParameters: query,);
  }
 }