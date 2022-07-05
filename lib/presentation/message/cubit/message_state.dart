import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_state.freezed.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState({
    final String? name,
    final String? emailOrPhone,
    final String? message,
  }) = _MessageState;
}
