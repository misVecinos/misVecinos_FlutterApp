// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PageMenu {
  Widget get icon => throw _privateConstructorUsedError;
  Pages get page => throw _privateConstructorUsedError;
  int? get bulletCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageMenuCopyWith<PageMenu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageMenuCopyWith<$Res> {
  factory $PageMenuCopyWith(PageMenu value, $Res Function(PageMenu) then) =
      _$PageMenuCopyWithImpl<$Res, PageMenu>;
  @useResult
  $Res call({Widget icon, Pages page, int? bulletCount});
}

/// @nodoc
class _$PageMenuCopyWithImpl<$Res, $Val extends PageMenu>
    implements $PageMenuCopyWith<$Res> {
  _$PageMenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? page = null,
    Object? bulletCount = freezed,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Pages,
      bulletCount: freezed == bulletCount
          ? _value.bulletCount
          : bulletCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageMenuCopyWith<$Res> implements $PageMenuCopyWith<$Res> {
  factory _$$_PageMenuCopyWith(
          _$_PageMenu value, $Res Function(_$_PageMenu) then) =
      __$$_PageMenuCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget icon, Pages page, int? bulletCount});
}

/// @nodoc
class __$$_PageMenuCopyWithImpl<$Res>
    extends _$PageMenuCopyWithImpl<$Res, _$_PageMenu>
    implements _$$_PageMenuCopyWith<$Res> {
  __$$_PageMenuCopyWithImpl(
      _$_PageMenu _value, $Res Function(_$_PageMenu) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? page = null,
    Object? bulletCount = freezed,
  }) {
    return _then(_$_PageMenu(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Pages,
      bulletCount: freezed == bulletCount
          ? _value.bulletCount
          : bulletCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_PageMenu implements _PageMenu {
  const _$_PageMenu(
      {required this.icon, this.page = Pages.inicio, this.bulletCount});

  @override
  final Widget icon;
  @override
  @JsonKey()
  final Pages page;
  @override
  final int? bulletCount;

  @override
  String toString() {
    return 'PageMenu(icon: $icon, page: $page, bulletCount: $bulletCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageMenu &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.bulletCount, bulletCount) ||
                other.bulletCount == bulletCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, icon, page, bulletCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageMenuCopyWith<_$_PageMenu> get copyWith =>
      __$$_PageMenuCopyWithImpl<_$_PageMenu>(this, _$identity);
}

abstract class _PageMenu implements PageMenu {
  const factory _PageMenu(
      {required final Widget icon,
      final Pages page,
      final int? bulletCount}) = _$_PageMenu;

  @override
  Widget get icon;
  @override
  Pages get page;
  @override
  int? get bulletCount;
  @override
  @JsonKey(ignore: true)
  _$$_PageMenuCopyWith<_$_PageMenu> get copyWith =>
      throw _privateConstructorUsedError;
}
