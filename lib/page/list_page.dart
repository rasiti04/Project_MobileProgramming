import 'package:flutter/material.dart';
import 'package:praktek/main.dart';
import 'package:praktek/page/pertemuan_page.dart';
import 'package:praktek/page/profile_page.dart';

class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}
class _ListPageState extends State<ListPage> {
  List<Widget> page = [ProfilePage(), ListPage() ];
  List<Pertemuan> pertemuan = [
   Pertemuan(title: 'Pertemuan 1', subtitle: 'Pengenalan Android'),
   Pertemuan(title: 'Pertemuan 2', subtitle: 'Widget & Button'),
   Pertemuan(title: 'Pertemuan 3', subtitle: 'Activity & Intent'),
   Pertemuan(title: 'Pertemuan 4', subtitle: 'Toast & AlertDialog'),
   Pertemuan(title: 'Pertemuan 5', subtitle: 'ListView'),
   Pertemuan(title: 'Pertemuan 6', subtitle: 'Checkbox'),
   Pertemuan(title: 'Pertemuan 7', subtitle: 'Radio Button'),
];

int currentPage = 0;

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Pertemuan 5"),
       backgroundColor: Colors.blueAccent,
     ), // AppBar
     body: ListView.builder(
       itemCount: pertemuan.length,
       itemBuilder: (context, index) {
         final Pertemuan = pertemuan[index];

         return Card(
           child: ListTile(
           leading: Icon(Icons.list),
           title: Text(Pertemuan.title),
           subtitle: Text(Pertemuan.subtitle),
           trailing: Icon(Icons.chevron_right),
           onTap: () {
             Navigator.of(context).push(
               MaterialPageRoute(
                 builder: (context) => PertemuanPage(pertemuan: Pertemuan)
               ), // MaterialPageRoute
             );
           },
           ),
         );
       },
     ),
   );
 }
}


class Pertemuan {
   final String title;
   final String subtitle;

   Pertemuan({required this.title, required this.subtitle});

    }