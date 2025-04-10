import 'package:design_system/image/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final dynamic imageData;
  final String heroTag;
  final Widget? imageWidget;

  const ImageDetail(this.imageData, this.heroTag,
      {super.key, this.imageWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.bottom -
                MediaQuery.of(context).padding.top -
                56,
            color: Colors.transparent,
            child: Hero(
                tag: heroTag,
                child: Material(
                    color: Colors.transparent,
                    child: InteractiveViewer(
                      child: imageData != null
                          ? MMateImage(
                              imageData,
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width,
                            )
                          : imageWidget ?? SizedBox(),
                    ))),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).padding.bottom,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
