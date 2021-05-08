import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:marvel_ui/pages/sign_in_page.dart';
import 'package:marvel_ui/widgets/buttons.dart';
import 'package:marvel_ui/widgets/inpurs.dart';
import 'package:marvel_ui/widgets/style_color.dart';

import '../utils.dart';

class SignUpPage extends StatefulWidget {
  static final routeName = 'SingUpPage';

  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formStateSingIn = GlobalKey<FormState>();
  String email;
  String password;

  void _onSignUp() async {
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
                  hintText: 'Nick Name',
                  prefix: Icons.person_outline,
                  onSaved: (v) => this.email = v,
                  validator: (v) => v.isEmpty ? "Enter a Nick Name" : null,
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
                height: 44,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: CustumButton(
                  borderColor: loginButtonColor,
                  color: loginButtonColor,
                  radius: 0.0,
                  onTap: () {
                    //_onSignUp();
                    Navigator.of(context)
                        .pushReplacementNamed(SignInPage.routeName);
                  },
                  text: 'REGISTRATION',
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
                        .pushReplacementNamed(SignInPage.routeName);
                  },
                  text: 'LOGIN',
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
