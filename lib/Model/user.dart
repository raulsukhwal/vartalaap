class ChatUser {
  ChatUser({
    this.id,
    this.firstName,
    this.email,
    this.lastName,
    this.mobile,
    this.chatIds,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  List<String>? chatIds;

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json["id"] ?? "",
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      mobile: json["mobile"] ?? "",
      email: json["email"] ?? "",
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
        "chatIds": chatIds!.map((x) => x).toList(),
      };
}
