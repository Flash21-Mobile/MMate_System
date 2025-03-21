import 'package:design_system/image/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final dynamic imageData;

  const ImageDetail(this.imageData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'imageToDetail',
            child: Image.memory(imageData),
          )
        ],
      ),
    );
  }
}
