import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/app/routes/app_router.gr.dart';
import 'package:pbnhs/features/onboarding%20presentations/login/domain/cubit/user_auth_cubit.dart';
import 'package:pbnhs/features/onboarding%20presentations/login/domain/cubit/user_auth_state.dart';
import 'package:pbnhs/gen/assets.gen.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<UserAuthCubit, UserAuthState>(
          builder: (context, state) {
            final userAuth = state.userAuthModel;
            bool isSuperAdmin = userAuth?.userRole == 'super-admin';

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Sidebar
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xfff0ecf9),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.images.pbnhs.path,
                        scale: 8,
                      ),
                      const SizedBox(height: 15),
                      _buildTile(
                        context,
                        icon: Icons.list,
                        title: 'List of Reports',
                        route: const ListTypeRoute(),
                      ),
                      if (isSuperAdmin)
                        _buildTile(
                          context,
                          icon: Icons.person,
                          title: 'Accounts',
                          route: const AccountsRoute(),
                        ),
                      const Spacer(),
                      _buildLogoutButton(
                          context), // ✅ Logout Button with Dialog
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Right Side Content
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: const AutoRouter(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context,
      {required IconData icon,
      required String title,
      required PageRouteInfo route}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: () => context.router.push(route),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.logout,
      ),
      title: const Text(
        'Logout',
      ),
      onTap: () => _showLogoutDialog(context), // ✅ Show confirmation dialog
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.of(dialogContext).pop(), // Close dialog
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<UserAuthCubit>().logOut(); // Call logOut function
                context.router.replace(const LoginRoute()); // Navigate to login
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
