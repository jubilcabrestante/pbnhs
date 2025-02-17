import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_textfield.dart';
import 'package:pbnhs/core/models/user_roles/user_roles_model.dart';
import 'package:pbnhs/features/accounts/cubit/account_cubit.dart';
import 'package:pbnhs/core/models/user_model/user_model.dart';
import 'package:pbnhs/features/accounts/cubit/account_state.dart';
import 'package:pbnhs/core/enum/user_roles.dart';

@RoutePage()
class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  // Store selected role as UserRole enum
  UserRole? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountState>(
      listener: (context, state) {
        if (state.isSuccess) {
          // Handle successful user creation (e.g., navigate away)
        } else if (state.errorMessage != null) {
          // Show error message if user creation failed
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Create Account')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextfield(
                  controller: _nameController,
                  label: 'Name',
                ),
                CustomTextfield(
                  controller: _emailController,
                  label: 'Email',
                ),
                CustomTextfield(
                  controller: _passwordController,
                  label: 'Password',
                ),
                // Dropdown for role selection
                DropdownButton<UserRole>(
                  value: _selectedRole,
                  hint: Text("Select Role"),
                  onChanged: (UserRole? newValue) {
                    setState(() {
                      _selectedRole = newValue;
                    });
                  },
                  items: UserRole.values.map((UserRole role) {
                    return DropdownMenuItem<UserRole>(
                      value: role,
                      child: Text(UserRoles.getRoleName(role)),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () {
                          if (_selectedRole != null) {
                            final user = UserModel(
                              uid: '', // Generate or assign UID here
                              name: _nameController.text,
                              email: _emailController.text,
                              role: _selectedRole!, // Pass selected UserRole
                            );

                            // Call the createAccount function from the cubit
                            context
                                .read<AccountCubit>()
                                .createAccount(user, _passwordController.text);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please select a role')),
                            );
                          }
                        },
                        child: const Text('Create Account'),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _roleController.dispose();
    super.dispose();
  }
}
