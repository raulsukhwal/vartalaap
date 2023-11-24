class ChatUser {
  ChatUser(
      {this.id,
      this.firstName,
      this.email,
      this.lastName,
      this.mobile,
      this.chatIds,
      this.gender});

  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  List<String>? chatIds;
  String? gender;

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json["id"] ?? "",
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      mobile: json["mobile"] ?? "",
      email: json["email"] ?? "",
      gender: json["gender"],
      chatIds: json["chatIds"] == null
          ? []
          : List<String>.from(json["chatIds"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "gender": gender,
        "chatIds": chatIds?.map((x) => x).toList() ?? [],
      };
}
