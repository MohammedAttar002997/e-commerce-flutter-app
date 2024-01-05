import 'package:flutter_ecommerce_app_clean_code/data/api/api_client.dart';
import 'package:flutter_ecommerce_app_clean_code/models/signup_body_model.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
      AppConstant.REGISTRATION_URL,
      signUpBody.toJson(),
    );
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(AppConstant.LOGIN_URL, {
      "email": email,
      "password": password,
      "phone":"155544445558844"
    });
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  Future<String> getUserToken()async{
    return await sharedPreferences.getString(AppConstant.TOKEN)!;
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async{
    try{
      await sharedPreferences.setString(AppConstant.PHONE, number);
      await sharedPreferences.setString(AppConstant.PASSWORD, password);
    }catch(e){
      throw e;
    }
  }
}
