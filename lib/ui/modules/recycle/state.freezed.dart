// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecycleState {
  History? get listHistory => throw _privateConstructorUsedError;
  States get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecycleStateCopyWith<RecycleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecycleStateCopyWith<$Res> {
  factory $RecycleStateCopyWith(
          RecycleState value, $Res Function(RecycleState) then) =
      _$RecycleStateCopyWithImpl<$Res, RecycleState>;
  @useResult
  $Res call({History? listHistory, States state});
}

/// @nodoc
class _$RecycleStateCopyWithImpl<$Res, $Val extends RecycleState>
    implements $RecycleStateCopyWith<$Res> {
  _$RecycleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listHistory = freezed,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      listHistory: freezed == listHistory
          ? _value.listHistory
          : listHistory // ignore: cast_nullable_to_non_nullable
              as History?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as States,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecycleStateCopyWith<$Res>
    implements $RecycleStateCopyWith<$Res> {
  factory _$$_RecycleStateCopyWith(
          _$_RecycleState value, $Res Function(_$_RecycleState) then) =
      __$$_RecycleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({History? listHistory, States state});
}

/// @nodoc
class __$$_RecycleStateCopyWithImpl<$Res>
    extends _$RecycleStateCopyWithImpl<$Res, _$_RecycleState>
    implements _$$_RecycleStateCopyWith<$Res> {
  __$$_RecycleStateCopyWithImpl(
      _$_RecycleState _value, $Res Function(_$_RecycleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listHistory = freezed,
    Object? state = null,
  }) {
    return _then(_$_RecycleState(
      listHistory: freezed == listHistory
          ? _value.listHistory
          : listHistory // ignore: cast_nullable_to_non_nullable
              as History?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as States,
    ));
  }
}

/// @nodoc

class _$_RecycleState implements _RecycleState {
  const _$_RecycleState({this.listHistory, this.state = States.loading});

  @override
  final History? listHistory;
  @override
  @JsonKey()
  final States state;

  @override
  String toString() {
    return 'RecycleState(listHistory: $listHistory, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecycleState &&
            (identical(other.listHistory, listHistory) ||
                other.listHistory == listHistory) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, listHistory, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecycleStateCopyWith<_$_RecycleState> get copyWith =>
      __$$_RecycleStateCopyWithImpl<_$_RecycleState>(this, _$identity);
}

abstract class _RecycleState implements RecycleState {
  const factory _RecycleState(
      {final History? listHistory, final States state}) = _$_RecycleState;

  @override
  History? get listHistory;
  @override
  States get state;
  @override
  @JsonKey(ignore: true)
  _$$_RecycleStateCopyWith<_$_RecycleState> get copyWith =>
      throw _privateConstructorUsedError;
}
