import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/pages/call_for_help_page.dart';
import 'package:planit/pages/event_create_page.dart';
import 'package:planit/pages/event_page.dart';
import 'package:planit/pages/home_page.dart';
import 'package:planit/pages/login_page.dart';
import 'package:planit/pages/my_events_page.dart';
import 'package:planit/pages/signup_page.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/homepage/appbar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _childNavkey1 = GlobalKey<NavigatorState>();
final _childNavkey2 = GlobalKey<NavigatorState>();
final _childNavkey3 = GlobalKey<NavigatorState>();

final customGoRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        switch (navigationShell.currentIndex) {
          case 0:
            return BaseLayout(
              appbar: hompageAppBar,
              backgroundColor: Colors.black,
              child: navigationShell,
            );
          case 1:
            return BaseLayout(
              navbar: false,
              child: navigationShell,
            );
          default:
            return BaseLayout(
              navbar: false,
              padding: 0,
              child: navigationShell,
            );
        }
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _childNavkey1,
          routes: [
            GoRoute(
              name: "home",
              path: '/',
              builder: (context, state) => Homepage(),
              routes: [
                GoRoute(
                  name: "myevents",
                  path: '/my-events',
                  builder: (context, state) => const MyEventsPage(),
                ),
                GoRoute(
                  name: "eventhub",
                  path: '/eventhub',
                  builder: (context, state) => const CallForHelpPage(),
                ),
                GoRoute(
                  name: "event-create",
                  path: '/event-create',
                  builder: (context, state) => const EventCreatePage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _childNavkey2,
          routes: [
            GoRoute(
              name: "login",
              path: '/login',
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              name: "signup",
              path: '/signup',
              builder: (context, state) => const SignupPage(),
            ),
          ],
        ),
        StatefulShellBranch(navigatorKey: _childNavkey3, routes: [
          GoRoute(
            name: "event",
            path: '/event',
            builder: (context, state) => const EventPage(),
          ),
        ])
      ],
    ),
  ],
);
