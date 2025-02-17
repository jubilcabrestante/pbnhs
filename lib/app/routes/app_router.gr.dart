// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:pbnhs/app/app_screen.dart' as _i2;
import 'package:pbnhs/features/accounts/presentation/accounts_screen.dart'
    as _i1;
import 'package:pbnhs/features/list_type/list_reports_screen.dart' as _i3;
import 'package:pbnhs/features/list_type/presentation/list_type_screen.dart'
    as _i4;

/// generated route for
/// [_i1.AccountsScreen]
class AccountsRoute extends _i5.PageRouteInfo<void> {
  const AccountsRoute({List<_i5.PageRouteInfo>? children})
    : super(AccountsRoute.name, initialChildren: children);

  static const String name = 'AccountsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountsScreen();
    },
  );
}

/// generated route for
/// [_i2.AppScreen]
class AppRoute extends _i5.PageRouteInfo<void> {
  const AppRoute({List<_i5.PageRouteInfo>? children})
    : super(AppRoute.name, initialChildren: children);

  static const String name = 'AppRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppScreen();
    },
  );
}

/// generated route for
/// [_i3.ListReportsScreen]
class ListReportsRoute extends _i5.PageRouteInfo<void> {
  const ListReportsRoute({List<_i5.PageRouteInfo>? children})
    : super(ListReportsRoute.name, initialChildren: children);

  static const String name = 'ListReportsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.ListReportsScreen();
    },
  );
}

/// generated route for
/// [_i4.ListTypeScreen]
class ListTypeRoute extends _i5.PageRouteInfo<void> {
  const ListTypeRoute({List<_i5.PageRouteInfo>? children})
    : super(ListTypeRoute.name, initialChildren: children);

  static const String name = 'ListTypeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.ListTypeScreen();
    },
  );
}
