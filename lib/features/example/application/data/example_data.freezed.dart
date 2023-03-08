// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExampleData {
  String? get exampleText => throw _privateConstructorUsedError;
  int? get exampleInt => throw _privateConstructorUsedError;
  double? get exampleDouble => throw _privateConstructorUsedError;
  List<String>? get listString => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExampleDataCopyWith<ExampleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleDataCopyWith<$Res> {
  factory $ExampleDataCopyWith(
          ExampleData value, $Res Function(ExampleData) then) =
      _$ExampleDataCopyWithImpl<$Res, ExampleData>;
  @useResult
  $Res call(
      {String? exampleText,
      int? exampleInt,
      double? exampleDouble,
      List<String>? listString});
}

/// @nodoc
class _$ExampleDataCopyWithImpl<$Res, $Val extends ExampleData>
    implements $ExampleDataCopyWith<$Res> {
  _$ExampleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exampleText = freezed,
    Object? exampleInt = freezed,
    Object? exampleDouble = freezed,
    Object? listString = freezed,
  }) {
    return _then(_value.copyWith(
      exampleText: freezed == exampleText
          ? _value.exampleText
          : exampleText // ignore: cast_nullable_to_non_nullable
              as String?,
      exampleInt: freezed == exampleInt
          ? _value.exampleInt
          : exampleInt // ignore: cast_nullable_to_non_nullable
              as int?,
      exampleDouble: freezed == exampleDouble
          ? _value.exampleDouble
          : exampleDouble // ignore: cast_nullable_to_non_nullable
              as double?,
      listString: freezed == listString
          ? _value.listString
          : listString // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExampleDataCopyWith<$Res>
    implements $ExampleDataCopyWith<$Res> {
  factory _$$_ExampleDataCopyWith(
          _$_ExampleData value, $Res Function(_$_ExampleData) then) =
      __$$_ExampleDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? exampleText,
      int? exampleInt,
      double? exampleDouble,
      List<String>? listString});
}

/// @nodoc
class __$$_ExampleDataCopyWithImpl<$Res>
    extends _$ExampleDataCopyWithImpl<$Res, _$_ExampleData>
    implements _$$_ExampleDataCopyWith<$Res> {
  __$$_ExampleDataCopyWithImpl(
      _$_ExampleData _value, $Res Function(_$_ExampleData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exampleText = freezed,
    Object? exampleInt = freezed,
    Object? exampleDouble = freezed,
    Object? listString = freezed,
  }) {
    return _then(_$_ExampleData(
      exampleText: freezed == exampleText
          ? _value.exampleText
          : exampleText // ignore: cast_nullable_to_non_nullable
              as String?,
      exampleInt: freezed == exampleInt
          ? _value.exampleInt
          : exampleInt // ignore: cast_nullable_to_non_nullable
              as int?,
      exampleDouble: freezed == exampleDouble
          ? _value.exampleDouble
          : exampleDouble // ignore: cast_nullable_to_non_nullable
              as double?,
      listString: freezed == listString
          ? _value._listString
          : listString // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_ExampleData implements _ExampleData {
  const _$_ExampleData(
      {this.exampleText,
      this.exampleInt,
      this.exampleDouble,
      final List<String>? listString})
      : _listString = listString;

  @override
  final String? exampleText;
  @override
  final int? exampleInt;
  @override
  final double? exampleDouble;
  final List<String>? _listString;
  @override
  List<String>? get listString {
    final value = _listString;
    if (value == null) return null;
    if (_listString is EqualUnmodifiableListView) return _listString;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExampleData(exampleText: $exampleText, exampleInt: $exampleInt, exampleDouble: $exampleDouble, listString: $listString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExampleData &&
            (identical(other.exampleText, exampleText) ||
                other.exampleText == exampleText) &&
            (identical(other.exampleInt, exampleInt) ||
                other.exampleInt == exampleInt) &&
            (identical(other.exampleDouble, exampleDouble) ||
                other.exampleDouble == exampleDouble) &&
            const DeepCollectionEquality()
                .equals(other._listString, _listString));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exampleText, exampleInt,
      exampleDouble, const DeepCollectionEquality().hash(_listString));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExampleDataCopyWith<_$_ExampleData> get copyWith =>
      __$$_ExampleDataCopyWithImpl<_$_ExampleData>(this, _$identity);
}

abstract class _ExampleData implements ExampleData {
  const factory _ExampleData(
      {final String? exampleText,
      final int? exampleInt,
      final double? exampleDouble,
      final List<String>? listString}) = _$_ExampleData;

  @override
  String? get exampleText;
  @override
  int? get exampleInt;
  @override
  double? get exampleDouble;
  @override
  List<String>? get listString;
  @override
  @JsonKey(ignore: true)
  _$$_ExampleDataCopyWith<_$_ExampleData> get copyWith =>
      throw _privateConstructorUsedError;
}
