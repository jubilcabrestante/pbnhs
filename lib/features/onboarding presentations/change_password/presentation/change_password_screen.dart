import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/constants/colors.dart';

import '../domain/cubit/change_password_cubit.dart';

@RoutePage()
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.router
              .replaceNamed('/home'); // Navigate to home screen after success
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.secondarybackground.withOpacity(0.4),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              color: AppColors.primarybackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Set Your Password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 10),
                const Text(
                  'As a new user, please set your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) {
                    return CustomButton(
                      text: 'Update Password',
                      onTap: state.isLoading
                          ? null
                          : () {
                              if (_passwordController.text ==
                                  _confirmPasswordController.text) {
                                context
                                    .read<ChangePasswordCubit>()
                                    .changePassword(
                                        _passwordController.text.trim());
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Passwords do not match!')),
                                );
                              }
                            },
                      child: state.isLoading
                          ? const CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white)
                          : const Text(
                              'Update Password',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
