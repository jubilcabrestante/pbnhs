import 'package:auto_route/auto_route.dart';
import 'package:pbnhs/app/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(
          page: ForgotPasswordRoute.page,
        ),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: AppRoute.page, children: [
          AutoRoute(page: AccountsRoute.page),
          AutoRoute(page: ListReportsRoute.page),
        ]),
      ];
}
