import 'package:flutter/material.dart';
import '../../core/services/auth.dart';
import '../../commons/models/user.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final Auth _auth = Auth();
  User _user = User();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();

  submit(BuildContext context) async {
    String message;
    _formSignInKey.currentState.save();

    try {
      _user = (await _auth.signIn(_user.email, _user.password));
      print('User ===> ${_user.email}');
      message = 'User sucessfully logged in!';
      if (!_user.confirmed) {
        message = 'Please confirm user account';
      }
    } on CognitoClientException catch (e) {
      if (e.code == 'InvalidParameterException' ||
          e.code == 'NotAuthorizedException' ||
          e.code == 'UserNotFoundException') {
        message = e.message;
      } else {
        message = 'An unknown client error occured';
      }
    } catch (e) {
      message = 'An unknown error occurred';
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 30),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formSignInKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SizedBox(
            width: 350,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                // Container(
                //     alignment: Alignment.center,
                //     padding: const EdgeInsets.all(10),
                //     child: const Text(
                //       'Logo Here',
                //       style: TextStyle(
                //           color: Colors.blue,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 30),
                //     )),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(70, 0, 70, 20),
                  child: Image.asset('images/black_orange.png'),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }

                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (email) {
                      _user.email = email;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (password) {
                      _user.password = password;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                Container(
                  height: 70,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      if (_formSignInKey.currentState.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.

                        submit(context);

                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Processing Data')),
                        // );
                      }
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign up',
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
