import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
//implementar metodo

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      herReplay();
    }

    notifyListeners();
    moveScrollController();
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollController();
  }

  Future moveScrollController() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
