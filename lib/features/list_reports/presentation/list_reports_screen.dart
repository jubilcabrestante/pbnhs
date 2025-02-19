import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/utils/date.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_cubit.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_state.dart';
import 'package:pbnhs/features/list_reports/presentation/list_reports_dialog.dart';

@RoutePage()
class ListReportsScreen extends StatefulWidget {
  final String selectedType;
  const ListReportsScreen({super.key, required this.selectedType});

  @override
  State<ListReportsScreen> createState() => _ListReportsScreenState();
}

class _ListReportsScreenState extends State<ListReportsScreen> {
  String? selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = widget.selectedType;
    context.read<ListReportsCubit>().getReports(selectedType!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListReportsCubit, ListReportsState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
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
                      'Reports',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    CustomButton(
                      text: 'Submit Report',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              ListReportsDialog(selectedType: selectedType!),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: state.reports != null && state.reports!.isNotEmpty
                      ? DataTable(
                          columnSpacing: 20.0,
                          headingRowColor: WidgetStateColor.resolveWith(
                              (states) => Colors.grey[300]!),
                          border: TableBorder.all(color: Colors.grey),
                          columns: const [
                            DataColumn(
                                label: Text('Title',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Uploaded Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Created By',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Actions',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                          rows: state.reports!.map((report) {
                            return DataRow(cells: [
                              DataCell(Text(report.title)),
                              DataCell(Text(formatDate(report.dateUploaded))),
                              DataCell(Text(report.createdBy)),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        // Edit functionality
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () {
                                        context
                                            .read<ListReportsCubit>()
                                            .deleteReport(
                                              report.id!,
                                              selectedType!,
                                            );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                          }).toList(),
                        )
                      : const Center(child: Text('No reports available')),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
