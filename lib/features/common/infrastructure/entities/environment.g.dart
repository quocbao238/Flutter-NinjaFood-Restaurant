// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Environment _$$_EnvironmentFromJson(Map<String, dynamic> json) =>
    _$_Environment(
      supabaseUrl: json['supabaseUrl'] as String,
      supabaseAnonKey: json['supabaseAnonKey'] as String,
      supabaseAuthCallbackUrlHostname:
          json['supabaseAuthCallbackUrlHostname'] as String?,
    );

Map<String, dynamic> _$$_EnvironmentToJson(_$_Environment instance) =>
    <String, dynamic>{
      'supabaseUrl': instance.supabaseUrl,
      'supabaseAnonKey': instance.supabaseAnonKey,
      'supabaseAuthCallbackUrlHostname':
          instance.supabaseAuthCallbackUrlHostname,
    };
