import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../repositories/index.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "http://run.mocky.io/v3/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("aba7ecaa-0a70-453b-b62d-0e326c859b3b")
  Future<Map<String, List<Dishes>>> getDishes();

  
  @GET("058729bd-1402-4578-88de-265481fd7d54")
  Future<Map<String, List<Categories>>> getCategories();
}

