import '../../commons/models/user.dart';
import '../config/secret.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'storage.dart';

class Auth {
  final userPool = CognitoUserPool(cognitoUserPoolId, cognitoClientId);
  CustomStorage customStore = CustomStorage('custom:');
  CognitoUser cognitoUser;
  CognitoUserSession session;
  CognitoCredentials credentials;
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<bool> init() async {
    final getUser = await userPool.getCurrentUser();
    if (getUser == null) {
      return false;
    }

    final getSession = await getUser.getSession();
    return getSession.isValid();
  }

  Future<User> signIn(email, password) async {
    final cognitoUser = CognitoUser(email, userPool, storage: customStore);
    final authDetails = AuthenticationDetails(
      username: email,
      password: password,
    );

    session = await cognitoUser.authenticateUser(authDetails);

    if (!session.isValid()) {
      return null;
    }

    bool isConfirmed = true;
    try {
      session = await cognitoUser.authenticateUser(authDetails);
    } on CognitoClientException catch (e) {
      if (e.code == 'UserNotConfirmedException') {
        isConfirmed = false;
      } else {
        throw e;
      }
    }

    if (!session.isValid()) {
      return null;
    }

    final attributes = await cognitoUser.getUserAttributes();
    final user = User.fromUserAttributes(attributes);
    user.confirmed = isConfirmed;
    user.hasAccess = true;

    return user;
  }

  Future<bool> checkAuthenticated() async {
    if (cognitoUser == null || session == null) {
      return false;
    }
    return session.isValid();
  }

  Future<bool> confirmAccount(String email, String confirmationCode) async {
    cognitoUser = CognitoUser(email, userPool, storage: customStore);

    return await cognitoUser.confirmRegistration(confirmationCode);
  }
}
