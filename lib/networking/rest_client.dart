import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/response_entity_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.hack2hire.onemount.dev/booking/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/shows")
  Future<ResponseEntity> getShows();

  @GET("/shows/{id}/seats")
  Future<ResponseEntity> getSeats(@Path("id") String id);

  @GET("/messages/1")
  Future<ResponseEntity> getMessages();
}
