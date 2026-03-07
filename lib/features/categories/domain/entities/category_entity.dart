import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final bool isCustom;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.isCustom,
  });

  @override
  List<Object?> get props => [id, name, isCustom];
}
