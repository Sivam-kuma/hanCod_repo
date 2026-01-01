import '../../models/cleaning.dart';

abstract class CleaningRepository {
  Future<List<Cleaning>> fetchServices();
  Future<void> incrementQuantity(int id, int currentQty);
  Future<void> decrementQuantity(int id, int currentQty);
}

