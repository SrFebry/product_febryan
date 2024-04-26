import 'package:flutter/material.dart';
import 'package:product_febryan/services/product_service.dart';
import 'package:product_febryan/screens/product_list.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Product"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined)),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller1,
                    decoration: InputDecoration(
                        hintText: 'Kode Produk', border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller2,
                    decoration: InputDecoration(
                        hintText: 'Nama Produk', border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 200,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                onPressed: () {
                  _productService.addProductItem(
                      _controller1.text, _controller2.text, context);
                  _controller1.clear();
                  _controller2.clear();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
                child: const Text("Tambah Data Baru"),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
