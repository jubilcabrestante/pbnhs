import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_textfield.dart';
import 'package:pbnhs/core/models/user_model/user_model.dart';
import 'package:pbnhs/core/enum/user_roles.dart';
import 'package:pbnhs/core/models/user_roles/user_roles_model.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_cubit.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';
import 'package:pbnhs/core/utils/validators.dart'; // ✅ Import validators

class CreateAccountDialog extends StatefulWidget {
  const CreateAccountDialog({super.key});

  @override
  State<CreateAccountDialog> createState() => _CreateAccountDialogState();
}

class _CreateAccountDialogState extends State<CreateAccountDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserRole? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Create Account',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                CustomTextfield(
                  controller: _nameController,
                  label: 'Name',
                  validator: (value) => Validators.validateField(value, 'Name'),
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  controller: _emailController,
                  label: 'Email',
                  validator: (value) =>
                      Validators.validateField(value, 'Email'),
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  controller: _passwordController,
                  label: 'Password',
                  obscure: true,
                  validator: (value) =>
                      Validators.validateField(value, 'Password'),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField<UserRole>(
                    value: _selectedRole,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                    ),
                    hint: const Text("Select Role"),
                    onChanged: (UserRole? newValue) {
                      setState(() {
                        _selectedRole = newValue;
                      });
                    },
                    validator: (value) =>
                        Validators.validateDropdown(value, 'Role'),
                    items: UserRole.values.map((UserRole role) {
                      return DropdownMenuItem<UserRole>(
                        value: role,
                        child: Text(UserRoles.getRoleName(role)),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<AccountCubit, AccountState>(
                  builder: (context, state) {
                    return state.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final user = UserModel(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  role: _selectedRole
                                      .toString()
                                      .split('.')
                                      .last, // Convert the enum to a string
                                );

                                context.read<AccountCubit>().createAccount(
                                      user,
                                      _passwordController.text,
                                    );

                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Create Account'),
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
