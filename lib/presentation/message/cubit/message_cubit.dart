import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'message_state.dart';

@lazySingleton
class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState(name: '', emailOrPhone: ''));

  bool get name => state.name!.length > 0;

  bool get emailOrPhone => state.emailOrPhone!.length > 0;

  void onName(String name) => emit(state.copyWith(name: name));

  void onEmailOrPhone(String emailOrPhone) =>
      emit(state.copyWith(emailOrPhone: emailOrPhone));

  void onMessage(String message) => emit(state.copyWith(message: message));

  void save() {}
}
