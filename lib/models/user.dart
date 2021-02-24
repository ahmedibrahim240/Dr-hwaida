class User {
  static String userToken;
  static String userName;
  static String userPhoneNum;
  static String userAge;
  static String userStutes;
  static String userGender;
  static String userPassword;
  static bool userLogIn;
  static bool userSkipLogIn;
}

class Users {
  final String userToken;
  final String phoneNumber;
  final String name;
  final String email;
  final String userImageUrl;
  final String userAge;
  final String userStutes;
  final String userGender;

  Users({
    this.userAge,
    this.userStutes,
    this.userGender,
    this.name,
    this.email,
    this.phoneNumber,
    this.userImageUrl,
    this.userToken,
  });
}
