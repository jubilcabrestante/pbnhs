import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/common_widgets/custom_textfield.dart';
import 'package:pbnhs/core/utils/validators.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_cubit.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_state.dart';
import 'package:pbnhs/features/list_reports/repository/model/list_reports_model.dart';

class ListReportsDialog extends StatefulWidget {
  final String selectedType;

  const ListReportsDialog({super.key, required this.selectedType});

  @override
  State<ListReportsDialog> createState() => _ListReportsDialogState();
}

class _ListReportsDialogState extends State<ListReportsDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    const Text(
                      'Submit Report',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  controller: _title,
                  label: 'Title',
                  validator: (value) =>
                      Validators.validateField(value, 'Title'),
                ),
                const SizedBox(height: 20),
                BlocConsumer<ListReportsCubit, ListReportsState>(
                  listener: (context, state) {
                    if (state.isSuccess) {
                      Navigator.pop(context);
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
                            text: 'Submit Report',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                final report = ListReportsModel(
                                  title: _title.text,
                                  type: widget
                                      .selectedType, // Use the selectedType passed to the dialog
                                  dateUploaded: DateTime
                                      .now(), // Set the current timestamp
                                  createdBy: "User",
                                  link:
                                      '', // Replace with actual user info if available
                                );

                                context
                                    .read<ListReportsCubit>()
                                    .addReport(report, widget.selectedType);
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
