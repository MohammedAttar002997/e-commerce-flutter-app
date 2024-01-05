import 'package:flutter_ecommerce_app_clean_code/data/repository/auth_repo.dart';
import 'package:flutter_ecommerce_app_clean_code/models/response_model.dart';
import 'package:flutter_ecommerce_app_clean_code/models/signup_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(response.body["token"], true);
    } else {
      responseModel = ResponseModel(response.statusText!, false);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    print("Getting token");
    print(authRepo.getUserToken().toString());
    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      print("Backend Token");

      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(response.body["token"], true);
    } else {
      responseModel = ResponseModel(response.statusText!, false);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }
}
