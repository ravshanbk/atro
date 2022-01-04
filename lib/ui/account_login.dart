import 'dart:ui';

import 'package:atro/consts/Colors/colors.dart';
import 'package:atro/consts/SizeConfig/size_config.dart';
import 'package:atro/consts/Styles/hint_style.dart';
import 'package:atro/consts/Styles/input_text_style.dart';
import 'package:atro/provider/sign_in_provider.dart';
import 'package:atro/ui/stats_transactions_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AccountLoginPage extends StatelessWidget {
  const AccountLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            _backroundImage(),
            _foreground(context),
          ],
        ),
      ),
    );
  }

  _backroundImage() {
    return Image(
      height: gpsH(1624.0),
      width: gpsW(750.0),
      fit: BoxFit.cover,
      image: const AssetImage("assets/images/loginPageBackgroundImage.png"),
    );
  }

  _foreground(BuildContext context) {
    return Column(
      children: [
        _topSideSkipButton(),
        const Spacer(),
        _atroLogo(),
        const Spacer(),
        _inputFields(context),
        _signInButton(context),
        SizedBox(height: gpsH(48.0)),
        _orDivider(),
        SizedBox(height: gpsH(48.0)),
        _withFacebookButton(),
        SizedBox(height: gpsH(48.0)),
        _forgotDetailsAndCreateAccountButtons()
      ],
    );
  }

  _topSideSkipButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Skip",
            style: TextStyle(
              color: Colors.black,
              fontSize: gpsW(
                25.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _atroLogo() {
    return Image.asset(
      "assets/images/logoAtro.png",
      height: gpsH(200.0),
      width: gpsW(400.0),
      fit: BoxFit.contain,
    );
  }

  _inputFields(BuildContext context) {
    return Form(
      key: context.watch<SignInProvider>().formKey,
      child: Padding(
        padding: EdgeInsets.all(
          gpsW(60.0),
        ),
        child: Column(
          children: [
            __emailInputField(context),
            SizedBox(
              height: gpsH(40.0),
            ),
            __passwordInputField(context),
          ],
        ),
      ),
    );
  }

  __emailInputField(BuildContext context) {
    return SizedBox(
      height: gpsH(110.0),
      width: gpsW(630.0),
      child: TextFormField(
        style: inputTextStyle,
        validator: (v) {
          if (v!.isEmpty) {
            return " The Field Can Not Be Emty";
          }
        },
        controller: context.watch<SignInProvider>().emailController,
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints.tight(
            Size(
              gpsW(65.0),
              gpsW(50.0),
            ),
          ),
          suffixIcon: ___emailSuffixIcon(context),
          hintText: "Email . . .",
          hintStyle: hintStyle,
          fillColor: inputFillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              gpsW(24.0),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  ___emailSuffixIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              gpsW(10.0),
            ),
          ),
          elevation: 0,
          fixedSize: Size(
            gpsW(50.0),
            gpsW(50.0),
          ),
          minimumSize: Size(
            gpsW(0.0),
            gpsW(0.0),
          ),
          primary: greenButtonColor,
        ),
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: gpsW(30.0),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  __passwordInputField(BuildContext context) {
    return SizedBox(
      height: gpsH(110.0),
      width: gpsW(630.0),
      child: TextFormField(
        style: inputTextStyle,
        validator: (v) {
          if (v!.isEmpty) {
            return " The Field Can Not Be Emty";
          }
        },
        obscureText: context.watch<SignInProvider>().obsecureText,
        controller: context.watch<SignInProvider>().passwordController,
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints.tight(
            Size(
              gpsW(122.0),
              gpsW(32.0),
            ),
          ),
          suffixIcon: ___passwordSuffixIcon(context),
          hintText: "Password . . .",
          hintStyle: hintStyle,
          fillColor: inputFillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              gpsW(24.0),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  ___passwordSuffixIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: gpsW(20.0),
            sigmaX: gpsW(0.0),
          ),
          child: ElevatedButton(
            onPressed: () {
              context.read<SignInProvider>().obsecureTextChanger();
            },
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  gpsW(10.0),
                ),
              ),
              elevation: 0,
              fixedSize: Size(
                gpsW(86.0),
                gpsW(32.0),
              ),
              minimumSize: Size(
                gpsW(86.0),
                gpsW(32.0),
              ),
              primary: Colors.white.withOpacity(.07),
            ),
            child: Text(
              "SHOW",
              style: TextStyle(
                color: Colors.white,
                fontSize: gpsW(10.0),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _signInButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (context.read<SignInProvider>().formKey.currentState!.validate()) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const StatsTransactionsList()),
              (route) => false);
        }
      },
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff7560fe),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            gpsW(48.0),
          ),
        ),
        fixedSize: Size(gpsW(630.0), gpsH(100.0)),
      ),
      child: Text(
        "SIGN IN",
        style: TextStyle(
          letterSpacing: 2.0,
          color: Colors.white,
          fontSize: gpsW(25.0),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  _orDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "-------",
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, letterSpacing: 0.0),
        ),
        Text(
          "  OR  ",
          style: TextStyle(
              color: Colors.white, fontSize: gpsW(30.0), letterSpacing: 0.0),
        ),
        const Text(
          "-------",
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, letterSpacing: 0.0),
        )
      ],
    );
  }

  _withFacebookButton() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: gpsW(25.0), sigmaY: gpsH(0.0)),
        child: SizedBox(
          height: gpsH(100.0),
          width: gpsW(630.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white.withOpacity(.07),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  gpsW(48.0),
                ),
              ),
              fixedSize: Size(gpsW(630.0), gpsH(100.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/facebookLogo.svg",
                  color: Colors.white,
                ),
                Text(
                  "CONTINUE WITH FACEBOOK",
                  style: TextStyle(
                    letterSpacing: 2.0,
                    color: Colors.white,
                    fontSize: gpsW(25.0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _forgotDetailsAndCreateAccountButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "FORGOT DETAILS?",
            style: TextStyle(
              color: Colors.grey,
              fontSize: gpsW(20.0),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "CREATE ACCOUNT",
            style: TextStyle(
              color: Colors.grey,
              fontSize: gpsW(20.0),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
