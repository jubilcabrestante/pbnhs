import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/models/user_model/user_model.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_cubit.dart';
import 'package:pbnhs/features/accounts/domain/accounts_cubit/account_state.dart';
import 'package:pbnhs/features/accounts/presentation/create_account.dart';

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
                    Text(
                      'Accounts',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CreateAccountDialog(),
                        );
                      },
                      child: const Text('Create Account'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Display list of users
                state.users != null && state.users!.isNotEmpty
                    ? Expanded(
                        child: SingleChildScrollView(
                          scrollDirection:
                              Axis.horizontal, // Enable horizontal scrolling
                          child: DataTable(
                            columnSpacing: 20.0, // Adjust spacing
                            headingRowColor: WidgetStateColor.resolveWith(
                                (states) => Colors.grey[300]!),
                            border: TableBorder.all(
                                color: Colors.grey), // Add border
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
                                          // Trigger the edit action
                                          // You can show an edit dialog or open an edit screen
                                          _showEditDialog(user);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          // Trigger the delete action
                                          _deleteUser(user.uid);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ]);
                            }).toList(),
                          ),
                        ),
                      )
                    : const Center(child: Text('No users available')),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to show the edit dialog (you can replace this with a custom screen)
  void _showEditDialog(UserModel user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Account'),
          content: TextField(
            controller: TextEditingController(text: user.name),
            decoration: const InputDecoration(hintText: 'Enter new name'),
            onChanged: (value) {
              // You can modify the user model as needed here
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<AccountCubit>().updateUser(user);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
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

  // Function to delete a user
  // Function to delete a user
  void _deleteUser(String? uid) {
    if (uid == null) {
      // Handle the case where uid is null, maybe show a message
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
