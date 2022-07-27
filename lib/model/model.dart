import 'dart:convert';

class User {
  String fname;
  String lname;
  String email;
  String password;
  String phoneNumber;
  String client;
  User({
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.client,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'fname': fname});
    result.addAll({'lname': lname});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'client': client});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      fname: map['userDetails']['first_name'] ?? '',
      lname: map['userDetails']['last_name'] ?? '',
      email: map['userDetails']['email'] ?? '',
      password: map['userDetails']['password'] ?? '',
      phoneNumber: map['userDetails']['phoneNumber'] ?? 0,
      client: map['userType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

class Post {
  String email;
  String title;
  String body;
  Post({
    required this.email,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'email': email});
    result.addAll({'title': title});
    result.addAll({'body': body});
  
    return result;
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      email: map['email'] ?? '',
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}
