import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universalexpensetracker/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:universalexpensetracker/features/dashboard/domain/usecase/get_dashboard_usecase.dart';
import 'package:universalexpensetracker/features/transactions/di/transactions_di.dart';

final providerOfGetDashboardUsecase = Provider<GetDashboardUsecase>((ref) {
  return GetDashboardUsecase(ref.read(providerOfTransactionRepository));
});

final streamProviderOfDashboard = StreamProvider<DashboardEntity>((ref) {
  final useCase = ref.read(providerOfGetDashboardUsecase);

  return useCase().map(
    (either) =>
        either.fold((failure) => throw failure, (transactions) => transactions),
  );
});
