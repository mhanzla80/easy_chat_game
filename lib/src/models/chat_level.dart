import 'package:collection/collection.dart';

class ChatLevel {
  static const botKey = 'bot';
  static const userKey = 'user';

  final String levelName;
  final String botName;
  final String botImg;
  final String userImg;
  final Map<String, List<String>> chatList;
  final List<String> successMessages;
  final List<String> failureMessages;

  ChatLevel({
    required this.levelName,
    required this.botName,
    required this.botImg,
    required this.userImg,
    required this.chatList,
    required this.successMessages,
    required this.failureMessages,
  });

  bool isSuccessMessage(String message) => successMessages.contains(message);
  bool isErrorMessage(String message) => failureMessages.contains(message);
  bool get willSenderInitiateChat => chatList.keys.first == botKey;
  String? get getSenderMessage => chatList[botKey]?.firstOrNull;
  String? get getReceiverMessage => chatList[userKey]?.firstOrNull;
  static bool isLie(String message) => message.contains('(Lie)');
  static bool isTruth(String message) => message.contains('(Truth)');
  static String truncateLie(String message) =>
      message.replaceAll('(Lie)', '').trim();
  static String truncateTruth(String message) =>
      message.replaceAll('(Truth)', '').trim();
}
