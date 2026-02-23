// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sizing_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SizingInformation {
  ScreenType get screenType;
  Size get screenSize;

  /// Create a copy of SizingInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SizingInformationCopyWith<SizingInformation> get copyWith =>
      _$SizingInformationCopyWithImpl<SizingInformation>(
          this as SizingInformation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SizingInformation &&
            (identical(other.screenType, screenType) ||
                other.screenType == screenType) &&
            (identical(other.screenSize, screenSize) ||
                other.screenSize == screenSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screenType, screenSize);

  @override
  String toString() {
    return 'SizingInformation(screenType: $screenType, screenSize: $screenSize)';
  }
}

/// @nodoc
abstract mixin class $SizingInformationCopyWith<$Res> {
  factory $SizingInformationCopyWith(
          SizingInformation value, $Res Function(SizingInformation) _then) =
      _$SizingInformationCopyWithImpl;
  @useResult
  $Res call({ScreenType screenType, Size screenSize});
}

/// @nodoc
class _$SizingInformationCopyWithImpl<$Res>
    implements $SizingInformationCopyWith<$Res> {
  _$SizingInformationCopyWithImpl(this._self, this._then);

  final SizingInformation _self;
  final $Res Function(SizingInformation) _then;

  /// Create a copy of SizingInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenType = null,
    Object? screenSize = null,
  }) {
    return _then(_self.copyWith(
      screenType: null == screenType
          ? _self.screenType
          : screenType // ignore: cast_nullable_to_non_nullable
              as ScreenType,
      screenSize: null == screenSize
          ? _self.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// Adds pattern-matching-related methods to [SizingInformation].
extension SizingInformationPatterns on SizingInformation {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SizingInformation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SizingInformation() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SizingInformation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SizingInformation():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SizingInformation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SizingInformation() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ScreenType screenType, Size screenSize)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SizingInformation() when $default != null:
        return $default(_that.screenType, _that.screenSize);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ScreenType screenType, Size screenSize) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SizingInformation():
        return $default(_that.screenType, _that.screenSize);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ScreenType screenType, Size screenSize)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SizingInformation() when $default != null:
        return $default(_that.screenType, _that.screenSize);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SizingInformation extends SizingInformation {
  const _SizingInformation({required this.screenType, required this.screenSize})
      : super._();

  @override
  final ScreenType screenType;
  @override
  final Size screenSize;

  /// Create a copy of SizingInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SizingInformationCopyWith<_SizingInformation> get copyWith =>
      __$SizingInformationCopyWithImpl<_SizingInformation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SizingInformation &&
            (identical(other.screenType, screenType) ||
                other.screenType == screenType) &&
            (identical(other.screenSize, screenSize) ||
                other.screenSize == screenSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screenType, screenSize);

  @override
  String toString() {
    return 'SizingInformation(screenType: $screenType, screenSize: $screenSize)';
  }
}

/// @nodoc
abstract mixin class _$SizingInformationCopyWith<$Res>
    implements $SizingInformationCopyWith<$Res> {
  factory _$SizingInformationCopyWith(
          _SizingInformation value, $Res Function(_SizingInformation) _then) =
      __$SizingInformationCopyWithImpl;
  @override
  @useResult
  $Res call({ScreenType screenType, Size screenSize});
}

/// @nodoc
class __$SizingInformationCopyWithImpl<$Res>
    implements _$SizingInformationCopyWith<$Res> {
  __$SizingInformationCopyWithImpl(this._self, this._then);

  final _SizingInformation _self;
  final $Res Function(_SizingInformation) _then;

  /// Create a copy of SizingInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? screenType = null,
    Object? screenSize = null,
  }) {
    return _then(_SizingInformation(
      screenType: null == screenType
          ? _self.screenType
          : screenType // ignore: cast_nullable_to_non_nullable
              as ScreenType,
      screenSize: null == screenSize
          ? _self.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

// dart format on
