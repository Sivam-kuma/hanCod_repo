import 'package:hancod/shared/controllers/providers/cleaning_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../../providers/cleaning_provider.dart';
import '../../domains/repositories/abstractRepository.dart';
import '../../models/cleaning.dart';
// import '../../domain/repositories/cleaning_repository.dart';
import 'cleaning_state.dart';

part 'cleaning_notifier.g.dart';

@Riverpod(keepAlive: true)
class CleaningNotifier extends _$CleaningNotifier {
  late final CleaningRepository _repo;

  @override
  CleaningState build() {

    _repo = ref.read(cleaningRepositoryProvider);


    state = const CleaningState(
      status: CleaningStatus.initial,
      services: [],
    );


    Future.microtask(fetchServices);

    return state;
  }

  Future<void> fetchServices() async {

    if (!ref.mounted) return;

    state = state.copyWith(status: CleaningStatus.loading);

    try {
      final services = await _repo.fetchServices();

      if (!ref.mounted) return;

      state = state.copyWith(
        status: CleaningStatus.success,
        services: services,
      );
    } catch (e) {
      if (!ref.mounted) return;

      state = state.copyWith(
        status: CleaningStatus.error,
        message: e.toString(),
      );
    }
  }

  Future<void> increment(Cleaning item) async {
    await _repo.incrementQuantity(item.id, item.quantity);
    await fetchServices();
  }

  Future<void> decrement(Cleaning item) async {
    await _repo.decrementQuantity(item.id, item.quantity);
    await fetchServices();
  }
}

