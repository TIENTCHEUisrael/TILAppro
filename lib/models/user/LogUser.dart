class LogUser {
  final String email;
  final String password;

  LogUser({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
