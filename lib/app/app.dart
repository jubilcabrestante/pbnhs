import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/app/routes/app_router.dart';
import 'package:pbnhs/core/repository/user_repository.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_cubit.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';
import 'package:pbnhs/features/accounts/repository/user_account_repository.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_cubit.dart';
import 'package:pbnhs/features/list_reports/repository/list_report_repo.dart';
import 'package:pbnhs/features/list_type/domain/list_type_cubit/list_type_cubit.dart';
import 'package:pbnhs/features/list_type/repository/type_repo.dart';
import 'package:pbnhs/features/forgot_password/domain/cubit/forgot_password_cubit.dart';
import 'package:pbnhs/features/login/domain/cubit/user_auth_cubit.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ListTypeCubit(TypeRepository())),
        BlocProvider(
            create: (context) => AccountCubit(UserAccountRepository())),
        BlocProvider(
          create: (context) {
            final userAuthCubit = UserAuthCubit(UserAuthRepository());
            userAuthCubit.initializeUser(); // ✅ Ensure user details are fetched
            return userAuthCubit;
          },
        ),
        BlocProvider(
            create: (context) => ListReportsCubit(
                ListReportsRepository(), UserAuthRepository())),
        BlocProvider(
          create: (context) => ForgotPasswordCubit(UserAuthRepository()),
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
        // Optionally, add a builder to handle errors or loading states
        builder: (context, child) {
          return BlocListener<AccountCubit, AccountState>(
            listener: (context, state) {
              // Handle any state changes here (e.g., show dialogs, navigate, etc.)
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
    );
  }
}
