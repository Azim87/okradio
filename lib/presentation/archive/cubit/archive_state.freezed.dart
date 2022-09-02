// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'archive_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArchiveState {
  int? get id => throw _privateConstructorUsedError;
  List<Archive> get archives => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArchiveStateCopyWith<ArchiveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArchiveStateCopyWith<$Res> {
  factory $ArchiveStateCopyWith(
          ArchiveState value, $Res Function(ArchiveState) then) =
      _$ArchiveStateCopyWithImpl<$Res>;
  $Res call({int? id, List<Archive> archives});
}

/// @nodoc
class _$ArchiveStateCopyWithImpl<$Res> implements $ArchiveStateCopyWith<$Res> {
  _$ArchiveStateCopyWithImpl(this._value, this._then);

  final ArchiveState _value;
  // ignore: unused_field
  final $Res Function(ArchiveState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? archives = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      archives: archives == freezed
          ? _value.archives
          : archives // ignore: cast_nullable_to_non_nullable
              as List<Archive>,
    ));
  }
}

/// @nodoc
abstract class _$$_ArchiveStateCopyWith<$Res>
    implements $ArchiveStateCopyWith<$Res> {
  factory _$$_ArchiveStateCopyWith(
          _$_ArchiveState value, $Res Function(_$_ArchiveState) then) =
      __$$_ArchiveStateCopyWithImpl<$Res>;
  @override
  $Res call({int? id, List<Archive> archives});
}

/// @nodoc
class __$$_ArchiveStateCopyWithImpl<$Res>
    extends _$ArchiveStateCopyWithImpl<$Res>
    implements _$$_ArchiveStateCopyWith<$Res> {
  __$$_ArchiveStateCopyWithImpl(
      _$_ArchiveState _value, $Res Function(_$_ArchiveState) _then)
      : super(_value, (v) => _then(v as _$_ArchiveState));

  @override
  _$_ArchiveState get _value => super._value as _$_ArchiveState;

  @override
  $Res call({
    Object? id = freezed,
    Object? archives = freezed,
  }) {
    return _then(_$_ArchiveState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      archives: archives == freezed
          ? _value._archives
          : archives // ignore: cast_nullable_to_non_nullable
              as List<Archive>,
    ));
  }
}

/// @nodoc

class _$_ArchiveState implements _ArchiveState {
  const _$_ArchiveState({this.id, final List<Archive> archives = const []})
      : _archives = archives;

  @override
  final int? id;
  final List<Archive> _archives;
  @override
  @JsonKey()
  List<Archive> get archives {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_archives);
  }

  @override
  String toString() {
    return 'ArchiveState(id: $id, archives: $archives)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArchiveState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._archives, _archives));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_archives));

  @JsonKey(ignore: true)
  @override
  _$$_ArchiveStateCopyWith<_$_ArchiveState> get copyWith =>
      __$$_ArchiveStateCopyWithImpl<_$_ArchiveState>(this, _$identity);
}

abstract class _ArchiveState implements ArchiveState {
  const factory _ArchiveState({final int? id, final List<Archive> archives}) =
      _$_ArchiveState;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  List<Archive> get archives => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ArchiveStateCopyWith<_$_ArchiveState> get copyWith =>
      throw _privateConstructorUsedError;
}
