// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archive_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArchiveState {
  bool get loading => throw _privateConstructorUsedError;
  List<Programs> get programs => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArchiveStateCopyWith<ArchiveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArchiveStateCopyWith<$Res> {
  factory $ArchiveStateCopyWith(
          ArchiveState value, $Res Function(ArchiveState) then) =
      _$ArchiveStateCopyWithImpl<$Res, ArchiveState>;
  @useResult
  $Res call({bool loading, List<Programs> programs, int id});
}

/// @nodoc
class _$ArchiveStateCopyWithImpl<$Res, $Val extends ArchiveState>
    implements $ArchiveStateCopyWith<$Res> {
  _$ArchiveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? programs = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      programs: null == programs
          ? _value.programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<Programs>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArchiveStateCopyWith<$Res>
    implements $ArchiveStateCopyWith<$Res> {
  factory _$$_ArchiveStateCopyWith(
          _$_ArchiveState value, $Res Function(_$_ArchiveState) then) =
      __$$_ArchiveStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<Programs> programs, int id});
}

/// @nodoc
class __$$_ArchiveStateCopyWithImpl<$Res>
    extends _$ArchiveStateCopyWithImpl<$Res, _$_ArchiveState>
    implements _$$_ArchiveStateCopyWith<$Res> {
  __$$_ArchiveStateCopyWithImpl(
      _$_ArchiveState _value, $Res Function(_$_ArchiveState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? programs = null,
    Object? id = null,
  }) {
    return _then(_$_ArchiveState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      programs: null == programs
          ? _value._programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<Programs>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ArchiveState implements _ArchiveState {
  const _$_ArchiveState(
      {this.loading = false,
      final List<Programs> programs = const [],
      this.id = 0})
      : _programs = programs;

  @override
  @JsonKey()
  final bool loading;
  final List<Programs> _programs;
  @override
  @JsonKey()
  List<Programs> get programs {
    if (_programs is EqualUnmodifiableListView) return _programs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_programs);
  }

  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'ArchiveState(loading: $loading, programs: $programs, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArchiveState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._programs, _programs) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_programs), id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArchiveStateCopyWith<_$_ArchiveState> get copyWith =>
      __$$_ArchiveStateCopyWithImpl<_$_ArchiveState>(this, _$identity);
}

abstract class _ArchiveState implements ArchiveState {
  const factory _ArchiveState(
      {final bool loading,
      final List<Programs> programs,
      final int id}) = _$_ArchiveState;

  @override
  bool get loading;
  @override
  List<Programs> get programs;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_ArchiveStateCopyWith<_$_ArchiveState> get copyWith =>
      throw _privateConstructorUsedError;
}
