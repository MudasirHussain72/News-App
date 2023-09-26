import 'package:news_app/view/dashboard/explore/explore_screen.dart';
import 'package:news_app/view/dashboard/home/home_screen.dart';
import 'package:news_app/view/dashboard/news_detail/news_detail_Screen.dart';
import 'package:news_app/view/dashboard/saved/saved_screen.dart';
import 'package:news_app/view/view_barrel_file.dart';
import '../routes/routes_barrel_file.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      //splash view route
      case RouteName.splashScreen:
        return _platformPageRoute(child: const SplashScreen());
      //dashboard view route
      case RouteName.dashboardScreen:
        return _platformPageRoute(child: const DashboardScreen());
      case RouteName.homeScreen:
        return _platformPageRoute(child: const HomeScreen());
      case RouteName.exploreScreen:
        return _platformPageRoute(child: const ExploreScreen());
      case RouteName.savedScreen:
        return _platformPageRoute(child: const SavedScreen());
      // case RouteName.newsDetailScreen:
      //   return _platformPageRoute(child: const NewsDetailScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}

/// Use platform depended page route
_platformPageRoute({
  required Widget child,
  RouteSettings? settings,
}) {
  return Platform.isIOS
      ? CupertinoPageRoute(builder: (context) => child, settings: settings)
      : MaterialPageRoute(builder: (context) => child, settings: settings);
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  final AxisDirection direction;

  SlideRightRoute({required this.widget, this.direction = AxisDirection.right})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ));

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}

/// Create custom page route transition
_customPageRoute({
  required Widget child,
  RouteSettings? settings,
}) {
  return PageTransition(
    settings: settings,
    child: child,
    isIos: true,
    alignment: Alignment.centerLeft,
    type: PageTransitionType.rightToLeftJoined,
    childCurrent: child,
    duration: const Duration(seconds: 2),
  );
}

class SlideSideMoveRoute extends PageRouteBuilder {
  final Widget widget;
  SlideSideMoveRoute({required this.widget})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              Animation<Offset> custom = Tween<Offset>(
                      begin: const Offset(1.0, .0), end: const Offset(0.0, 0.0))
                  .animate(animation);
              return SlideTransition(position: custom, child: child);
            });
}
