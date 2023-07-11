import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_responses.freezed.dart';

@freezed
class RemoteResponse<T> with _$RemoteResponse<T> {
  const RemoteResponse._();
  const factory RemoteResponse.noConnection() = _NoConnection<T>;
  const factory RemoteResponse.notModified() = _NoModified<T>;
  const factory RemoteResponse.withNewData(T data) = _WithNewData<T>;
}
