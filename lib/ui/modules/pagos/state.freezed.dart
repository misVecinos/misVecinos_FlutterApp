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
mixin _$PagosState {
  List<ViviendaAtraso>? get atrasadas => throw _privateConstructorUsedError;
  List<ViviendaAtraso>? get atrasadasMas2Meses =>
      throw _privateConstructorUsedError;
  List<ViviendaOk>? get alCorriente => throw _privateConstructorUsedError;
  States get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagosStateCopyWith<PagosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagosStateCopyWith<$Res> {
  factory $PagosStateCopyWith(
          PagosState value, $Res Function(PagosState) then) =
      _$PagosStateCopyWithImpl<$Res, PagosState>;
  @useResult
  $Res call(
      {List<ViviendaAtraso>? atrasadas,
      List<ViviendaAtraso>? atrasadasMas2Meses,
      List<ViviendaOk>? alCorriente,
      States state});
}

/// @nodoc
class _$PagosStateCopyWithImpl<$Res, $Val extends PagosState>
    implements $PagosStateCopyWith<$Res> {
  _$PagosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atrasadas = freezed,
    Object? atrasadasMas2Meses = freezed,
    Object? alCorriente = freezed,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      atrasadas: freezed == atrasadas
          ? _value.atrasadas
          : atrasadas // ignore: cast_nullable_to_non_nullable
              as List<ViviendaAtraso>?,
      atrasadasMas2Meses: freezed == atrasadasMas2Meses
          ? _value.atrasadasMas2Meses
          : atrasadasMas2Meses // ignore: cast_nullable_to_non_nullable
              as List<ViviendaAtraso>?,
      alCorriente: freezed == alCorriente
          ? _value.alCorriente
          : alCorriente // ignore: cast_nullable_to_non_nullable
              as List<ViviendaOk>?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as States,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PagosStateCopyWith<$Res>
    implements $PagosStateCopyWith<$Res> {
  factory _$$_PagosStateCopyWith(
          _$_PagosState value, $Res Function(_$_PagosState) then) =
      __$$_PagosStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ViviendaAtraso>? atrasadas,
      List<ViviendaAtraso>? atrasadasMas2Meses,
      List<ViviendaOk>? alCorriente,
      States state});
}

/// @nodoc
class __$$_PagosStateCopyWithImpl<$Res>
    extends _$PagosStateCopyWithImpl<$Res, _$_PagosState>
    implements _$$_PagosStateCopyWith<$Res> {
  __$$_PagosStateCopyWithImpl(
      _$_PagosState _value, $Res Function(_$_PagosState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atrasadas = freezed,
    Object? atrasadasMas2Meses = freezed,
    Object? alCorriente = freezed,
    Object? state = null,
  }) {
    return _then(_$_PagosState(
      atrasadas: freezed == atrasadas
          ? _value._atrasadas
          : atrasadas // ignore: cast_nullable_to_non_nullable
              as List<ViviendaAtraso>?,
      atrasadasMas2Meses: freezed == atrasadasMas2Meses
          ? _value._atrasadasMas2Meses
          : atrasadasMas2Meses // ignore: cast_nullable_to_non_nullable
              as List<ViviendaAtraso>?,
      alCorriente: freezed == alCorriente
          ? _value._alCorriente
          : alCorriente // ignore: cast_nullable_to_non_nullable
              as List<ViviendaOk>?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as States,
    ));
  }
}

/// @nodoc

class _$_PagosState implements _PagosState {
  const _$_PagosState(
      {final List<ViviendaAtraso>? atrasadas,
      final List<ViviendaAtraso>? atrasadasMas2Meses,
      final List<ViviendaOk>? alCorriente,
      this.state = States.loading})
      : _atrasadas = atrasadas,
        _atrasadasMas2Meses = atrasadasMas2Meses,
        _alCorriente = alCorriente;

  final List<ViviendaAtraso>? _atrasadas;
  @override
  List<ViviendaAtraso>? get atrasadas {
    final value = _atrasadas;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ViviendaAtraso>? _atrasadasMas2Meses;
  @override
  List<ViviendaAtraso>? get atrasadasMas2Meses {
    final value = _atrasadasMas2Meses;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ViviendaOk>? _alCorriente;
  @override
  List<ViviendaOk>? get alCorriente {
    final value = _alCorriente;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final States state;

  @override
  String toString() {
    return 'PagosState(atrasadas: $atrasadas, atrasadasMas2Meses: $atrasadasMas2Meses, alCorriente: $alCorriente, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PagosState &&
            const DeepCollectionEquality()
                .equals(other._atrasadas, _atrasadas) &&
            const DeepCollectionEquality()
                .equals(other._atrasadasMas2Meses, _atrasadasMas2Meses) &&
            const DeepCollectionEquality()
                .equals(other._alCorriente, _alCorriente) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_atrasadas),
      const DeepCollectionEquality().hash(_atrasadasMas2Meses),
      const DeepCollectionEquality().hash(_alCorriente),
      state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PagosStateCopyWith<_$_PagosState> get copyWith =>
      __$$_PagosStateCopyWithImpl<_$_PagosState>(this, _$identity);
}

abstract class _PagosState implements PagosState {
  const factory _PagosState(
      {final List<ViviendaAtraso>? atrasadas,
      final List<ViviendaAtraso>? atrasadasMas2Meses,
      final List<ViviendaOk>? alCorriente,
      final States state}) = _$_PagosState;

  @override
  List<ViviendaAtraso>? get atrasadas;
  @override
  List<ViviendaAtraso>? get atrasadasMas2Meses;
  @override
  List<ViviendaOk>? get alCorriente;
  @override
  States get state;
  @override
  @JsonKey(ignore: true)
  _$$_PagosStateCopyWith<_$_PagosState> get copyWith =>
      throw _privateConstructorUsedError;
}
