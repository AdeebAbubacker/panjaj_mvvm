// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FamilyInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name) postFamilyInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? postFamilyInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? postFamilyInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(PostFamilyInfo value) postFamilyInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(PostFamilyInfo value)? postFamilyInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(PostFamilyInfo value)? postFamilyInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyInfoEventCopyWith<$Res> {
  factory $FamilyInfoEventCopyWith(
          FamilyInfoEvent value, $Res Function(FamilyInfoEvent) then) =
      _$FamilyInfoEventCopyWithImpl<$Res, FamilyInfoEvent>;
}

/// @nodoc
class _$FamilyInfoEventCopyWithImpl<$Res, $Val extends FamilyInfoEvent>
    implements $FamilyInfoEventCopyWith<$Res> {
  _$FamilyInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$FamilyInfoEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'FamilyInfoEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name) postFamilyInfo,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? postFamilyInfo,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? postFamilyInfo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(PostFamilyInfo value) postFamilyInfo,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(PostFamilyInfo value)? postFamilyInfo,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(PostFamilyInfo value)? postFamilyInfo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements FamilyInfoEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$PostFamilyInfoImplCopyWith<$Res> {
  factory _$$PostFamilyInfoImplCopyWith(_$PostFamilyInfoImpl value,
          $Res Function(_$PostFamilyInfoImpl) then) =
      __$$PostFamilyInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$PostFamilyInfoImplCopyWithImpl<$Res>
    extends _$FamilyInfoEventCopyWithImpl<$Res, _$PostFamilyInfoImpl>
    implements _$$PostFamilyInfoImplCopyWith<$Res> {
  __$$PostFamilyInfoImplCopyWithImpl(
      _$PostFamilyInfoImpl _value, $Res Function(_$PostFamilyInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$PostFamilyInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PostFamilyInfoImpl implements PostFamilyInfo {
  const _$PostFamilyInfoImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'FamilyInfoEvent.postFamilyInfo(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFamilyInfoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFamilyInfoImplCopyWith<_$PostFamilyInfoImpl> get copyWith =>
      __$$PostFamilyInfoImplCopyWithImpl<_$PostFamilyInfoImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name) postFamilyInfo,
  }) {
    return postFamilyInfo(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? postFamilyInfo,
  }) {
    return postFamilyInfo?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? postFamilyInfo,
    required TResult orElse(),
  }) {
    if (postFamilyInfo != null) {
      return postFamilyInfo(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(PostFamilyInfo value) postFamilyInfo,
  }) {
    return postFamilyInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(PostFamilyInfo value)? postFamilyInfo,
  }) {
    return postFamilyInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(PostFamilyInfo value)? postFamilyInfo,
    required TResult orElse(),
  }) {
    if (postFamilyInfo != null) {
      return postFamilyInfo(this);
    }
    return orElse();
  }
}

abstract class PostFamilyInfo implements FamilyInfoEvent {
  const factory PostFamilyInfo({required final String name}) =
      _$PostFamilyInfoImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$PostFamilyInfoImplCopyWith<_$PostFamilyInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FamilyInfoState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  FamilyData get familyInfo => throw _privateConstructorUsedError;
  Option<Either<MainFailure, FamilyData>> get successorFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FamilyInfoStateCopyWith<FamilyInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyInfoStateCopyWith<$Res> {
  factory $FamilyInfoStateCopyWith(
          FamilyInfoState value, $Res Function(FamilyInfoState) then) =
      _$FamilyInfoStateCopyWithImpl<$Res, FamilyInfoState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      FamilyData familyInfo,
      Option<Either<MainFailure, FamilyData>> successorFailure});
}

/// @nodoc
class _$FamilyInfoStateCopyWithImpl<$Res, $Val extends FamilyInfoState>
    implements $FamilyInfoStateCopyWith<$Res> {
  _$FamilyInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? familyInfo = null,
    Object? successorFailure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      familyInfo: null == familyInfo
          ? _value.familyInfo
          : familyInfo // ignore: cast_nullable_to_non_nullable
              as FamilyData,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, FamilyData>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FamilyInfoStateImplCopyWith<$Res>
    implements $FamilyInfoStateCopyWith<$Res> {
  factory _$$FamilyInfoStateImplCopyWith(_$FamilyInfoStateImpl value,
          $Res Function(_$FamilyInfoStateImpl) then) =
      __$$FamilyInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      FamilyData familyInfo,
      Option<Either<MainFailure, FamilyData>> successorFailure});
}

/// @nodoc
class __$$FamilyInfoStateImplCopyWithImpl<$Res>
    extends _$FamilyInfoStateCopyWithImpl<$Res, _$FamilyInfoStateImpl>
    implements _$$FamilyInfoStateImplCopyWith<$Res> {
  __$$FamilyInfoStateImplCopyWithImpl(
      _$FamilyInfoStateImpl _value, $Res Function(_$FamilyInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? familyInfo = null,
    Object? successorFailure = null,
  }) {
    return _then(_$FamilyInfoStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      familyInfo: null == familyInfo
          ? _value.familyInfo
          : familyInfo // ignore: cast_nullable_to_non_nullable
              as FamilyData,
      successorFailure: null == successorFailure
          ? _value.successorFailure
          : successorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, FamilyData>>,
    ));
  }
}

/// @nodoc

class _$FamilyInfoStateImpl implements _FamilyInfoState {
  const _$FamilyInfoStateImpl(
      {required this.isLoading,
      required this.isError,
      required this.familyInfo,
      required this.successorFailure});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final FamilyData familyInfo;
  @override
  final Option<Either<MainFailure, FamilyData>> successorFailure;

  @override
  String toString() {
    return 'FamilyInfoState(isLoading: $isLoading, isError: $isError, familyInfo: $familyInfo, successorFailure: $successorFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyInfoStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.familyInfo, familyInfo) ||
                other.familyInfo == familyInfo) &&
            (identical(other.successorFailure, successorFailure) ||
                other.successorFailure == successorFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isError, familyInfo, successorFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyInfoStateImplCopyWith<_$FamilyInfoStateImpl> get copyWith =>
      __$$FamilyInfoStateImplCopyWithImpl<_$FamilyInfoStateImpl>(
          this, _$identity);
}

abstract class _FamilyInfoState implements FamilyInfoState {
  const factory _FamilyInfoState(
      {required final bool isLoading,
      required final bool isError,
      required final FamilyData familyInfo,
      required final Option<Either<MainFailure, FamilyData>>
          successorFailure}) = _$FamilyInfoStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  FamilyData get familyInfo;
  @override
  Option<Either<MainFailure, FamilyData>> get successorFailure;
  @override
  @JsonKey(ignore: true)
  _$$FamilyInfoStateImplCopyWith<_$FamilyInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
