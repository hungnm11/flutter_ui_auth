import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dashboard/widgets/login/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../commons//models/user.dart';
import '../../core/services/auth.dart';

class ConfirmationScreen extends StatefulWidget {
  ConfirmationScreen({Key key, this.email}) : super(key: key);

  final String email;

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String confirmationCode;
  User _user = User();
  final _Auth = Auth();

  _submit(BuildContext context) async {
    _formKey.currentState.save();
    bool accountConfirmed;
    String message;
    try {
      accountConfirmed =
          await _Auth.confirmAccount(_user.email, confirmationCode);
      message = 'Account successfully confirmed!';
    } on CognitoClientException catch (e) {
      if (e.code == 'InvalidParameterException' ||
          e.code == 'CodeMismatchException' ||
          e.code == 'NotAuthorizedException' ||
          e.code == 'UserNotFoundException' ||
          e.code == 'ResourceNotFoundException') {
        message = e.message;
      } else {
        message = 'Unknown client error occurred';
      }
    } catch (e) {
      message = 'Unknown error occurred';
    }

    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          if (accountConfirmed) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginScreen(email: _user.email)),
            );
          }
        },
      ),
      duration: Duration(seconds: 30),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Account'),
      ),
      body: Builder(
          builder: (BuildContext context) => Container(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: TextFormField(
                          initialValue: widget.email,
                          decoration: InputDecoration(
                              hintText: 'example@inspire.my',
                              labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String email) {
                            _user.email = email;
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.lock),
                        title: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Confirmation Code'),
                          onSaved: (String code) {
                            confirmationCode = code;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        width: screenSize.width,
                        child: RaisedButton(
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _submit(context);
                          },
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.only(
                          top: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
