import 'package:json_annotation/json_annotation.dart';

part 'ai_request.g.dart';

@JsonSerializable(explicitToJson: true)
class AiRequest {

  AiRequest(
      {required this.model,
      required this.messages});

  @JsonKey(name: "model", defaultValue: "")
  String model;

  @JsonKey(name: "messages", defaultValue: [])
  List<Messages> messages;


  factory AiRequest.fromJson(Map<String, dynamic> json) => _$AiRequestFromJson(json);
  
  Map<String, dynamic> toJson() => _$AiRequestToJson(this);
  
  factory AiRequest.emptyInstance() => AiRequest(model: "", messages: []);
}

@JsonSerializable(explicitToJson: true)
class Messages {

  Messages(
      {required this.role,
      required this.content});

  @JsonKey(name: "role", defaultValue: "")
  String role;

  @JsonKey(name: "content", defaultValue: "")
  String content;


  factory Messages.fromJson(Map<String, dynamic> json) => _$MessagesFromJson(json);
  
  Map<String, dynamic> toJson() => _$MessagesToJson(this);
  
  factory Messages.emptyInstance() => Messages(role: "", content: "");
}


