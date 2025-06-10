import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/app/routes/app_router.gr.dart';
import 'package:pbnhs/core/constants/colors.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_cubit.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';
import 'package:pbnhs/gen/assets.gen.dart';

@RoutePage()
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final List<Map<String, dynamic>> navItems = [
    {
      "title": "List of Reports",
      "icon": Icons.list,
      "route": const ListReportsRoute(),
    },
    {
      "title": "Accounts",
      "icon": Icons.person,
      "route": const AccountsRoute(),
    },
    {
      "title": "Logout",
      "icon": Icons.logout,
      "route": null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final accountCubit = context.read<AccountCubit>();

    return StreamBuilder<User?>(
      stream: accountCubit.userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final firebaseUser = snapshot.data;
        if (firebaseUser == null) {
          return const Center(child: Text("Not logged in"));
        }

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

            // Filter navigation items based on user role
            final filteredNavItems = navItems
                .where((item) => item["title"] != "Accounts" || isSuperAdmin)
                .toList();

            return AutoTabsRouter(
              routes: filteredNavItems
                  .where((item) => item["route"] != null)
                  .map((item) => item["route"] as PageRouteInfo)
                  .toList(),
              builder: (context, child) {
                final tabsRouter = AutoTabsRouter.of(context);
                final activeIndex = tabsRouter.activeIndex;

                return Scaffold(
                  body: Row(
                    children: [
                      // Sidebar Navigation
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 15),
                        decoration: BoxDecoration(
                          color: AppColors.secondarybackground,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              Assets.images.pbnhs.path,
                              scale: 8,
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              child: ListView.builder(
                                itemCount: filteredNavItems.length,
                                itemBuilder: (context, index) {
                                  final item = filteredNavItems[index];
                                  final isSelected = item["route"] != null &&
                                      activeIndex == index;

                                  return GestureDetector(
                                    onTap: () {
                                      if (item["route"] == null) {
                                        _showLogoutDialog(context);
                                      } else {
                                        tabsRouter.setActiveIndex(index);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppColors.primary
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 16),
                                        child: Row(
                                          children: [
                                            Icon(
                                              item["icon"],
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                            const SizedBox(width: 16),
                                            Text(
                                              item["title"],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: isSelected
                                                    ? AppColors.textWhite
                                                    : AppColors.textBlack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: child,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
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
