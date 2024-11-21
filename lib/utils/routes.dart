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

final customGoRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        switch (navigationShell.currentIndex) {
          case 0:
            if (state.uri.toString() == "/event") {
              return BaseLayout(
                navbar: false,
                padding: 0,
                child: navigationShell,
              );
            }
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
              pageBuilder: (context, state) => noTransitionBuilder(
                context: context,
                state: state,
                child: Homepage(),
              ),
              routes: [
                noTransitionGoRoute(
                  name: "myevents",
                  path: "/my-events",
                  child: const MyEventsPage(),
                ),
                noTransitionGoRoute(
                  name: "eventhub",
                  path: "/eventhub",
                  child: const CallForHelpPage(),
                ),
                noTransitionGoRoute(
                  name: "event-create",
                  path: "/event-create",
                  child: const EventCreatePage(),
                ),
                noTransitionGoRoute(
                  name: "event",
                  path: "/event",
                  child: const EventPage(),
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
      ],
    ),
  ],
);

CustomTransitionPage noTransitionBuilder<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return NoTransitionPage<T>(
    key: state.pageKey,
    child: child,
  );
}

GoRoute noTransitionGoRoute({
  required String name,
  required String path,
  required Widget child,
}) {
  return GoRoute(
    name: name,
    path: path,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: child,
    ),
  );
}
