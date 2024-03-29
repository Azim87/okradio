import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

import 'message_state.dart';

@lazySingleton
class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState(name: '', emailOrPhone: ''));

  bool get name => state.name!.length > 0;

  bool get emailOrPhone => state.emailOrPhone!.length > 0;

  void onName(String name) {
    print('name: $name');
    emit(state.copyWith(name: name));
  }

  void onEmailOrPhone(String emailOrPhone) {
    print('emailOrPhone: $emailOrPhone');
    emit(state.copyWith(emailOrPhone: emailOrPhone));
  }

  void onMessage(String message) {
    print('message: $message');
    emit(state.copyWith(message: message));
  }

  Future<void> makeCall(String phone) async {
    final Uri _phoneUri = Uri(scheme: "tel", path: phone);

    try {
      if (await canLaunchUrl(_phoneUri)) await launchUrl(_phoneUri);
    } catch (error) {
      throw ("Cannot dial");
    }
  }

  void sendEmail() async {
    final mailtoLink = Mailto(
      to: ['info@okradio.kg'],
      subject: "from ${state.emailOrPhone}",
      body: state.message,
    );

    await launchUrl(Uri.parse('$mailtoLink'));
  }
}
