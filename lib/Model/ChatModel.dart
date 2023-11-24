class ChatModel {
  String? name;
  String? phoneNumber;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool select = false;
  int? id;

  ChatModel({
    this.name,
    this.icon,
    this.phoneNumber,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select = false,
    this.id,
  });
}
