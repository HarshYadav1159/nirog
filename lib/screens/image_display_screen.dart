import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  final String? imageUrl;

  const ImageScreen({super.key, this.imageUrl});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nirog',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightBlue,
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
