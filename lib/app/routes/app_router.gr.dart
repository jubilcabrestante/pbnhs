// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:pbnhs/app/app_screen.dart' as _i2;
import 'package:pbnhs/features/accounts/presentation/accounts_screen.dart'
    as _i1;
import 'package:pbnhs/features/list_reports/presentation/list_reports_screen.dart'
    as _i5;
import 'package:pbnhs/features/list_type/presentation/list_type_screen.dart'
    as _i6;
import 'package:pbnhs/features/onboarding%20presentations/change_password/presentation/change_password_screen.dart'
    as _i3;
import 'package:pbnhs/features/onboarding%20presentations/forgot_password/presentation/forgot_password_screen.dart'
    as _i4;
import 'package:pbnhs/features/onboarding%20presentations/login/presentation/login_screen.dart'
    as _i7;

/// generated route for
/// [_i1.AccountsScreen]
class AccountsRoute extends _i8.PageRouteInfo<void> {
  const AccountsRoute({List<_i8.PageRouteInfo>? children})
    : super(AccountsRoute.name, initialChildren: children);

  static const String name = 'AccountsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountsScreen();
    },
  );
}

/// generated route for
/// [_i2.AppScreen]
class AppRoute extends _i8.PageRouteInfo<void> {
  const AppRoute({List<_i8.PageRouteInfo>? children})
    : super(AppRoute.name, initialChildren: children);

  static const String name = 'AppRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppScreen();
    },
  );
}

/// generated route for
/// [_i3.ChangePasswordScreen]
class ChangePasswordRoute extends _i8.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i8.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChangePasswordScreen();
    },
  );
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i8.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i8.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i5.ListReportsScreen]
class ListReportsRoute extends _i8.PageRouteInfo<ListReportsRouteArgs> {
  ListReportsRoute({
    _i9.Key? key,
    required String selectedType,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         ListReportsRoute.name,
         args: ListReportsRouteArgs(key: key, selectedType: selectedType),
         initialChildren: children,
       );

  static const String name = 'ListReportsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ListReportsRouteArgs>();
      return _i5.ListReportsScreen(
        key: args.key,
        selectedType: args.selectedType,
      );
    },
  );
}

class ListReportsRouteArgs {
  const ListReportsRouteArgs({this.key, required this.selectedType});

  final _i9.Key? key;

  final String selectedType;

  @override
  String toString() {
    return 'ListReportsRouteArgs{key: $key, selectedType: $selectedType}';
  }
}

/// generated route for
/// [_i6.ListTypeScreen]
class ListTypeRoute extends _i8.PageRouteInfo<void> {
  const ListTypeRoute({List<_i8.PageRouteInfo>? children})
    : super(ListTypeRoute.name, initialChildren: children);

  static const String name = 'ListTypeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.ListTypeScreen();
    },
  );
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginScreen();
    },
  );
}
