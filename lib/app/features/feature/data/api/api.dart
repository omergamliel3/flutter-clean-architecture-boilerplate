// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';

// part 'api.g.dart';

// @RestApi(baseUrl: "https://newsapi.org/v2/")
// abstract class RestClient {
//   factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

//   @GET("/top-headlines?language=en&pageSize=100&apiKey=$newsApiKey")
//   Future<List<ArticleModel>> getTopHeadlines();
// }

abstract class RestClient {}
