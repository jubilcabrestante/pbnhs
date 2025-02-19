import 'package:auto_route/auto_route.dart';
import 'package:pbnhs/app/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppRoute.page, initial: true, children: [
          AutoRoute(page: AccountsRoute.page, initial: true),
          AutoRoute(page: ListTypeRoute.page),
          AutoRoute(page: ListReportsRoute.page),
        ]),
      ];
}
