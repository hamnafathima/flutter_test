import 'package:flutter/material.dart';
import 'package:flutter_machine_test/register_screen/register_screen.dart';
import 'package:flutter_machine_test/response_model/login_model.dart';
import 'package:flutter_machine_test/utils/app_utils.dart';
import 'package:flutter_machine_test/utils/login_service.dart';
import 'package:flutter_machine_test/utils/shared_utils.dart';
import 'package:flutter_machine_test/utils/string_class.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider extends ChangeNotifier {
  bool loginLoading = false;
  bool isPasswordHide = true;
  LoginModel? loginModel;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login(BuildContext context) async {
    setDataLoading(true);
    try {
      final response =
          await LoginService.login(username.text, password.text,  );
      Future.microtask(() async {
        if (response.isNotEmpty) {
          await afterLoginMethod(response, context);
        } else {
          setDataLoading(false);
          AppUtils.showInSnackBarNormal(
              'Incorrect username or password', context);
        }
      });
    } catch (e) {
      Future.microtask(() => AppUtils.showInSnackBarNormal(
          'Login failed due to an error', context));
    }
  }

  afterLoginMethod(String value, BuildContext context) async {
    debugPrint('-----------------------Login Value:${value.toString()}');
    loginModel = loginModelFromJson(value);
    if (loginModel!.success.toString() == "true") {
      SharedUtils.setString(StringClass.token, loginModel!.token.toString());
      SharedUtils.setString(
          StringClass.userId, loginModel!.user!.id.toString());

     

      ///debugPrint('groupId----------------------: ${groupId.toString()}');
      await Future.delayed(const Duration(seconds: 2), () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          // context.read<StudentDetailsProvider>().fetchEmployeeData(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()));
          setDataLoading(false);
          Future.microtask(() {
            AppUtils.showInSnackBarNormal('Welcome Back', context);
          });
        });
      });
      username.clear();
      password.clear();
      setDataLoading(false);
    } else {
      setDataLoading(false);
      AppUtils.showInSnackBarNormal(loginModel!.message.toString(), context);
    }
  }

  setPasswordVisibility() {
    isPasswordHide = !isPasswordHide;
    notifyListeners();
  }

  setDataLoading(bool loading) {
    loginLoading = loading;
    notifyListeners();
  }
}
