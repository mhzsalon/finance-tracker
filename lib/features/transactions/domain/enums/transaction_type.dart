enum TransactionType {
  income,
  expenses;

  String get title {
    switch (this) {
      case TransactionType.expenses:
        return "Expenses";
      case TransactionType.income:
        return "Income";
    }
  }
}
