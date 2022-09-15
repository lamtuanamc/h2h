class User {
  User({
    this.name,
    this.phoneNumber,
  });

  String? name;
  String? phoneNumber;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
      };
}
