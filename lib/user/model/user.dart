class User{
  int user_id;
  String user_fullname;
  String user_username;
  String user_email;
  String user_password;

  User(
      this.user_id,
      this.user_fullname,
      this.user_username,
      this.user_email,
      this.user_password,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    int.parse(json["id"]),
    json["fullname"],
    json["username"],
    json["email"],
    json["password"],
  );

  Map<String, dynamic> toJson() => {
    'id': user_id.toString(),
    'fullname': user_fullname,
    'username': user_username,
    'email': user_email,
    'password': user_password,
  };
}