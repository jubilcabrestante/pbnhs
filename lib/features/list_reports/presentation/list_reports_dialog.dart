import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/common_widgets/custom_textfield.dart';
import 'package:pbnhs/core/utils/validators.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_cubit.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_state.dart';
import 'dart:io';

class ListReportsDialog extends StatefulWidget {
  final String selectedType;
  final String user;

  const ListReportsDialog({
    super.key,
    required this.selectedType,
    required this.user,
  });

  @override
  State<ListReportsDialog> createState() => _ListReportsDialogState();
}

class _ListReportsDialogState extends State<ListReportsDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  File? _selectedFile;
  String? _selectedFileName;

  Future<void> _pickFile() async {
    final result = await context.read<ListReportsCubit>().selectFile();
    if (result != null) {
      setState(() {
        _selectedFile = result;
        _selectedFileName = result.path.split('/').last;
      });
    }
  }

  void _removeFile() {
    setState(() {
      _selectedFile = null;
      _selectedFileName = null;
    });
  }

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
                const SizedBox(height: 10),
                if (_selectedFileName != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Selected File: $_selectedFileName',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 20),
                        onPressed: _removeFile,
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Select File',
                  onTap: _pickFile,
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
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                context.read<ListReportsCubit>().addReport(
                                      title: _title.text,
                                      type: widget.selectedType,
                                      createdBy: widget.user,
                                      file: _selectedFile, // Nullable file
                                    );
                              }
                            });
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
