// home_page.dart
import 'package:flutter/material.dart';
import 'package:pks_4/components/album_page.dart';
import 'package:pks_4/models/album.dart';
import 'package:pks_4/pages/add_album_page.dart';

final List<Album> albums = <Album>[];

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({super.key});

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  void navigateToAddAlbumPage(BuildContext context) async{
    final Album result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => const AddAlbumPage()),
    );

    if (result != null){
      setState(() {
        albums.add(result);
      });
    }
  }

  void removeAlbum(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(102, 155, 188, 1),
          title: const Text('Подтверждение удаления'),
          content: const Text('Вы уверены, что хотите удалить этот альбом?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Удалить',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  albums.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Vinyl Store', style: TextStyle(color: Color.fromRGBO(102, 155, 188, 1), fontSize: 40),
        ),
        ),
        backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      ),
      backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      body: albums.isEmpty
          ? const Center(child: Text("Нет добавленных альбомов", style: TextStyle(color: Color.fromRGBO(102, 155, 188, 1), fontSize: 18),),)
          : ListView.builder(
          itemCount: albums.length,
          itemBuilder: (context, index){
            return ItemAlbum(album: albums[index], index: index, removeAlbum: removeAlbum,);
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(233, 79, 55, 1),
        onPressed: () => navigateToAddAlbumPage(context),
        child: Icon(Icons.add_box_sharp),
        tooltip: "Добавить альбом",
      ),
    );
  }
}