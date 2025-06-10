import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/common_widgets/custom_textfield.dart';
import 'package:pbnhs/core/enum/enum_action.dart';
import 'package:pbnhs/core/utils/validators.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_cubit.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_state.dart';

class ReportDialog extends StatefulWidget {
  final EnumAction action;
  final String selectedType;
  final String? user;
  final String? reportId;
  final String? initialTitle;
  final String? initialFileLink;

  const ReportDialog({
    super.key,
    required this.action,
    required this.selectedType,
    this.user,
    this.reportId,
    this.initialTitle,
    this.initialFileLink,
  });

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _title;
  Uint8List? _selectedFileData;
  String? _selectedFileName;
  String? _fileError;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.initialTitle ?? '');
    if (widget.action == EnumAction.update && widget.initialFileLink != null) {
      _selectedFileName = widget.initialFileLink!.split('/').last;
    }
  }

  Future<void> _pickFile() async {
    final result = await context.read<ListReportsCubit>().selectFile();
    if (result != null) {
      setState(() {
        _selectedFileData = result['data'] as Uint8List?;
        _selectedFileName = result['name'] as String?;
        if (widget.action == EnumAction.add) {
          _fileError = null;
        }
      });
    }
  }

  void _removeFile() {
    setState(() {
      _selectedFileData = null;
      _selectedFileName = null;
      if (widget.action == EnumAction.add) {
        _fileError = 'Please select a file';
      }
    });
  }

  void _validateAndSubmit() {
    final isValidForm = _formKey.currentState?.validate() ?? false;
    final hasFile = _selectedFileData != null && _selectedFileName != null;

    if (widget.action == EnumAction.add) {
      setState(() {
        _fileError = hasFile ? null : 'Please select a file';
      });
    }

    if (isValidForm && (widget.action == EnumAction.update || hasFile)) {
      if (widget.action == EnumAction.add) {
        context.read<ListReportsCubit>().addReport(
              title: _title.text,
              type: widget.selectedType,
              createdBy: widget.user!,
              fileData: _selectedFileData,
              fileName: _selectedFileName,
            );
      } else {
        context.read<ListReportsCubit>().updateReport(
              reportId: widget.reportId!,
              title: _title.text,
              type: widget.selectedType,
              fileData: _selectedFileData,
              fileName: _selectedFileName,
            );
      }
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
                    Text(
                      '${widget.action.name} Report',
                      style: const TextStyle(
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
                      text: widget.action == EnumAction.update
                          ? 'Select New File'
                          : 'Select File',
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
                            text: '${widget.action.name} Report',
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