import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/common_widgets/custom_textfield.dart';
import 'package:pbnhs/core/enum/user_roles.dart';
import 'package:pbnhs/features/accounts/repository/account_model/account_vm.dart';
import 'package:pbnhs/core/models/user_roles/user_roles_model.dart';
import 'package:pbnhs/core/utils/validators.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_cubit.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';

class AccountDialog extends StatefulWidget {
  final AccountVm? user;
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
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user!.name;
      _emailController.text = widget.user!.email;
      _selectedRole = UserRoleExtension.fromString(widget.user!.role);
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final account = AccountVm(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        role: UserRoles.getRoleName(_selectedRole!),
        uid: widget.user?.uid ?? '',
        isNewUser: widget.user?.isNewUser ?? true,
      );

      final cubit = context.read<AccountCubit>();
      if (widget.user == null) {
        cubit.createAccount(account, _passwordController.text.trim());
      } else {
        cubit.updateUser(account);
      }
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
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
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
                      context.maybePop();
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
                            onTap: _submit,
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
