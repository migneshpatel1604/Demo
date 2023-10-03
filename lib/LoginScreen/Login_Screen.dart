// @dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hdfc_ls/APIServices/ApiServices.dart';
import 'package:hdfc_ls/DashBoard/Dashboard_List.dart';
import 'package:hdfc_ls/StyleScreen/StyleScreen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController EmailidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;
  var loginRes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1.5,
        width: MediaQuery.of(context).size.width * 1.5,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    ColorName.buttoncolor, BlendMode.colorBurn),
                image:
                    AssetImage('assets/Login_Screen/background_money_img.png')),
            color: ColorName.buttoncolor,
            backgroundBlendMode: BlendMode.colorBurn),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/Login_Screen/background_money_img.png",
                  color: ColorName.buttoncolor,
                  colorBlendMode: BlendMode.colorBurn,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/SplashScreen_Circle.png",
                          height: 130,
                          alignment: Alignment.center,
                          width: 130,
                        ),
                      ),
                      Center(
                        child: Image.asset("assets/Logo/logo.png",
                            alignment: Alignment.center,
                            height: 110,
                            width: 110),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Center(
                          //   child: GradientText(
                          //     'Login',
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 25.0,
                          //     ),
                          //     colors: [
                          //       ColorName.buttoncolor, ColorName.logoOrangecolor
                          //     ],
                          //   ),
                          // ),

                          Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                // foreground: Paint()..shader = linearGradient,
                                color: ColorName.buttoncolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          )),
                          TextFormField(
                            controller: EmailidController,
                            cursorColor: Colors.blue,
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Enter your Email Id',
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please Enter Email Id";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: passwordVisible,
                            cursorColor: Colors.blue,
                            // cursorRadius: Radius.circular(20),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                              alignLabelWithHint: false,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please Enter Password";
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, bottom: 20.0),
                            child: Center(
                              child: Material(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  borderRadius: (BorderRadius.circular(20)),
                                  onTap: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(builder: (context) => Dashboard_List()));
                                    if (_formkey.currentState.validate()) {
                                      showLoaderDialog(context);
                                      loginApi(
                                          EmailidController.text.toString(),
                                          passwordController.text.toString());
                                    } else {
                                      return null;
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 40),
                                    decoration: new BoxDecoration(
                                        borderRadius:
                                            (BorderRadius.circular(8)),
                                        color: ColorName.buttoncolor,
                                        boxShadow: [
                                          new BoxShadow(
                                              color: ColorName.gray3,
                                              blurRadius: 4.0,
                                              offset: Offset(1, 2)),
                                        ]),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginApi(String email_id, String password) async {
    Map<String, Object> jsonparam = Map();
    setState(() {
      jsonparam = {
        "email": email_id,
        "password": password,
      };
    });
    print(jsonparam);
    ApiService apiService = new ApiService();
    apiService.callloginApi(jsonparam).then((value) => {
          setState(() {
            print("Login Response" + value.toString());
            loginRes = json.decode(value);
            if (loginRes['status'] == "1") {
              Navigator.pop(context);

              GetStorage().write("user_id", loginRes['user']['id'].toString());
              GetStorage().write(
                  "tokenId", loginRes['authorisation']['token'].toString());
              GetStorage().write(
                  "first_name", loginRes['user']['first_name'].toString());
              GetStorage()
                  .write("last_name", loginRes['user']['last_name'].toString());
              GetStorage().write(
                  "user_email", loginRes['user']['user_email'].toString());
              GetStorage()
                  .write("email_id", loginRes['user']['email'].toString());
              GetStorage().write(
                  "mobile_no", loginRes['user']['mobile_number'].toString());
              GetStorage().write("emailverified_at",
                  loginRes['user']['email_verified_at'].toString());
              GetStorage()
                  .write("role_id", loginRes['user']['role_id'].toString());
              GetStorage()
                  .write("str_IP", loginRes['user']['strIP'].toString());
              GetStorage().write(
                  "updated_at", loginRes['user']['updated_at'].toString());
              GetStorage().write(
                  "created_at", loginRes['user']['created_at'].toString());
              GetStorage()
                  .write("user_status", loginRes['user']['status'].toString());
              print(loginRes['user']['id'].toString());
              print(loginRes['authorisation']['token'].toString());
              print(loginRes['user']['first_name'].toString());
              print(loginRes['user']['user_email'].toString());
              print(loginRes['user']['mobile_number'].toString());

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Dashboard_List()));
            } else {
              Navigator.pop(context);
              Fluttertoast.showToast(
                  msg: loginRes['message'],
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: ColorName.black,
                  textColor: ColorName.white,
                  fontSize: 16.0);
            }
          }),
        });
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[ColorName.buttoncolor, ColorName.logoOrangecolor],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  showLoaderDialog(context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(
            strokeWidth: 3,
            color: ColorName.buttoncolor,
            backgroundColor: ColorName.logoOrangecolor,
          ),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text(
                "Loading...",
                style: TextStyle(foreground: Paint()..shader = linearGradient),
              )),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
