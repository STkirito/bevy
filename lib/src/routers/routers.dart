import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/interface/auth/loading_auth.dart';
import 'package:bevy/src/interface/auth/login_auth.dart';
import 'package:bevy/src/interface/auth/register_auth.dart';
import 'package:bevy/src/interface/home/home.dart';
import 'package:bevy/src/interface/home/option/settings/option/perfil_settings_option_home_view.dart';
import 'package:bevy/src/interface/home/option/shared_image_option_home_view.dart';
import 'package:bevy/src/interface/home/option/search_option_home_view.dart';
import 'package:bevy/src/interface/home/option/settings/option/info_app_option_settings_view.dart';
import 'package:bevy/src/interface/home/option/settings/settings_option_view.dart';
import 'package:bevy/src/interface/home/tab/contacts/chat/chat_contact_view.dart';
import 'package:bevy/src/interface/home/tab/contacts/qr/my_qr_add_contact_option_contact_view.dart';
import 'package:bevy/src/interface/home/tab/contacts/shared/share_option_contact_view.dart';
import 'package:bevy/src/interface/home/tab/mural/option/%20report_option_view.dart';

List<GetPage<dynamic>>? routers = [
  GetPage(name: '/auth/loading', page: () => const LoadingAuthView()),
  GetPage(name: '/auth/login', page: () => LoginAuth()),
  GetPage(name: '/auth/register', page: () => RegisterAuth()),
  GetPage(name: '/home', page: () => const Home()),
  GetPage(
      name: '/home/option/settings', page: () => const SettingsOptionView()),
  GetPage(
      name: '/home/option/settings/info',
      page: () => const InfoAppOptionSettingsView()),
  GetPage(
      name: '/home/option/settings/perfil',
      page: () => const PerfilSettingsOptionHomeView()),
  GetPage(name: '/home/option/search', page: () => const SearchOptionView()),
  GetPage(
      name: '/home/option/sharedimage', page: () => SharedImageOptionView()),
  GetPage(
      name: '/home/mural/canvas/report',
      page: () => const ReportMuralOptionView()),
  GetPage(
      name: '/home/contacs/contact/shared',
      page: () => ShareOptionContactChatView()),
  GetPage(
    name: '/home/contacs/contact/Chat',
    page: () => ChatContactView(),
  ),
  GetPage(
    name: '/home/contacs/contact/myqraddcontact',
    page: () => const MyQrAddContactOptionContactView(),
  ),
];
