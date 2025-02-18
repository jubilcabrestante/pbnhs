import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pbnhs/app/routes/app_router.gr.dart';
import 'package:pbnhs/gen/assets.gen.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Wrap everything in Center to align in the middle
        child: Row(
          mainAxisSize: MainAxisSize.min, // 👈 Prevents taking full width
          children: [
            // Sidebar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
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
                  _buildTile(
                    context,
                    icon: Icons.person,
                    title: 'Accounts',
                    route: const AccountsRoute(),
                  ),
                ],
              ),
            ),
            const SizedBox(
                width: 20), // 👈 Adds spacing between sidebar and content
            // Right Side Content
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.9,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: const AutoRouter(),
            ),
          ],
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
}
