import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obsecureText = true;
  obsecureTextChanger(){
    obsecureText = !obsecureText;
    notifyListeners();
  }
}
