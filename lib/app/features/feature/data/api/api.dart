import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
}

// EXAPMLE

// @RestApi(baseUrl: "https://newsapi.org/v2/")
// abstract class RestClient {
//   factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

//   @GET("/top-headlines?language=en&pageSize=100&apiKey=$newsApiKey")
//   Future<List<ArticleModel>> getTopHeadlines();
// }
