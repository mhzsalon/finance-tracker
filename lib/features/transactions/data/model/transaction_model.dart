import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universalexpensetracker/features/transactions/domain/entities/transaction_entity.dart';
import 'package:universalexpensetracker/features/transactions/domain/enums/transaction_type.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  const TransactionModel._(); // private constructor

  const factory TransactionModel({
    required String id,
    required double amount,
    required String type, // income | expense
    required int? categoryId, // required for expense, optional for income
    required DateTime date,
    required String title,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  TransactionEntity toEntity() => TransactionEntity(
    id: id,
    amount: amount,
    categoryId: categoryId,
    date: date,
    title: title,
    type: type.toLowerCase() == TransactionType.income.name
        ? TransactionType.income
        : TransactionType.expenses,
  );
}
