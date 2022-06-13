class User {
  String name, email, password;

  User({required this.name, required this.email, required this.password});

  Map<String, dynamic> get map {
    return {
      'email': email,
      'name':name,
      'password':password

    };
  }
}
