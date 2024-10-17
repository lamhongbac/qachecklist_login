import 'package:flutter/material.dart';
import 'package:qachecklist_login/api/api_auth_services.dart';
import 'package:qachecklist_login/views/home_screen.dart';
import 'package:qachecklist_login/widgets/helpers.dart';

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

  bool isValidPassword(String? password) {
    bool isValid = true;
    if (password == null || password.isEmpty || password.length < 6) {
      isValid = false;
    }
    return isValid;
  }

  //isValidUserID
  bool isValidUserID(String? userID) {
    bool isValid = true;
    if (userID == null || userID.isEmpty || userID.length <= 3) {
      isValid = false;
    }
    return isValid;
  }

  void _submit() async {
    //kiem tra xem co thoa man validator
    final isValid = _formkey.currentState!.validate();

    //chú ý:

    if (isValid) {
      // neu thoa man thuc hien gan data vao entered userID/pass
      _formkey.currentState!.save();
    } else {
      return;
    }
    //thuc hien ham login
    _login();
  }

  void _login() async {
    String message = 'Login Successfully';
    //_isLogin = true;
    ApiAuthService apiAuthService = ApiAuthService();

    await apiAuthService
        .login(enteredUserID, enteredPassword)
        .then((loginResponse) {
      if (!loginResponse.ok) {
        message = 'Login failure, error: ${loginResponse.message}';
      } else {
        if (mounted) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      }
    });
    if (mounted) {
      showInfoMessage(message, context);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  Image.asset('assets/images/Logo2024.png',
                      height: 130, width: 150, fit: BoxFit.contain),
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
                      onPressed: _submit, child: const Text('Sign In')),
                 
                 
                ]),
          ),
        ),
      ),
    );
  }
}
