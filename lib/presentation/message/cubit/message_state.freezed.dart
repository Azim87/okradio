// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageState {
  String? get name => throw _privateConstructorUsedError;
  String? get emailOrPhone => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageStateCopyWith<MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res>;
  $Res call({String? name, String? emailOrPhone, String? message});
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res> implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  final MessageState _value;
  // ignore: unused_field
  final $Res Function(MessageState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? emailOrPhone = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      emailOrPhone: emailOrPhone == freezed
          ? _value.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_MessageStateCopyWith<$Res>
    implements $MessageStateCopyWith<$Res> {
  factory _$$_MessageStateCopyWith(
          _$_MessageState value, $Res Function(_$_MessageState) then) =
      __$$_MessageStateCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? emailOrPhone, String? message});
}

/// @nodoc
class __$$_MessageStateCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res>
    implements _$$_MessageStateCopyWith<$Res> {
  __$$_MessageStateCopyWithImpl(
      _$_MessageState _value, $Res Function(_$_MessageState) _then)
      : super(_value, (v) => _then(v as _$_MessageState));

  @override
  _$_MessageState get _value => super._value as _$_MessageState;

  @override
  $Res call({
    Object? name = freezed,
    Object? emailOrPhone = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_MessageState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      emailOrPhone: emailOrPhone == freezed
          ? _value.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MessageState implements _MessageState {
  const _$_MessageState({this.name, this.emailOrPhone, this.message});

  @override
  final String? name;
  @override
  final String? emailOrPhone;
  @override
  final String? message;

  @override
  String toString() {
    return 'MessageState(name: $name, emailOrPhone: $emailOrPhone, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.emailOrPhone, emailOrPhone) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(emailOrPhone),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_MessageStateCopyWith<_$_MessageState> get copyWith =>
      __$$_MessageStateCopyWithImpl<_$_MessageState>(this, _$identity);
}

abstract class _MessageState implements MessageState {
  const factory _MessageState(
      {final String? name,
      final String? emailOrPhone,
      final String? message}) = _$_MessageState;

  @override
  String? get name;
  @override
  String? get emailOrPhone;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_MessageStateCopyWith<_$_MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}
