import 'package:flutter/material.dart';
import 'package:pks_4/models/album.dart';

class AddAlbumPage extends StatefulWidget {
  const AddAlbumPage({super.key});

  @override
  State<AddAlbumPage> createState() => _AddAlbumPageState();
}

class _AddAlbumPageState extends State<AddAlbumPage> {
  final TextEditingController albumCoverController = TextEditingController();
  final TextEditingController albumImageController = TextEditingController();
  final TextEditingController albumPriceController = TextEditingController();
  final TextEditingController albumInfoController = TextEditingController();

  void createAlbum() {
    String albumCover = albumCoverController.text;
    String albumImage = albumImageController.text;
    int albumPrice = int.tryParse(albumPriceController.text) ?? 0;
    String albumInfo = albumInfoController.text;

    if (albumCover.isNotEmpty && albumImage.isNotEmpty && albumPrice > 0 &&
        albumInfo.isNotEmpty){
      Album album = Album(
        albumCover: albumCover,
        albumImage: albumImage,
        albumInfo: albumInfo,
        albumPrice: albumPrice,
      );
      Navigator.pop(context, album);
    }
  }

  @override
  void dispose() {
    albumCoverController.dispose();
    albumImageController.dispose();
    albumPriceController.dispose();
    albumInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавление альбома", style: TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7), fontSize: 24),),
        backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      ),
      backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: albumCoverController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите название альбома",
                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7)),
                  labelText: "Альбом",
                  labelStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 1)),
                ),
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
              ),
          const SizedBox(height: 16),
              TextField(
                controller: albumImageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите ссылку на обложку альбома",
                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7)),
                  labelText: "Обложка",
                  labelStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 1)),
                ),
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
              ),
          const SizedBox(height: 16),
              TextField(
                controller: albumPriceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите стоимость альбома",
                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7)),
                  labelText: "Стоимость",
                  labelStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 1)),
                ),
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
              ),
          const SizedBox(height: 16),
              TextField(
                controller: albumInfoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите информацию об альбоме",
                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7)),
                  labelText: "Информация",
                  labelStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 1)),
                ),
                maxLines: 7,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: createAlbum,
                child: Text("Добавить альбом",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(233, 79, 55, 1),
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  minimumSize: const Size(300, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}