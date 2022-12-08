// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VecinoState {
  List<NegocioVecino>? get negocios => throw _privateConstructorUsedError;
  States get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VecinoStateCopyWith<VecinoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VecinoStateCopyWith<$Res> {
  factory $VecinoStateCopyWith(
          VecinoState value, $Res Function(VecinoState) then) =
      _$VecinoStateCopyWithImpl<$Res, VecinoState>;
  @useResult
  $Res call({List<NegocioVecino>? negocios, States state});
}

/// @nodoc
class _$VecinoStateCopyWithImpl<$Res, $Val extends VecinoState>
    implements $VecinoStateCopyWith<$Res> {
  _$VecinoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? negocios = freezed,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      negocios: freezed == negocios
          ? _value.negocios
          : negocios // ignore: cast_nullable_to_non_nullable
              as List<NegocioVecino>?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as States,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VecinoStateCopyWith<$Res>
    implements $VecinoStateCopyWith<$Res> {
  factory _$$_VecinoStateCopyWith(
          _$_VecinoState value, $Res Function(_$_VecinoState) then) =
      __$$_VecinoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NegocioVecino>? negocios, States state});
}

/// @nodoc
class __$$_VecinoStateCopyWithImpl<$Res>
    extends _$VecinoStateCopyWithImpl<$Res, _$_VecinoState>
    implements _$$_VecinoStateCopyWith<$Res> {
  __$$_VecinoStateCopyWithImpl(
      _$_VecinoState _value, $Res Function(_$_VecinoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? negocios = freezed,
    Object? state = null,
  }) {
    return _then(_$_VecinoState(
      negocios: freezed == negocios
          ? _value._negocios
          : negocios // ignore: cast_nullable_to_non_nullable
              as List<NegocioVecino>?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as States,
    ));
  }
}

/// @nodoc

class _$_VecinoState implements _VecinoState {
  const _$_VecinoState(
      {final List<NegocioVecino>? negocios, this.state = States.loading})
      : _negocios = negocios;

  final List<NegocioVecino>? _negocios;
  @override
  List<NegocioVecino>? get negocios {
    final value = _negocios;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final States state;

  @override
  String toString() {
    return 'VecinoState(negocios: $negocios, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VecinoState &&
            const DeepCollectionEquality().equals(other._negocios, _negocios) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_negocios), state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VecinoStateCopyWith<_$_VecinoState> get copyWith =>
      __$$_VecinoStateCopyWithImpl<_$_VecinoState>(this, _$identity);
}

abstract class _VecinoState implements VecinoState {
  const factory _VecinoState(
      {final List<NegocioVecino>? negocios,
      final States state}) = _$_VecinoState;

  @override
  List<NegocioVecino>? get negocios;
  @override
  States get state;
  @override
  @JsonKey(ignore: true)
  _$$_VecinoStateCopyWith<_$_VecinoState> get copyWith =>
      throw _privateConstructorUsedError;
}
