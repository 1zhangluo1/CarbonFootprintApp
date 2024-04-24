// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiRequest _$AiRequestFromJson(Map<String, dynamic> json) => AiRequest(
      model: json['model'] as String? ?? '',
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => Messages.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AiRequestToJson(AiRequest instance) => <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };

Messages _$MessagesFromJson(Map<String, dynamic> json) => Messages(
      role: json['role'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$MessagesToJson(Messages instance) => <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
