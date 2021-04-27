import 'dart:convert';

class User {
  int id;
  String username;
  String email;

  User({
    this.id,
    this.username,
    this.email,
  });

  static User fromJSON(String jsonUser) {
    return User.fromMap(json.decode(jsonUser));
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['user_id'],
      username: map['username'],
      email: map['email'],
    );
  }

  String toJSON() {
    return json.encode(this.toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': this.id,
      'username': this.username,
      'email': this.email,
    };
  }
}

class UserWidget {
  String username;
  UserWidget({this.username}) {
    this.username = this.username ?? 'no inicio';
  }
}