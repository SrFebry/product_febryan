import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProductService {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('product_list');

  Stream<Map<String, String>> getProductList() {
    return _database.onValue.map((event) {
      final Map<String, String> items = {};
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          items[key] =
              '\nKode Produk: ${value['kode produk']} \nNama Produk: ${value['nama produk']}';
        });
      }
      return items;
    });
  }

  void addProductItem(String itemName1, String itemName2, context) {
    if (itemName1.isEmpty || itemName2.isEmpty) {
      const warning = SnackBar(content: Text('Mohon Masukkan Data'));
      ScaffoldMessenger.of(context).showSnackBar(warning);
    } else {
      _database.push().set({
        'kode produk': itemName2,
        'nama produk': itemName1,
      });
    }
  }

  Future<void> removeProductItem(String key) async {
    await _database.child(key).remove();
  }
}
