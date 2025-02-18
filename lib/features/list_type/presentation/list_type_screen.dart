import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/features/list_type/domain/list_type_cubit/list_type_cubit.dart';
import 'package:pbnhs/features/list_type/domain/list_type_cubit/list_type_state.dart';

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
    context.read<ListTypeCubit>().fetchTypes(); // ✅ Fetch on screen load
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: BlocBuilder<ListTypeCubit, ListTypeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            } else if (state.typeModel.isEmpty) {
              return const Center(child: Text("No types available"));
            }

            // Flatten all type names into a single list
            final List<String> allTypes =
                state.typeModel.expand((typeModel) => typeModel.types).toList();

            return Padding(
              padding: const EdgeInsets.all(25),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // ✅ 2-column layout
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: height / 425,
                ),
                itemCount: allTypes.length,
                itemBuilder: (context, index) {
                  final typeName = allTypes[index];
                  final backgroundColor =
                      Colors.primaries[index % Colors.primaries.length];

                  return GestureDetector(
                    onTap: () {
                      // Handle tap action if needed
                    },
                    child: LayoutBuilder(
                      // ✅ Ensures the Container sizes itself within its parent
                      builder: (context, constraints) {
                        return Container(
                          width:
                              constraints.maxWidth, // ✅ Adjusts width to parent
                          height: constraints
                              .maxHeight, // ✅ Adjusts height to parent
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Text(
                            typeName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListTypeCubit>().fetchTypes();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
