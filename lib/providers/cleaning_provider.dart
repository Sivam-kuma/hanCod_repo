import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/service.dart';
import '../repositories/cleaningRepository.dart';


final supabaseProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final cleaningRepositoryProvider = Provider<CleaningRepository>((ref) {
  return CleaningRepository(ref.watch(supabaseProvider));
});

final servicesProvider = FutureProvider<List<Cleaning>>((ref) async {
  return ref.watch(cleaningRepositoryProvider).fetchServices();
});

final cartProvider = FutureProvider<List<Cleaning>>((ref) async {
  final repo = ref.watch(cleaningRepositoryProvider);
  final allServices = await repo.fetchServices();
  
  return allServices.where((item) => item.quantity > 0).toList();
});
