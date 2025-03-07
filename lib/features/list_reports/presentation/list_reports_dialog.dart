import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/common_widgets/custom_textfield.dart';
import 'package:pbnhs/core/utils/validators.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_cubit.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_state.dart';
import 'dart:typed_data';

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
  Uint8List? _selectedFileData;
  String? _selectedFileName;
  String? _fileError; // To track file validation errors

  Future<void> _pickFile() async {
    final result = await context.read<ListReportsCubit>().selectFile();
    if (result != null) {
      setState(() {
        _selectedFileData = result['data'] as Uint8List?;
        _selectedFileName = result['name'] as String?;
        _fileError = null; // Clear error when a file is selected
      });
    }
  }

  void _removeFile() {
    setState(() {
      _selectedFileData = null;
      _selectedFileName = null;
      _fileError = 'Please select a file'; // Show error if file is removed
    });
  }

  void _validateAndSubmit() {
    final isValidForm = _formKey.currentState!.validate();
    final hasFile = _selectedFileData != null && _selectedFileName != null;

    setState(() {
      _fileError = hasFile ? null : 'Please select a file'; // Set error if no file is selected
    });

    if (isValidForm && hasFile) {
      context.read<ListReportsCubit>().addReport(
            title: _title.text,
            type: widget.selectedType,
            createdBy: widget.user,
            fileData: _selectedFileData,
            fileName: _selectedFileName,
          );
    }
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
                  validator: (value) => Validators.validateField(value, 'Title'),
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
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(
                      text: 'Select File',
                      onTap: _pickFile,
                    ),
                    if (_fileError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                        child: Text(
                          _fileError!,
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
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
                            onTap: _validateAndSubmit,
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