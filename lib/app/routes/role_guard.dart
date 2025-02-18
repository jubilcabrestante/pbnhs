// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// class RoleGuard extends AutoRouteGuard {
//   final String userRole; // The user's role passed from your auth system

//   RoleGuard(this.userRole);

//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (userRole == 'super-admin') {
//       resolver.next(true); // Allow navigation
//     } else {
//       router.replace(HomeRoute()); // Redirect to Home if not super-admin
//     }
//   }
// }
