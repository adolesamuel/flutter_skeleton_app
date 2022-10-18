import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';

//TODO: handle notificatioins.
//TODO: customise primary color to red.
//TODO: handle restore user identification.
class FreshChatService {
  //as a singleton class. FreshChat().
  static final FreshChatService _instance = FreshChatService._();
  factory FreshChatService() {
    return _instance;
  }
  FreshChatService._();

  FreshchatUser? user;

  // Future<void> init() async {
  //   //remote config fresh chat secrets

  //   //Initialize freshchat
  //   Freshchat.init(
  //     freshChatSecrets['FRESH_CHAT_APP_ID'] ??
  //     freshChatSecrets['FRESH_CHAT_APP_KEY'] ?? Environment.freshChatAppKey,
  //     'msdk.freshchat.com',
  //     teamMemberInfoVisible: true,
  //     cameraCaptureEnabled: false,
  //     gallerySelectionEnabled: false,
  //     responseExpectationEnabled: true,
  //     showNotificationBanneriOS: true,
  //   );
  // }

  void showConversation() {
    Freshchat.showConversations();
  }
}
