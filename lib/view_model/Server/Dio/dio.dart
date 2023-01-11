import 'package:dio/dio.dart';
import 'package:note/view_model/Server/Dio/end_point.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class DioHelper {
  // static late Dio dio;
//  static late Dio dio ;
 static Dio dio=Dio();
//   // dio.interceptors.add();
// // dio.interceptors.add();
  
// // dio.interceptors.add();
// // var options = BaseOptions(
// //   baseUrl: 'https://www.xx.com/api',
// //   connectTimeout: 5000,
// //   receiveTimeout: 3000,
// // );

  static init() {
    // dio = Dio(
    //   BaseOptions(
    //     baseUrl:Base_Url,
    //     receiveDataWhenStatusError: true,
    //   ),
    // );
dio.interceptors.add(PrettyDioLogger());

  }

  // static Future<Response> postData({
  //   required String url,
  //   required Map<String, dynamic> data,
  //   Map<String, dynamic>? queryParameters,
  //     String? token,
  // }) async {
  
  //   dio!.options.headers = {
  //     'Content-Type':'application/json',
  //     'Accept': 'application/json',
  //     'Authorization':'Bearer $token'
  //   };
  //   return await dio!.post(
  //     url,
  //     queryParameters: queryParameters,
  //     data: data,
  //   );
  // }


  static Future<Response> getData({
    required String url,
    // required String token,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.options.headers = {
      'Content-Type':'application/json;charset=utf-8',
    };
    return await dio.get(
      url,
      queryParameters: queryParameters,
    );
  }



  // static Future<Response> patchData({
  //   required String url,
  //   required String token,
  //   Map<String, dynamic>? queryParameters,
  //   required Map<String, dynamic> data,
  // }) async {
  
  //   dio.options.headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization':'Bearer $token'
  //   };
  //   return await dio.patch(
  //     url,
  //     queryParameters: queryParameters,
  //     data: data,
     
  //   );
  // }
}