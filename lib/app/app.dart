import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/app/routes/app_router.dart';
import 'package:pbnhs/core/domain/cubit/user_auth_cubit.dart';
import 'package:pbnhs/core/repository/user_repository.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_cubit.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';
import 'package:pbnhs/features/accounts/repository/user_account_repository.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_cubit.dart';
import 'package:pbnhs/features/list_reports/repository/list_report_repo.dart';
import 'package:pbnhs/features/list_type/domain/list_type_cubit/list_type_cubit.dart';
import 'package:pbnhs/features/list_type/repository/type_repo.dart';
import 'package:pbnhs/features/forgot_password/domain/cubit/forgot_password_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  final userAccountRepository = UserAccountRepository();
  final type = TypeRepository();
  final userauth = UserAuthRepository();
  final list = ListReportsRepository();
  final userAuth = UserAuthCubit(UserAuthRepository());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(create: (_) => userAccountRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ListTypeCubit(type)),
          BlocProvider(
              create: (context) => AccountCubit(userAccountRepository)),
          BlocProvider(create: (context) => UserAuthCubit(userauth)),
          BlocProvider(create: (context) => ListReportsCubit(list, userAuth)),
          BlocProvider(
            create: (context) => ForgotPasswordCubit(userauth),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: _appRouter.config(),
          builder: (context, child) {
            return BlocListener<AccountCubit, AccountState>(
              listener: (context, state) {
                if (state.errorMessage != null &&
                    state.errorMessage!.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage!)),
                  );
                }
              },
              child: child,
            );
          },
        ),
      ),
    );
  }
}
