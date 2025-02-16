import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/constants/colors.dart';
import 'package:pbnhs/features/list_of_reports/domain/cubit/list_reports_cubit.dart';
import 'package:pbnhs/features/list_of_reports/domain/cubit/list_reports_state.dart';

@RoutePage()
class ListTypeScreen extends StatefulWidget {
  const ListTypeScreen({super.key});

  @override
  State<ListTypeScreen> createState() => _ListTypeScreenState();
}

class _ListTypeScreenState extends State<ListTypeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ListReportsCubit>().fetchTypes(); // ✅ Fetch on screen load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondarybackground,
      body: BlocBuilder<ListReportsCubit, ListReportsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          } else if (state.typeModel.isEmpty) {
            return const Center(child: Text("No types available"));
          }

          return Container(
            decoration: BoxDecoration(color: AppColors.primary),
            child: ListView.builder(
              itemCount: state.typeModel.length,
              itemBuilder: (context, index) {
                final type = state.typeModel[index];
                final isSelected = type == state.selectedType;

                return ListTile(
                  title: Text(
                    type.types as String,
                    style: TextStyle(color: AppColors.textWhite),
                  ),
                  tileColor:
                      isSelected ? Colors.blue.withValues(alpha: 0.3) : null,
                  onTap: () {
                    context.read<ListReportsCubit>().selectType(type);
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<ListReportsCubit>()
              .fetchTypes(); // ✅ Fetch again on button press
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
