import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task/core/networking/end_points.dart';
import 'package:task/features/auth/data/models/login_request_model.dart';
import 'package:task/features/auth/data/models/login_response_model.dart';


part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  @FormUrlEncoded()
  Future<LoginResponseModel> login({
    @Body() required LoginRequestModel loginRequestModel,
  });

}
