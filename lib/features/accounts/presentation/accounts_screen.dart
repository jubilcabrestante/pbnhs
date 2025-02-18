import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/models/user_model/user_model.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_cubit.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';
import 'package:pbnhs/features/accounts/presentation/account_dialog.dart';

@RoutePage()
class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch users when the screen is first loaded
    context.read<AccountCubit>().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.read<AccountCubit>().getUsers(); // Refresh users list
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Accounts',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    CustomButton(
                      text: 'Add Account',
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => const AccountDialog(),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: state.users != null && state.users!.isNotEmpty
                      ? DataTable(
                          columnSpacing: 20.0, // Adjust spacing
                          headingRowColor: WidgetStateColor.resolveWith(
                              (states) => Colors.grey[300]!),
                          border:
                              TableBorder.all(color: Colors.grey), // Add border
                          columns: const [
                            DataColumn(
                                label: Text('Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Email',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Role',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Actions',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                          rows: state.users!.map((user) {
                            return DataRow(cells: [
                              DataCell(Text(user.name)),
                              DataCell(Text(user.email)),
                              DataCell(Text(user.role)),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        _showEditDialog(user);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        _deleteUser(user.uid);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                          }).toList(),
                        )
                      : const Center(child: Text('No users available')),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to show the edit dialog
  void _showEditDialog(UserModel user) {
    showDialog(
      context: context,
      builder: (context) => AccountDialog(user: user), // Pass the actual user
    );
  }

  // Function to delete a user
  void _deleteUser(String? uid) {
    if (uid == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('User ID is null, cannot delete account.')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete this account?'),
          actions: [
            TextButton(
              onPressed: () {
                context.read<AccountCubit>().deleteUser(uid);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
