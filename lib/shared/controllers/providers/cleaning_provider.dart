import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domains/repositories/abstractRepository.dart';
import '../../domains/repositories/cleaningRepository.dart';
// import '../data/cleaning_repository_impl.dart';
// import '../repositories/cleaning_repository.dart';

final supabaseProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final cleaningRepositoryProvider = Provider<CleaningRepository>((ref) {
  final client = ref.watch(supabaseProvider);
  return CleaningRepositoryImpl(client);
});
