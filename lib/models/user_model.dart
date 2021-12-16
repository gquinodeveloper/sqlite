class UserModel {
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? avatar;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
