// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'starred_repos_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StarredReposState {
  Fresh<List<GithubRepo>> get repos => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadInSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailure failure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult? Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult? Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadInSuccess,
    TResult? Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadInSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadInSuccess value) loadInSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadInSuccess value)? loadInSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadInSuccess value)? loadInSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StarredReposStateCopyWith<StarredReposState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarredReposStateCopyWith<$Res> {
  factory $StarredReposStateCopyWith(
          StarredReposState value, $Res Function(StarredReposState) then) =
      _$StarredReposStateCopyWithImpl<$Res, StarredReposState>;
  @useResult
  $Res call({Fresh<List<GithubRepo>> repos});

  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class _$StarredReposStateCopyWithImpl<$Res, $Val extends StarredReposState>
    implements $StarredReposStateCopyWith<$Res> {
  _$StarredReposStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
  }) {
    return _then(_value.copyWith(
      repos: null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<List<GithubRepo>, $Res> get repos {
    return $FreshCopyWith<List<GithubRepo>, $Res>(_value.repos, (value) {
      return _then(_value.copyWith(repos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $StarredReposStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<GithubRepo>> repos});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$StarredReposStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
  }) {
    return _then(_$_Initial(
      null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial with DiagnosticableTreeMixin {
  const _$_Initial(this.repos) : super._();

  @override
  final Fresh<List<GithubRepo>> repos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StarredReposState.initial(repos: $repos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StarredReposState.initial'))
      ..add(DiagnosticsProperty('repos', repos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.repos, repos) || other.repos == repos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadInSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailure failure)
        loadFailure,
  }) {
    return initial(repos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult? Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult? Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadInSuccess,
    TResult? Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        loadFailure,
  }) {
    return initial?.call(repos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadInSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(repos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadInSuccess value) loadInSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadInSuccess value)? loadInSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadInSuccess value)? loadInSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends StarredReposState {
  const factory _Initial(final Fresh<List<GithubRepo>> repos) = _$_Initial;
  const _Initial._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res>
    implements $StarredReposStateCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<GithubRepo>> repos, int itemsPerPage});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$StarredReposStateCopyWithImpl<$Res, _$_LoadInProgress>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
    Object? itemsPerPage = null,
  }) {
    return _then(_$_LoadInProgress(
      null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress extends _LoadInProgress with DiagnosticableTreeMixin {
  const _$_LoadInProgress(this.repos, this.itemsPerPage) : super._();

  @override
  final Fresh<List<GithubRepo>> repos;
  @override
  final int itemsPerPage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StarredReposState.loadInProgress(repos: $repos, itemsPerPage: $itemsPerPage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StarredReposState.loadInProgress'))
      ..add(DiagnosticsProperty('repos', repos))
      ..add(DiagnosticsProperty('itemsPerPage', itemsPerPage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInProgress &&
            (identical(other.repos, repos) || other.repos == repos) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos, itemsPerPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      __$$_LoadInProgressCopyWithImpl<_$_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadInSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailure failure)
        loadFailure,
  }) {
    return loadInProgress(repos, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult? Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult? Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadInSuccess,
    TResult? Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        loadFailure,
  }) {
    return loadInProgress?.call(repos, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadInSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(repos, itemsPerPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadInSuccess value) loadInSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadInSuccess value)? loadInSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadInSuccess value)? loadInSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends StarredReposState {
  const factory _LoadInProgress(
          final Fresh<List<GithubRepo>> repos, final int itemsPerPage) =
      _$_LoadInProgress;
  const _LoadInProgress._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos;
  int get itemsPerPage;
  @override
  @JsonKey(ignore: true)
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadInSuccessCopyWith<$Res>
    implements $StarredReposStateCopyWith<$Res> {
  factory _$$_LoadInSuccessCopyWith(
          _$_LoadInSuccess value, $Res Function(_$_LoadInSuccess) then) =
      __$$_LoadInSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<GithubRepo>> repos, bool isNextPageAvailable});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
}

/// @nodoc
class __$$_LoadInSuccessCopyWithImpl<$Res>
    extends _$StarredReposStateCopyWithImpl<$Res, _$_LoadInSuccess>
    implements _$$_LoadInSuccessCopyWith<$Res> {
  __$$_LoadInSuccessCopyWithImpl(
      _$_LoadInSuccess _value, $Res Function(_$_LoadInSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
    Object? isNextPageAvailable = null,
  }) {
    return _then(_$_LoadInSuccess(
      null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      isNextPageAvailable: null == isNextPageAvailable
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadInSuccess extends _LoadInSuccess with DiagnosticableTreeMixin {
  const _$_LoadInSuccess(this.repos, {required this.isNextPageAvailable})
      : super._();

  @override
  final Fresh<List<GithubRepo>> repos;
  @override
  final bool isNextPageAvailable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StarredReposState.loadInSuccess(repos: $repos, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StarredReposState.loadInSuccess'))
      ..add(DiagnosticsProperty('repos', repos))
      ..add(DiagnosticsProperty('isNextPageAvailable', isNextPageAvailable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInSuccess &&
            (identical(other.repos, repos) || other.repos == repos) &&
            (identical(other.isNextPageAvailable, isNextPageAvailable) ||
                other.isNextPageAvailable == isNextPageAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos, isNextPageAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadInSuccessCopyWith<_$_LoadInSuccess> get copyWith =>
      __$$_LoadInSuccessCopyWithImpl<_$_LoadInSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadInSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailure failure)
        loadFailure,
  }) {
    return loadInSuccess(repos, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult? Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult? Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadInSuccess,
    TResult? Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        loadFailure,
  }) {
    return loadInSuccess?.call(repos, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadInSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInSuccess != null) {
      return loadInSuccess(repos, isNextPageAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadInSuccess value) loadInSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadInSuccess value)? loadInSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadInSuccess value)? loadInSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInSuccess != null) {
      return loadInSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadInSuccess extends StarredReposState {
  const factory _LoadInSuccess(final Fresh<List<GithubRepo>> repos,
      {required final bool isNextPageAvailable}) = _$_LoadInSuccess;
  const _LoadInSuccess._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos;
  bool get isNextPageAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_LoadInSuccessCopyWith<_$_LoadInSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFailureCopyWith<$Res>
    implements $StarredReposStateCopyWith<$Res> {
  factory _$$_LoadFailureCopyWith(
          _$_LoadFailure value, $Res Function(_$_LoadFailure) then) =
      __$$_LoadFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<GithubRepo>> repos, GithubFailure failure});

  @override
  $FreshCopyWith<List<GithubRepo>, $Res> get repos;
  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_LoadFailureCopyWithImpl<$Res>
    extends _$StarredReposStateCopyWithImpl<$Res, _$_LoadFailure>
    implements _$$_LoadFailureCopyWith<$Res> {
  __$$_LoadFailureCopyWithImpl(
      _$_LoadFailure _value, $Res Function(_$_LoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
    Object? failure = null,
  }) {
    return _then(_$_LoadFailure(
      null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Fresh<List<GithubRepo>>,
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure extends _LoadFailure with DiagnosticableTreeMixin {
  const _$_LoadFailure(this.repos, this.failure) : super._();

  @override
  final Fresh<List<GithubRepo>> repos;
  @override
  final GithubFailure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StarredReposState.loadFailure(repos: $repos, failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StarredReposState.loadFailure'))
      ..add(DiagnosticsProperty('repos', repos))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFailure &&
            (identical(other.repos, repos) || other.repos == repos) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      __$$_LoadFailureCopyWithImpl<_$_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<GithubRepo>> repos) initial,
    required TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)
        loadInSuccess,
    required TResult Function(
            Fresh<List<GithubRepo>> repos, GithubFailure failure)
        loadFailure,
  }) {
    return loadFailure(repos, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult? Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult? Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadInSuccess,
    TResult? Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        loadFailure,
  }) {
    return loadFailure?.call(repos, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<GithubRepo>> repos)? initial,
    TResult Function(Fresh<List<GithubRepo>> repos, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<GithubRepo>> repos, bool isNextPageAvailable)?
        loadInSuccess,
    TResult Function(Fresh<List<GithubRepo>> repos, GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(repos, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadInSuccess value) loadInSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadInSuccess value)? loadInSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadInSuccess value)? loadInSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends StarredReposState {
  const factory _LoadFailure(
          final Fresh<List<GithubRepo>> repos, final GithubFailure failure) =
      _$_LoadFailure;
  const _LoadFailure._() : super._();

  @override
  Fresh<List<GithubRepo>> get repos;
  GithubFailure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
