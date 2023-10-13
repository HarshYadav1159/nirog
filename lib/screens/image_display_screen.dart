import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  final String? imageUrl;
  final String? name;

  const ImageScreen({super.key, this.imageUrl, this.name});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${widget.name}',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            child: widget.imageUrl == null
                ? Text("No Image of this Diagnosis")
                : Image.network(widget.imageUrl!),
          ),
        ));
  }
}
