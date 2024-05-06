// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiResponse _$AiResponseFromJson(Map<String, dynamic> json) => AiResponse(
      id: json['id'] as String? ?? '',
      object: json['object'] as String? ?? '',
      created: (json['created'] as num?)?.toInt() ?? 0,
      model: json['model'] as String? ?? '',
      systemFingerprint: json['system_fingerprint'] as String? ?? '',
      choices: (json['choices'] as List<dynamic>?)
              ?.map((e) => Choices.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      usage: json['usage'] == null
          ? Usage.emptyInstance()
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AiResponseToJson(AiResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'system_fingerprint': instance.systemFingerprint,
      'choices': instance.choices.map((e) => e.toJson()).toList(),
      'usage': instance.usage.toJson(),
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      role: json['role'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };

Choices _$ChoicesFromJson(Map<String, dynamic> json) => Choices(
      index: (json['index'] as num?)?.toInt() ?? 0,
      message: json['message'] == null
          ? Message.emptyInstance()
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      logprobs: json['logprobs'],
      finishReason: json['finish_reason'] as String? ?? '',
    );

Map<String, dynamic> _$ChoicesToJson(Choices instance) => <String, dynamic>{
      'index': instance.index,
      'message': instance.message.toJson(),
      'logprobs': instance.logprobs,
      'finish_reason': instance.finishReason,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      promptTokens: (json['prompt_tokens'] as num?)?.toInt() ?? 0,
      completionTokens: (json['completion_tokens'] as num?)?.toInt() ?? 0,
      totalTokens: (json['total_tokens'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };
