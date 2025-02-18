import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_textfield.dart';
import 'package:pbnhs/core/enum/user_roles.dart';
import 'package:pbnhs/core/models/user_model/user_model.dart';
import 'package:pbnhs/core/models/user_roles/user_roles_model.dart';
import 'package:pbnhs/core/utils/validators.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_cubit.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';

import '../../../core/common_widgets/custom_button.dart';

class EditAccountDialog extends StatefulWidget {
  final UserModel user; // Accept the user model to prepopulate the fields

  const EditAccountDialog({super.key, required this.user});

  @override
  State<EditAccountDialog> createState() => _EditAccountDialogState();
}

class _EditAccountDialogState extends State<EditAccountDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  UserRole? _selectedRole;

  @override
  void initState() {
    super.initState();
    // Prepopulate the fields with the current user data
    _nameController.text = widget.user.name;
    _emailController.text = widget.user.email;
    _selectedRole = UserRole.values.firstWhere(
      (role) => role.toString().split('.').last == widget.user.role,
      orElse: () => UserRole.teacher,
    );
  }

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
                const Text('Edit Account',
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
                BlocListener<AccountCubit, AccountState>(
                  listener: (context, state) {
                    if (state.isSuccess) {
                      Navigator.pop(context); // Close the dialog on success
                    } else if (state.errorMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage!)),
                      );
                    }
                  },
                  child: BlocBuilder<AccountCubit, AccountState>(
                    builder: (context, state) {
                      return state.isLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              text: 'Save Changes',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  final updatedUser = widget.user.copyWith(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    role: _selectedRole
                                            ?.toString()
                                            .split('.')
                                            .last ??
                                        '',
                                  );

                                  context.read<AccountCubit>().updateUser(
                                      updatedUser); // Pass the updated user
                                }
                              },
                            );
                    },
                  ),
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
    super.dispose();
  }
}
