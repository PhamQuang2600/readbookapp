class Users {
  final String id;
  final String? name;
  final String? password;
  final String? email;
  final String? address;
  final String? image;
  const Users(
      {required this.id,
      this.name,
      this.password,
      this.email,
      this.address,
      this.image});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      id: json['id'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
      address: json['address'],
      image: json['image']);

  toJson() =>
      {'name': name, 'password': password, 'email': email, 'address': address};
}

class SignUp {
  String? name;
  String? address;
  String? email;
  String? password;
  SignUp({this.name, this.address, this.email, this.password});
  Map<String, dynamic> toJson() =>
      {'name': name, 'address': address, 'email': email, 'password': password};
}

class SignIn {
  String account;
  String password;
  SignIn(this.account, this.password);

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        json['account'],
        json['password'],
      );
}
