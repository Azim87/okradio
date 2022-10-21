// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'archive_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArchiveDetailsState {
  int? get id => throw _privateConstructorUsedError;
  List<Archive> get archive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArchiveDetailsStateCopyWith<ArchiveDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArchiveDetailsStateCopyWith<$Res> {
  factory $ArchiveDetailsStateCopyWith(
          ArchiveDetailsState value, $Res Function(ArchiveDetailsState) then) =
      _$ArchiveDetailsStateCopyWithImpl<$Res>;
  $Res call({int? id, List<Archive> archive});
}

/// @nodoc
class _$ArchiveDetailsStateCopyWithImpl<$Res>
    implements $ArchiveDetailsStateCopyWith<$Res> {
  _$ArchiveDetailsStateCopyWithImpl(this._value, this._then);

  final ArchiveDetailsState _value;
  // ignore: unused_field
  final $Res Function(ArchiveDetailsState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? archive = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      archive: archive == freezed
          ? _value.archive
          : archive // ignore: cast_nullable_to_non_nullable
              as List<Archive>,
    ));
  }
}

/// @nodoc
abstract class _$$_ArchiveDetailsStateCopyWith<$Res>
    implements $ArchiveDetailsStateCopyWith<$Res> {
  factory _$$_ArchiveDetailsStateCopyWith(_$_ArchiveDetailsState value,
          $Res Function(_$_ArchiveDetailsState) then) =
      __$$_ArchiveDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call({int? id, List<Archive> archive});
}

/// @nodoc
class __$$_ArchiveDetailsStateCopyWithImpl<$Res>
    extends _$ArchiveDetailsStateCopyWithImpl<$Res>
    implements _$$_ArchiveDetailsStateCopyWith<$Res> {
  __$$_ArchiveDetailsStateCopyWithImpl(_$_ArchiveDetailsState _value,
      $Res Function(_$_ArchiveDetailsState) _then)
      : super(_value, (v) => _then(v as _$_ArchiveDetailsState));

  @override
  _$_ArchiveDetailsState get _value => super._value as _$_ArchiveDetailsState;

  @override
  $Res call({
    Object? id = freezed,
    Object? archive = freezed,
  }) {
    return _then(_$_ArchiveDetailsState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      archive: archive == freezed
          ? _value._archive
          : archive // ignore: cast_nullable_to_non_nullable
              as List<Archive>,
    ));
  }
}

/// @nodoc

class _$_ArchiveDetailsState implements _ArchiveDetailsState {
  const _$_ArchiveDetailsState(
      {this.id, final List<Archive> archive = const []})
      : _archive = archive;

  @override
  final int? id;
  final List<Archive> _archive;
  @override
  @JsonKey()
  List<Archive> get archive {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_archive);
  }

  @override
  String toString() {
    return 'ArchiveDetailsState(id: $id, archive: $archive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArchiveDetailsState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._archive, _archive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_archive));

  @JsonKey(ignore: true)
  @override
  _$$_ArchiveDetailsStateCopyWith<_$_ArchiveDetailsState> get copyWith =>
      __$$_ArchiveDetailsStateCopyWithImpl<_$_ArchiveDetailsState>(
          this, _$identity);
}

abstract class _ArchiveDetailsState implements ArchiveDetailsState {
  const factory _ArchiveDetailsState(
      {final int? id, final List<Archive> archive}) = _$_ArchiveDetailsState;

  @override
  int? get id;
  @override
  List<Archive> get archive;
  @override
  @JsonKey(ignore: true)
  _$$_ArchiveDetailsStateCopyWith<_$_ArchiveDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
