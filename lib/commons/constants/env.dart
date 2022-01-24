enum Environment { TEST, STAGING, PRODUCTION }

class Env {
  static final String domainServiceEndPoint =
      "https://domain.service.adstart.dev/";
  static final String cognitoUserPoolId = "eu-west-1_pWfQn1rCP";
  static final String clientId = "5jq3rd1fcghb8bec96hvoj0pf2";
  static final String resetCognitoPasswordPageUrl =
      "https://dashboard.identity.adstart.dev/login?client_id=bnvtvqoaji6ttbltsim9thdes&response_type=code&scope=aws.cognito.signin.user.admin+email+openid+profile&redirect_uri=https://dashboard.adstart.dev";
  static final String dailyReportServiceEndPoint =
      "https://core.adstart.dev/v1/reports/";
  static final Environment environment = Environment.TEST;

  static bool isProduction() {
    return environment == Environment.PRODUCTION;
  }

  static bool isStaging() {
    return environment == Environment.STAGING;
  }

  static bool isTest() {
    return environment == Environment.TEST;
  }
}
