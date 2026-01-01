

import 'package:hancod/shared/domains/repositories/abstractRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/cleaning.dart';
// import '../repositories/cleaning_repository.dart';

class CleaningRepositoryImpl implements CleaningRepository {
  final SupabaseClient client;

  CleaningRepositoryImpl(this.client);

  @override
  Future<List<Cleaning>> fetchServices() async {
    final response = await client
        .from('Cleaning')
        .select()
        .order('name');

    return (response as List)
        .map((json) => Cleaning.fromJson(json))
        .toList();
  }

  @override
  Future<void> incrementQuantity(int id, int currentQty) async {
    await client.from('Cleaning').update({'quantity': currentQty + 1}).eq('id', id);
  }

  @override
  Future<void> decrementQuantity(int id, int currentQty) async {
    final newQty = currentQty > 0 ? currentQty - 1 : 0;
    await client.from('Cleaning').update({'quantity': newQty}).eq('id', id);
  }
}

