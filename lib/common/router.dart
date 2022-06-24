import 'package:flutter/material.dart';
import 'package:flutter_templates_anabebe/contents/badge/page.dart';
import 'package:flutter_templates_anabebe/contents/bottom_modal/page.dart';
import 'package:flutter_templates_anabebe/contents/emoji_picker/page.dart';
import 'package:flutter_templates_anabebe/contents/page_view/home_page.dart';
import 'package:flutter_templates_anabebe/contents/refresh/page.dart';
import 'package:flutter_templates_anabebe/contents/refresh/page2.dart';
import 'package:flutter_templates_anabebe/home/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  //1
  initialLocation: '/',
  //2
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      name: 'pageView',
      path: '/pageView',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: PageViewHomePage(),
      ),
    ),
    GoRoute(
      name: 'badges',
      path: '/badges',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const BadgePage(),
      ),
    ),
    GoRoute(
      name: 'refresh',
      path: '/refresh',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const RefreshPage(),
      ),
    ),
    GoRoute(
      name: 'pullRefresh',
      path: '/pullRefresh',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const PullRefreshPage(),
      ),
    ),
    GoRoute(
      name: 'bottomModal',
      path: '/bottomModal',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const BottomModalPage(),
      ),
    ),
    GoRoute(
      name: 'emojiPicker',
      path: '/emojiPicker',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const EmojiPickerPage(),
      ),
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
