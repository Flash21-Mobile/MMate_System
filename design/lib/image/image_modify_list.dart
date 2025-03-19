import 'dart:typed_data';

import 'package:design_system/image/image_memory.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../loading/loading_widget.dart';
import '../text/text_interface.dart';

class ImagePostList extends StatelessWidget {
  final double itemWidth;
  final bool isLoading;

  final List<Uint8List> imageData;
  final Function(int)? onTapDelete;
  final VoidCallback? onTapAdd;

  const ImagePostList(
      {required this.itemWidth,
      required this.isLoading,
      required this.imageData,
      required this.onTapDelete,
      this.onTapAdd});

  @override
  Widget build(BuildContext context) {
    final imageWidth =
        (MediaQuery.of(context).size.width - (AppConfig.paddingIndex * 4)) / 3;

    return SizedBox(
        height: imageWidth,
        child: ListView.separated(
            padding: EdgeInsets.only(
                left: AppConfig.paddingIndex,
                right: MediaQuery.of(context).size.width -
                    AppConfig.paddingIndex -
                    imageWidth),
            scrollDirection: Axis.horizontal,
            itemCount: imageData.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: onTapAdd,
                    child: Container(
                        padding: EdgeInsets.all(AppConfig.paddingIndex / 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: AppConfig.borderRadius,
                          border: Border.all(
                              width: 0.3,
                              color: Theme.of(context).unselectedWidgetColor),
                        ),
                        width: imageWidth,
                        height: imageWidth,
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                          Center(
                              child: Icon(Icons.camera_alt_rounded,
                                  color:
                                      Theme.of(context).unselectedWidgetColor)),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: AppConfig.borderRadius,
                                  border: Border.all(
                                      width: 0.3,
                                      color: Theme.of(context)
                                          .unselectedWidgetColor)),
                              child: IndexTextMicro(
                                '${imageData.length}/3',
                                height: 1.33,
                              ))
                        ])));
              }
              return Stack(alignment: Alignment.topRight, children: [
                ClipRRect(
                    borderRadius: AppConfig.borderRadius,
                    child: isLoading
                        ? LoadingWidget.sizedBox(
                            width: imageWidth,
                            height: imageWidth,
                            borderRadius: AppConfig.borderRadius,
                          )
                        : IndexImage.memory(
                            width: imageWidth,
                            height: imageWidth,
                            imageData[index - 1],
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          )),
                InkWell(
                    onTap: isLoading
                        ? null
                        : () {
                            if (onTapDelete != null) onTapDelete!(index-1);
                          },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: AppConfig.borderRadius,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ))
              ]);
            },
            separatorBuilder: (context, index) =>
                SizedBox(width: AppConfig.paddingIndex / 2)));
  }
}
