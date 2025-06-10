import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/common_widgets/custom_button.dart';
import 'package:pbnhs/core/constants/colors.dart';
import 'package:pbnhs/core/enum/enum_action.dart';
import 'package:pbnhs/core/utils/date.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_cubit.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_state.dart';
import 'package:pbnhs/features/list_reports/presentation/list_reports_dialog.dart';
import 'package:pbnhs/features/list_type/domain/list_type_cubit/list_type_cubit.dart';
import 'package:pbnhs/features/list_type/domain/list_type_cubit/list_type_state.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ListReportsScreen extends StatefulWidget {
  const ListReportsScreen({super.key});

  @override
  State<ListReportsScreen> createState() => _ListReportsScreenState();
}

class _ListReportsScreenState extends State<ListReportsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ListTypeCubit>().fetchTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "List of Types",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            BlocBuilder<ListTypeCubit, ListTypeState>(
              builder: (context, typestate) {
                return Row(
                  children: typestate.typeVm.map((type) {
                    return Container(
                      width: 250,
                      height: 50,
                      margin: const EdgeInsets.only(right: 10),
                      child: CustomButton(
                        text: type.typeName,
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: typestate.selectedType == type.typeName
                              ? AppColors.textWhite
                              : AppColors.textBlack,
                        ),
                        color: typestate.selectedType == type.typeName
                            ? AppColors.primary
                            : AppColors.secondarybackground,
                        onTap: () {
                          context
                              .read<ListReportsCubit>()
                              .getReports(type.typeName);
                          context.read<ListTypeCubit>().updateType(type);
                        },
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(width: 20),
            Expanded(
              child: BlocBuilder<ListTypeCubit, ListTypeState>(
                builder: (context, typestate) {
                  return BlocBuilder<ListReportsCubit, ListReportsState>(
                    builder: (context, state) {
                      if (typestate.selectedType == null) {
                        return const Center(
                          child: Text('Please select a type to view reports'),
                        );
                      }

                      if (state.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Reports for: ${typestate.selectedType ?? ''}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                CustomButton(
                                  text:
                                      'Add Report to ${typestate.selectedType.toString()}',
                                  textStyle: TextStyle(
                                      fontSize: 14, color: AppColors.textWhite),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => ReportDialog(
                                        action: EnumAction.add,
                                        selectedType: typestate.selectedType!,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: constraints.maxWidth,
                                          minHeight: constraints.maxHeight,
                                        ),
                                        child: DataTable(
                                          headingRowColor:
                                              WidgetStateColor.resolveWith(
                                            (states) => AppColors.secondary,
                                          ),
                                          columnSpacing: 20.0,
                                          columns: const [
                                            DataColumn(
                                              label: Expanded(
                                                child: Center(
                                                  child: Text('Title',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Expanded(
                                                child: Center(
                                                  child: Text('Uploaded Date',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Expanded(
                                                child: Center(
                                                  child: Text('Created By',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Expanded(
                                                child: Center(
                                                  child: Text('Download',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Expanded(
                                                child: Center(
                                                  child: Text('Actions',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                            ),
                                          ],
                                          rows: (state.reports ?? [])
                                              .map((report) {
                                            return DataRow(cells: [
                                              DataCell(Center(
                                                  child: Text(
                                                      report.title.isNotEmpty
                                                          ? report.title
                                                          : ''))),
                                              DataCell(Center(
                                                  child: Text(formatDate(
                                                      report.dateUploaded)))),
                                              DataCell(Center(
                                                  child: Text(report
                                                          .createdBy.isNotEmpty
                                                      ? report.createdBy
                                                      : ''))),
                                              DataCell(
                                                Center(
                                                  child: IconButton(
                                                    icon: const Icon(
                                                        Icons.download),
                                                    onPressed: () async {
                                                      if (report
                                                          .link.isNotEmpty) {
                                                        final uri = Uri.parse(
                                                            report.link);
                                                        if (await canLaunchUrl(
                                                            uri)) {
                                                          await launchUrl(uri);
                                                        } else {
                                                          if (context.mounted) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      'Could not download file')),
                                                            );
                                                          }
                                                        }
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              DataCell(
                                                Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.edit),
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                ReportDialog(
                                                              action: EnumAction
                                                                  .update,
                                                              selectedType:
                                                                  typestate
                                                                      .selectedType!,
                                                              reportId:
                                                                  report.id,
                                                              initialTitle:
                                                                  report.title,
                                                              initialFileLink:
                                                                  report.link,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.delete,
                                                            color: Colors.red),
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                              title: const Text(
                                                                  "Confirm Deletion"),
                                                              content: const Text(
                                                                  "Are you sure you want to delete this report?"),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context),
                                                                  child: const Text(
                                                                      "Cancel"),
                                                                ),
                                                                TextButton(
                                                                  onPressed:
                                                                      () async {
                                                                    await context
                                                                        .read<
                                                                            ListReportsCubit>()
                                                                        .deleteReport(
                                                                          report
                                                                              .id,
                                                                          typestate
                                                                              .selectedType!,
                                                                        );
                                                                    if (!context
                                                                        .mounted) {
                                                                      return;
                                                                    }
                                                                    Navigator.pop(
                                                                        context);
                                                                    context
                                                                        .read<
                                                                            ListReportsCubit>()
                                                                        .getReports(
                                                                            typestate.selectedType!);
                                                                  },
                                                                  child: const Text(
                                                                      "Delete",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red)),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]);
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            if ((state.reports ?? []).isEmpty)
                              const Center(child: Text('No reports available')),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
