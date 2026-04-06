import 'package:flutter/material.dart';
import 'package:praktek/ui/produk_detail.dart';

class Produkform extends StatefulWidget {
  const Produkform({super.key});
  @override
  _Produkformstate createState() => _Produkformstate();
}

class _Produkformstate extends State<Produkform> {
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Produk')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textboxkodeProduk(),
            _textboxnamaProduk(),
            _textboxHargaProduk(),
            _tombolSimpan(),
            
          ],
          ),
      ),
      );
  }
  TextField _textboxkodeProduk() {
  return TextField(
    decoration: InputDecoration(labelText: "Kode Produk"),
    controller: _kodeProdukTextboxController,);
}
 TextField _textboxnamaProduk() {
  return TextField(
    decoration: InputDecoration(labelText: "Nama Produk"),
    controller: _namaProdukTextboxController, 
    );
 }
 TextField _textboxHargaProduk() {
  return  TextField(
    decoration: InputDecoration(labelText: "Harga Produk"),
    controller: _hargaProdukTextboxController,
    );
 }
  ElevatedButton _tombolSimpan() {
  return  ElevatedButton(
    child: Text('Simpan'), 
    onPressed: () {
      String kodeProduk = _kodeProdukTextboxController.text;
      String namaProduk = _namaProdukTextboxController.text;
      int harga = int.parse(_hargaProdukTextboxController.text);

      Navigator.of(context).push(
        MaterialPageRoute(
         builder: (context) => ProdukDetail(
           kodeProduk: kodeProduk,
           namaProduk: namaProduk,
           harga: harga,
          ), // ProdukDetail
        ), // MaterialPageRoute
      );
    },
   ); // ElevatedButton
  }
}

