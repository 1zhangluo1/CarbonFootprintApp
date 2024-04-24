import 'package:json_annotation/json_annotation.dart';

part 'ai_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AiResponse {

  AiResponse(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required this.systemFingerprint,
      required this.choices,
      required this.usage});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "object", defaultValue: "")
  String object;

  @JsonKey(name: "created", defaultValue: 0)
  int created;

  @JsonKey(name: "model", defaultValue: "")
  String model;

  @JsonKey(name: "system_fingerprint", defaultValue: "")
  String systemFingerprint;

  @JsonKey(name: "choices", defaultValue: [])
  List<Choices> choices;

  @JsonKey(name: "usage", defaultValue: Usage.emptyInstance)
  Usage usage;


  factory AiResponse.fromJson(Map<String, dynamic> json) => _$AiResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$AiResponseToJson(this);
  
  factory AiResponse.emptyInstance() => AiResponse(id: "", object: "", created: 0, model: "", systemFingerprint: "", choices: [], usage: Usage.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Message {

  Message(
      {required this.role,
      required this.content});

  @JsonKey(name: "role", defaultValue: "")
  String role;

  @JsonKey(name: "content", defaultValue: "")
  String content;


  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  
  Map<String, dynamic> toJson() => _$MessageToJson(this);
  
  factory Message.emptyInstance() => Message(role: "", content: "");
}

@JsonSerializable(explicitToJson: true)
class Choices {

  Choices(
      {required this.index,
      required this.message,
      this.logprobs,
      required this.finishReason});

  @JsonKey(name: "index", defaultValue: 0)
  int index;

  @JsonKey(name: "message", defaultValue: Message.emptyInstance)
  Message message;

  @JsonKey(name: "logprobs")
  dynamic logprobs;

  @JsonKey(name: "finish_reason", defaultValue: "")
  String finishReason;


  factory Choices.fromJson(Map<String, dynamic> json) => _$ChoicesFromJson(json);
  
  Map<String, dynamic> toJson() => _$ChoicesToJson(this);
  
  factory Choices.emptyInstance() => Choices(index: 0, message: Message.emptyInstance(), finishReason: "");
}

@JsonSerializable(explicitToJson: true)
class Usage {

  Usage(
      {required this.promptTokens,
      required this.completionTokens,
      required this.totalTokens});

  @JsonKey(name: "prompt_tokens", defaultValue: 0)
  int promptTokens;

  @JsonKey(name: "completion_tokens", defaultValue: 0)
  int completionTokens;

  @JsonKey(name: "total_tokens", defaultValue: 0)
  int totalTokens;


  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
  
  Map<String, dynamic> toJson() => _$UsageToJson(this);
  
  factory Usage.emptyInstance() => Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0);
}


