import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/common_widgets/custom_textfield.dart';
import 'package:pbnhs/core/enum/user_roles.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';
import 'package:pbnhs/core/models/user_roles/user_roles_model.dart';
import 'package:pbnhs/core/utils/validators.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_cubit.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';

class AccountDialog extends StatefulWidget {
  final UserModel? user;
  const AccountDialog({super.key, this.user});

  @override
  State<AccountDialog> createState() => _AccountDialogState();
}

class _AccountDialogState extends State<AccountDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserRole? _selectedRole;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user!.name;
      _emailController.text = widget.user!.email;
      _selectedRole = UserRole.values.firstWhere(
        (role) => role.toString().split('.').last == widget.user!.role,
        orElse: () => UserRole.teacher,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isEditing = widget.user != null;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEditing ? 'Edit Account' : 'Create Account',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context)),
                  ],
                ),
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

                if (!isEditing) ...[
                  CustomTextfield(
                    controller: _passwordController,
                    label: 'Password',
                    obscure: true,
                    validator: (value) =>
                        Validators.validateField(value, 'Password'),
                  ),
                  const SizedBox(height: 15),
                ],

                DropdownButtonFormField<UserRole>(
                  value: _selectedRole,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
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
                const SizedBox(height: 20),

                BlocConsumer<AccountCubit, AccountState>(
                  listener: (context, state) {
                    if (state.isSuccess) {
                      Navigator.pop(context);
                      context.read<AccountCubit>().getUsers();
                    } else if (state.errorMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage!)),
                      );
                    }
                  },
                  builder: (context, state) {
                    return state.isLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            text: isEditing ? 'Save Changes' : 'Create Account',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                final accountCubit =
                                    context.read<AccountCubit>();
                                if (isEditing) {
                                  final updatedUser = widget.user!.copyWith(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    role: _selectedRole
                                            ?.toString()
                                            .split('.')
                                            .last ??
                                        '',
                                  );
                                  accountCubit.updateUser(updatedUser);
                                } else {
                                  final newUser = UserModel(
                                    uid: '',
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    role: _selectedRole
                                            ?.toString()
                                            .split('.')
                                            .last ??
                                        '',
                                  );

                                  accountCubit.createAccount(
                                      newUser, _passwordController.text);
                                }
                              }
                            },
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
}
