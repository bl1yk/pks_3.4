// album_page.dart
import 'package:flutter/material.dart';
import 'package:pks_4/models/album.dart';

class ItemAlbum extends StatefulWidget {
  final Album album;
  final int index;
  final Function(int) removeAlbum;

  const ItemAlbum({super.key, required this.album, required this.index, required this.removeAlbum});

  @override
  State<ItemAlbum> createState() => _ItemAlbumState();
}

class _ItemAlbumState extends State<ItemAlbum> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(233, 79, 55, 1),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        widget.album.albumCover,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.network(
                        widget.album.albumImage,
                        height: 265,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${widget.album.albumPrice}₽',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          'Описание',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.album.albumInfo),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: (){
                widget.removeAlbum(widget.index);
              },
            ),
          ],
        ),
      ),
    );
  }
}