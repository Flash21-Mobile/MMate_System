import 'package:design_system/image/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class ImageDetail extends StatelessWidget {
  final AssetEntity imageData;
  final int index;

  const ImageDetail(this.imageData, {super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'item_$index',
            child: AssetEntityImage(
              imageData,
              width: double.infinity,
              isOriginal: false,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: bottomPadding,
      ),
    );
  }
}
