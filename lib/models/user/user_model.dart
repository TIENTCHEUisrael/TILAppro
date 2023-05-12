class User {
  final String? idUser;
  final String name;
  final String password;
  final String email;
  final String role;
  final String? createdAt;

  User({
    this.idUser,
    required this.name,
    required this.password,
    required this.email,
    required this.role,
    this.createdAt,
  });

  factory User.fromJson(dynamic json) {
    return User(
      idUser: json['_id'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "_id": idUser,
        "name": name,
        "password": password,
        "email": email,
        "role": role,
        "CreatedAt": createdAt,
      };

  static List<User> usersFromSnapshots(List snapshot) {
    return snapshot.map((data) => User.fromJson(data)).toList();
  }

  static User userFromSnapshot(User snapshot) {
    return snapshot;
  }

  @override
  String toString() {
    return "User {_id:$idUser,name: $name,password: $password,email: $email, role:$role,CreatedAt: $createdAt,}";
  }
}

User USER_DATA = User(
  name: "name",
  password: "password",
  email: "email",
  role: "role",
);
