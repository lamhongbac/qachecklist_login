import 'package:flutter/material.dart';
import 'package:qachecklist_login/services/auth_services.dart';
//import 'package:qachecklist_login/api/models/account_models.dart';
import 'package:qachecklist_login/api/models/general_models.dart';
//import 'package:qachecklist_login/views/auth_check.dart';
//import 'package:qachecklist_login/views/home_screen.dart';
//import 'package:qachecklist_login/views/home_screen.dart';
import 'package:qachecklist_login/widgets/helpers.dart';
//import 'package:qachecklist_login/widgets/qa_home.dart';
//import 'package:qachecklist_login/widgets/rest_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //bool _isLogin = false;
  String enteredUserID = '';
  String enteredPassword = '';

  ///
  /// rule : password not null, and length >=6
  bool isValidPassword(String? password) {
    bool isValid = true;
    if (password == null || password.isEmpty || password.length < 6) {
      isValid = false;
    }
    return isValid;
  }

  ///
  ///rule: user is not null & length >=3
  ///
  bool isValidUserID(String? userID) {
    bool isValid = true;
    if (userID == null || userID.isEmpty || userID.length < 3) {
      isValid = false;
    }
    return isValid;
  }

  ///
  ///kiem tra userid/password is valid
  /// if isvalid goto login function
  ///
  void _submit(BuildContext context) async {
    //1.kiem tra xem co thoa man validator
    final isValid = _formkey.currentState!.validate();

    //2. if valid convert to entered value else return

    if (isValid) {
      // neu thoa man thuc hien gan data vao entered userID/pass
      _formkey.currentState!.save();
    } else {
      return;
    }
    //3. if valid =>thuc hien ham login
    _login(context);
  }

  ///
  ///1.Auth service login
  ///1.1 api check BE
  ///1.2 save user info to local
  ///
  ///2. show info or warning
  ///3. if ok go to AuthCheck=>QA or Rest HomePage
  ///
  void _login(BuildContext context) async {
    //String message = 'Login Successfully';
    //_isLogin = true;
    AuthService authService = AuthService();
    ApiRequestResult? loginResponse;
    try {
      await authService.login(enteredUserID, enteredPassword).then((response) {
        loginResponse = response;

        if (loginResponse!.ok == true) {
          Widget homeScreen = getHomeScreen();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => homeScreen));
          if (mounted) {
            showInfoMessage(loginResponse!.message, context);
          }
        } else {
          if (mounted) {
            showWarningMessage(loginResponse!.message, context);
          }
        }
      });
    } catch (e) {
      if (mounted) {
        showInfoMessage(e.toString(), context);
      }
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    emailController.text = 'NghinhthuQAO';
    passwordController.text = '123456';

    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(36),
            child: Column(
                // Suggested code may be subject to a license.
                // Learn more: ~LicenseLog:1959192074.
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/Logo.png'),
                  // Image.asset('assets/images/Logo.png',
                  //     height: 130, width: 150, fit: BoxFit.contain),
                  addVerticalSpace(36),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      label: Text('User ID'),
                      hintText: 'Please input your UserID or Email',
                    ),
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (!isValidUserID(value)) {
                        return 'Please input valid userID';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      enteredUserID = value!;
                    },
                  ),
                  addVerticalSpace(16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(label: Text('Password')),
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (!isValidPassword(value)) {
                        return 'Please input valid Password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      enteredPassword = value!;
                    },
                  ),
                  addVerticalSpace(16),
                  OutlinedButton(
                      onPressed: () {
                        _submit(context);
                      },
                      child: const Text('Sign In')),
                ]),
          ),
        ),
      ),
    );
  }
}
