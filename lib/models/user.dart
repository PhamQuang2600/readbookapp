class Users {
  final String? id;
  final String? name;
  final String? password;
  final String? email;
  final String? address;
  final String? image;
  const Users(
      {this.id,
      this.name,
      this.password,
      this.email,
      this.address,
      this.image});

  factory Users.fromJson(json) => Users(
      id: json.id,
      name: json['name'],
      password: json['password'],
      email: json['email'],
      address: json['address'],
      image: json['image']);

  toJson() => {
        'name': name,
        'password': password,
        'email': email,
        'address': address,
        image: ''
      };
}
