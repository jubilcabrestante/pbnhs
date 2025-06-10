// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:pbnhs/app/app_screen.dart' as _i2;
import 'package:pbnhs/features/accounts/presentation/accounts_screen.dart'
    as _i1;
import 'package:pbnhs/features/forgot_password/presentation/forgot_password_screen.dart'
    as _i4;
import 'package:pbnhs/features/list_type/presentation/list_report_screen.dart'
    as _i5;
import 'package:pbnhs/features/login/change_password/presentation/change_password_screen.dart'
    as _i3;
import 'package:pbnhs/features/login/presentation/login_screen.dart' as _i6;

/// generated route for
/// [_i1.AccountsScreen]
class AccountsRoute extends _i7.PageRouteInfo<void> {
  const AccountsRoute({List<_i7.PageRouteInfo>? children})
    : super(AccountsRoute.name, initialChildren: children);

  static const String name = 'AccountsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountsScreen();
    },
  );
}

/// generated route for
/// [_i2.AppScreen]
class AppRoute extends _i7.PageRouteInfo<void> {
  const AppRoute({List<_i7.PageRouteInfo>? children})
    : super(AppRoute.name, initialChildren: children);

  static const String name = 'AppRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppScreen();
    },
  );
}

/// generated route for
/// [_i3.ChangePasswordScreen]
class ChangePasswordRoute extends _i7.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i7.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChangePasswordScreen();
    },
  );
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i7.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i7.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i5.ListReportsScreen]
class ListReportsRoute extends _i7.PageRouteInfo<void> {
  const ListReportsRoute({List<_i7.PageRouteInfo>? children})
    : super(ListReportsRoute.name, initialChildren: children);

  static const String name = 'ListReportsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.ListReportsScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}
