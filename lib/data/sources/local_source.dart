import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../models/customer.dart';

final localSourceProvider =
    Provider<LocalDataSource>((ref) => LocalDataSourceImpl());

abstract class LocalDataSource {
  Future<Customer?> getCustomer();

  Future<Customer> saveCustomer(Customer customer);

  Future<bool> clearCustomer();
}

class LocalDataSourceImpl implements LocalDataSource {
  static const String _customerHiveSaveKey = 'customer_key';

  @override
  Future<Customer?> getCustomer() async {
    final box = await Hive.openBox<Customer>(_customerHiveSaveKey);

    try {
      final customer = box.get(_customerHiveSaveKey);

      return customer;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      // box.close();
    }
  }

  @override
  Future<Customer> saveCustomer(Customer customer) async {
    final box = await Hive.openBox<Customer>(_customerHiveSaveKey);

    try {
      await box.put(_customerHiveSaveKey, customer);
      return customer;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      // box.close();
    }
  }

  @override
  Future<bool> clearCustomer() async {
    final box = await Hive.openBox<Customer>(_customerHiveSaveKey);

    try {
      box.clear();
      return true;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {}
  }
}
