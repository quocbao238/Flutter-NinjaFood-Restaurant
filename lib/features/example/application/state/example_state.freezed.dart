// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExampleState {
  ExampleData get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExampleData data) initState,
    required TResult Function(ExampleData data) loadedState,
    required TResult Function(ExampleData data) pressedButtonState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExampleData data)? initState,
    TResult? Function(ExampleData data)? loadedState,
    TResult? Function(ExampleData data)? pressedButtonState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExampleData data)? initState,
    TResult Function(ExampleData data)? loadedState,
    TResult Function(ExampleData data)? pressedButtonState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitState value) initState,
    required TResult Function(LoadedState value) loadedState,
    required TResult Function(OnPressedButtonState value) pressedButtonState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitState value)? initState,
    TResult? Function(LoadedState value)? loadedState,
    TResult? Function(OnPressedButtonState value)? pressedButtonState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitState value)? initState,
    TResult Function(LoadedState value)? loadedState,
    TResult Function(OnPressedButtonState value)? pressedButtonState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExampleStateCopyWith<ExampleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleStateCopyWith<$Res> {
  factory $ExampleStateCopyWith(
          ExampleState value, $Res Function(ExampleState) then) =
      _$ExampleStateCopyWithImpl<$Res, ExampleState>;
  @useResult
  $Res call({ExampleData data});

  $ExampleDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ExampleStateCopyWithImpl<$Res, $Val extends ExampleState>
    implements $ExampleStateCopyWith<$Res> {
  _$ExampleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ExampleData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExampleDataCopyWith<$Res> get data {
    return $ExampleDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitStateCopyWith<$Res>
    implements $ExampleStateCopyWith<$Res> {
  factory _$$InitStateCopyWith(
          _$InitState value, $Res Function(_$InitState) then) =
      __$$InitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExampleData data});

  @override
  $ExampleDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$InitStateCopyWithImpl<$Res>
    extends _$ExampleStateCopyWithImpl<$Res, _$InitState>
    implements _$$InitStateCopyWith<$Res> {
  __$$InitStateCopyWithImpl(
      _$InitState _value, $Res Function(_$InitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$InitState(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ExampleData,
    ));
  }
}

/// @nodoc

class _$InitState implements InitState {
  const _$InitState({required this.data});

  @override
  final ExampleData data;

  @override
  String toString() {
    return 'ExampleState.initState(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitState &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitStateCopyWith<_$InitState> get copyWith =>
      __$$InitStateCopyWithImpl<_$InitState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExampleData data) initState,
    required TResult Function(ExampleData data) loadedState,
    required TResult Function(ExampleData data) pressedButtonState,
  }) {
    return initState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExampleData data)? initState,
    TResult? Function(ExampleData data)? loadedState,
    TResult? Function(ExampleData data)? pressedButtonState,
  }) {
    return initState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExampleData data)? initState,
    TResult Function(ExampleData data)? loadedState,
    TResult Function(ExampleData data)? pressedButtonState,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitState value) initState,
    required TResult Function(LoadedState value) loadedState,
    required TResult Function(OnPressedButtonState value) pressedButtonState,
  }) {
    return initState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitState value)? initState,
    TResult? Function(LoadedState value)? loadedState,
    TResult? Function(OnPressedButtonState value)? pressedButtonState,
  }) {
    return initState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitState value)? initState,
    TResult Function(LoadedState value)? loadedState,
    TResult Function(OnPressedButtonState value)? pressedButtonState,
    required TResult orElse(),
  }) {
    if (initState != null) {
      return initState(this);
    }
    return orElse();
  }
}

abstract class InitState implements ExampleState {
  const factory InitState({required final ExampleData data}) = _$InitState;

  @override
  ExampleData get data;
  @override
  @JsonKey(ignore: true)
  _$$InitStateCopyWith<_$InitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedStateCopyWith<$Res>
    implements $ExampleStateCopyWith<$Res> {
  factory _$$LoadedStateCopyWith(
          _$LoadedState value, $Res Function(_$LoadedState) then) =
      __$$LoadedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExampleData data});

  @override
  $ExampleDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoadedStateCopyWithImpl<$Res>
    extends _$ExampleStateCopyWithImpl<$Res, _$LoadedState>
    implements _$$LoadedStateCopyWith<$Res> {
  __$$LoadedStateCopyWithImpl(
      _$LoadedState _value, $Res Function(_$LoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedState(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ExampleData,
    ));
  }
}

/// @nodoc

class _$LoadedState implements LoadedState {
  const _$LoadedState({required this.data});

  @override
  final ExampleData data;

  @override
  String toString() {
    return 'ExampleState.loadedState(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedState &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedStateCopyWith<_$LoadedState> get copyWith =>
      __$$LoadedStateCopyWithImpl<_$LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExampleData data) initState,
    required TResult Function(ExampleData data) loadedState,
    required TResult Function(ExampleData data) pressedButtonState,
  }) {
    return loadedState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExampleData data)? initState,
    TResult? Function(ExampleData data)? loadedState,
    TResult? Function(ExampleData data)? pressedButtonState,
  }) {
    return loadedState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExampleData data)? initState,
    TResult Function(ExampleData data)? loadedState,
    TResult Function(ExampleData data)? pressedButtonState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitState value) initState,
    required TResult Function(LoadedState value) loadedState,
    required TResult Function(OnPressedButtonState value) pressedButtonState,
  }) {
    return loadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitState value)? initState,
    TResult? Function(LoadedState value)? loadedState,
    TResult? Function(OnPressedButtonState value)? pressedButtonState,
  }) {
    return loadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitState value)? initState,
    TResult Function(LoadedState value)? loadedState,
    TResult Function(OnPressedButtonState value)? pressedButtonState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(this);
    }
    return orElse();
  }
}

abstract class LoadedState implements ExampleState {
  const factory LoadedState({required final ExampleData data}) = _$LoadedState;

  @override
  ExampleData get data;
  @override
  @JsonKey(ignore: true)
  _$$LoadedStateCopyWith<_$LoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnPressedButtonStateCopyWith<$Res>
    implements $ExampleStateCopyWith<$Res> {
  factory _$$OnPressedButtonStateCopyWith(_$OnPressedButtonState value,
          $Res Function(_$OnPressedButtonState) then) =
      __$$OnPressedButtonStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExampleData data});

  @override
  $ExampleDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$OnPressedButtonStateCopyWithImpl<$Res>
    extends _$ExampleStateCopyWithImpl<$Res, _$OnPressedButtonState>
    implements _$$OnPressedButtonStateCopyWith<$Res> {
  __$$OnPressedButtonStateCopyWithImpl(_$OnPressedButtonState _value,
      $Res Function(_$OnPressedButtonState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$OnPressedButtonState(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ExampleData,
    ));
  }
}

/// @nodoc

class _$OnPressedButtonState implements OnPressedButtonState {
  const _$OnPressedButtonState({required this.data});

  @override
  final ExampleData data;

  @override
  String toString() {
    return 'ExampleState.pressedButtonState(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPressedButtonState &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPressedButtonStateCopyWith<_$OnPressedButtonState> get copyWith =>
      __$$OnPressedButtonStateCopyWithImpl<_$OnPressedButtonState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExampleData data) initState,
    required TResult Function(ExampleData data) loadedState,
    required TResult Function(ExampleData data) pressedButtonState,
  }) {
    return pressedButtonState(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExampleData data)? initState,
    TResult? Function(ExampleData data)? loadedState,
    TResult? Function(ExampleData data)? pressedButtonState,
  }) {
    return pressedButtonState?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExampleData data)? initState,
    TResult Function(ExampleData data)? loadedState,
    TResult Function(ExampleData data)? pressedButtonState,
    required TResult orElse(),
  }) {
    if (pressedButtonState != null) {
      return pressedButtonState(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitState value) initState,
    required TResult Function(LoadedState value) loadedState,
    required TResult Function(OnPressedButtonState value) pressedButtonState,
  }) {
    return pressedButtonState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitState value)? initState,
    TResult? Function(LoadedState value)? loadedState,
    TResult? Function(OnPressedButtonState value)? pressedButtonState,
  }) {
    return pressedButtonState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitState value)? initState,
    TResult Function(LoadedState value)? loadedState,
    TResult Function(OnPressedButtonState value)? pressedButtonState,
    required TResult orElse(),
  }) {
    if (pressedButtonState != null) {
      return pressedButtonState(this);
    }
    return orElse();
  }
}

abstract class OnPressedButtonState implements ExampleState {
  const factory OnPressedButtonState({required final ExampleData data}) =
      _$OnPressedButtonState;

  @override
  ExampleData get data;
  @override
  @JsonKey(ignore: true)
  _$$OnPressedButtonStateCopyWith<_$OnPressedButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}
