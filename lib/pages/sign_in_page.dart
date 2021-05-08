import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:marvel_ui/pages/home_page.dart';
import 'package:marvel_ui/pages/sign_up_page.dart';
import 'package:marvel_ui/widgets/buttons.dart';
import 'package:marvel_ui/widgets/inpurs.dart';
import 'package:marvel_ui/widgets/style_color.dart';

import '../utils.dart';

class SignInPage extends StatefulWidget {
  static final routeName = 'SingInPage';

  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formStateSingIn = GlobalKey<FormState>();

  String email;
  String password;

  void _onSignIn() async {
    if (!_formStateSingIn.currentState.validate()) {
      return;
    }
    _formStateSingIn.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/back.png"), fit: BoxFit.cover)),
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: _formStateSingIn,
          child: Column(
             children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 150.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 74),
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomFormInput(
                  hintText: 'User Email',
                  prefix: Icons.person_outline,
                  onSaved: (v) => this.email = v,
                  validator: (v) => v.isEmpty
                      ? "Email is required!"
                      : isValidEmail(v)
                          ? null
                          : "Invalid email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomFormInput(
                  hintText: "Password",
                  prefix: Icons.lock_outline,
                  onSaved: (v) => this.password = v,
                  validator: (v) => v.isEmpty ? "Password is required" : null,
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Text(
                  "Forgot password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: 44,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: CustumButton(
                  borderColor: loginButtonColor,
                  color: loginButtonColor,
                  radius: 0.0,
                  onTap: () {
                  // _onSignIn();
                  Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                  },
                  text: 'LOGIN',
                ),
              ),
              Container(
                height: 44,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: CustumButton(
                  borderColor: onBoardButtonBorderColor,
                  color: onBoardButtonColor,
                  radius: 0.0,
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpPage.routeName);
                  },
                  text: 'REGISTRATION',
                ),
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}
