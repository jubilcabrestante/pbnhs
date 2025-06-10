import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_vm.g.dart';

@JsonSerializable()
class TypeVm {
  final String typeName;

  const TypeVm({
    required this.typeName,
  });

  factory TypeVm.fromJson(Map<String, dynamic> json) => _$TypeVmFromJson(json);

  Map<String, dynamic> toJson() => _$TypeVmToJson(this);
}
