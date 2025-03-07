import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/common_widgets/custom_textfield.dart';
import 'package:pbnhs/core/utils/validators.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_cubit.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_state.dart';

class EditReportDialog extends StatefulWidget {
  final String selectedType;
  final String reportId;
  final String initialTitle;
  final String initialFileLink;

  const EditReportDialog({
    super.key,
    required this.selectedType,
    required this.reportId,
    required this.initialTitle,
    required this.initialFileLink,
  });

  @override
  State<EditReportDialog> createState() => _EditReportDialogState();
}

class _EditReportDialogState extends State<EditReportDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  Uint8List? _selectedFileData;
  String? _selectedFileName;

  @override
  void initState() {
    super.initState();
    _title.text = widget.initialTitle;
    _selectedFileName = widget.initialFileLink.split('/').last;
  }

  Future<void> _pickFile() async {
    final result = await context.read<ListReportsCubit>().selectFile();
    if (result != null) {
      setState(() {
        _selectedFileData = result['data'] as Uint8List?;
        _selectedFileName = result['name'] as String?;
      });
    }
  }

  void _removeFile() {
    setState(() {
      _selectedFileData = null;
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
                      'Edit Report',
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
                  text: 'Select New File',
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
                            text: 'Update Report',
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                context.read<ListReportsCubit>().updateReport(
                                      reportId: widget.reportId,
                                      title: _title.text,
                                      type: widget.selectedType,
                                      fileData:
                                          _selectedFileData, // Now Uint8List
                                      fileName:
                                          _selectedFileName, // Required for upload
                                    );
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
