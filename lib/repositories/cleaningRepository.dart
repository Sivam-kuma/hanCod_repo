import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/service.dart';

class CleaningRepository {
  final SupabaseClient client;

  CleaningRepository(this.client);

  Future<List<Cleaning>> fetchServices() async {
    try {
      print(' Fetching Cleaning services from Supabase...');

      final response = await client
          .from('Cleaning')
          .select()
          .order('name');


      print(' Supabase raw response:');
      print(response);

      final services = response
          .map<Cleaning>((json) => Cleaning.fromJson(json))
          .toList();


      print(' Parsed Cleaning services:');
      for (var service in services) {
        print(service);
      }

      return services;
    } catch (e, stackTrace) {
      print(' Error fetching services');
      print(e);
      print(stackTrace);
      return [];
    }
  }


  Future<void> incrementQuantity(int id, int currentQty) async {
    try {
      print('Incrementing quantity for ID: $id');

      final response = await client
          .from('Cleaning')
          .update({'quantity': currentQty + 1})
          .eq('id', id)
          .select();

      print('Increment response:');
      print(response);
    } catch (e) {
      print(' Error incrementing quantity: $e');
    }
  }


  Future<void> decrementQuantity(int id, int currentQty) async {
    try {
      final newQty = currentQty > 0 ? currentQty - 1 : 0;

      print(' Decrementing quantity for ID: $id');

      final response = await client
          .from('Cleaning')
          .update({'quantity': newQty})
          .eq('id', id)
          .select();

      print(' Decrement response:');
      print(response);
    } catch (e) {
      print(' Error decrementing quantity: $e');
    }
  }
}
