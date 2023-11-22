//import 'package:padi/user/authentication/signup.dart';

class database {
  static const hostConnect = "http://192.168.0.122/database_padi";
  static const hostConnectUser = "$hostConnect/user";

  //signup user
  static const signUp = "$hostConnect/user/signup.php";
  //static const validateEmail = "$hostConnect/user/validate_email.php";
  static const login = "$hostConnect/user/login.php";
}