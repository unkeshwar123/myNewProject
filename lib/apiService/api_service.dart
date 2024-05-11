
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:p_assignment/model/models.dart';
import 'package:retrofit/http.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: "http://stagingauth.desidime.com/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("v4/home/new")
  Future<DataResponse> fetchData(
      @Query("per_page") int per_page,
      @Query("page") int pageIndex,
      @Query("fields") String fields);

  @GET("v4/home/discussed")
  Future<DataResponse> fetchTopData(
      @Query("per_page") int per_page,
      @Query("page") int pageIndex,
      @Query("fields") String fields);
}
