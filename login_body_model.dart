class LoginBody {
  LoginBody(this._nameORmail, this._password) {
    _loginbody = {
      "query": '''
      query Auth_Login(\$loginData: LoginInput!) {
        Auth_Login(loginData: \$loginData) {
          accessToken
        }
      }
      ''',
      "variables": {
        "loginData": {
          "_deviceType": 0,
          "_email": _nameORmail,
          "_password": _password,
          "_userType": 0,
          "deviceId": "",
          "deviceName": "test",
          "deviceToken": "test",
          "grant_type": "password"
        }
      }
    };
  }

  final String _nameORmail;
  final String _password;
  late final Map<String, dynamic> _loginbody;

  // Getter method to access loginbody
  Map<String, dynamic> get loginbody => _loginbody;
}
