import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/app/routes/app_router.gr.dart';
import 'package:pbnhs/features/accounts/repository/user_account_repository.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';
import 'package:pbnhs/gen/assets.gen.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepo = context.read<UserAccountRepository>();

    return StreamBuilder<User?>(
      stream: userRepo.currentUserStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final firebaseUser = snapshot.data;

        if (firebaseUser == null) {
          return const Center(child: Text("Not logged in"));
        }

        // Fetch the Firestore user document using uid
        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('admin')
              .doc(firebaseUser.uid)
              .get(),
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
              return const Center(child: Text("User document not found"));
            }

            final userMap = userSnapshot.data!.data() as Map<String, dynamic>;
            final userVm = UserVm.fromJson(userMap);
            final bool isSuperAdmin = userVm.role == 'super-admin';

            return Scaffold(
              body: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 15),
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
                          _buildLogoutButton(context),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const AutoRouter(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
      leading: const Icon(Icons.logout),
      title: const Text('Logout'),
      onTap: () => _showLogoutDialog(context),
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
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  context.router.replace(const LoginRoute());
                }
              },
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
