import 'dart:typed_data';

import 'package:design_system/animate/ink_well.dart';
import 'package:design_system/config.dart';
import 'package:design_system/image/image_memory.dart';
import 'package:design_system/loading/loading_widget.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:function_system/domain/uri/uri_entity.dart';

class ImagePostList extends StatelessWidget {
  final double itemWidth;
  final bool isLoading;

  final List<UriEntity> imageData;
  final Function(int)? onTapDelete;
  final VoidCallback? onTapAdd;

  const ImagePostList(
      {super.key,
        required this.itemWidth,
        required this.isLoading,
        required this.imageData,
        required this.onTapDelete,
        this.onTapAdd});

  @override
  Widget build(BuildContext context) {
    final imageWidth =
        (MediaQuery.of(context).size.width - (AppConfig.paddingIndex * 4)) / 3;

    return SizedBox(
        height: imageWidth + (AppConfig.paddingIndex * 2),
        child: ListView.builder(
            padding: EdgeInsets.only(
                left: AppConfig.paddingIndex / 2,
                right: MediaQuery.of(context).size.width -
                    (AppConfig.paddingIndex * 2.5) -
                    (imageWidth * 2),
                bottom: AppConfig.paddingIndex / 2,
                top: AppConfig.paddingIndex / 2),
            scrollDirection: Axis.horizontal,
            itemCount: imageData.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(padding: AppConfig.padding/2,child:  MMateInkWell(
                    onTap: onTapAdd,
                    child: Container(
                        padding: EdgeInsets.all(AppConfig.paddingIndex / 2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: AppConfig.borderRadius,
                        ),
                        width: imageWidth,
                        height: imageWidth,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Icon(Icons.camera_alt_rounded,
                                    size: AppConfig.paddingIndex * 2,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary),
                              ),
                              IndexTextMax(
                                '${imageData.length}/3',
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.onTertiary,
                                height: 1.33,
                              )
                            ]))));
              }
              return Stack(alignment: Alignment.topRight, children: [
                Padding(
                    padding: EdgeInsets.all(AppConfig.paddingIndex / 2),
                    child: ClipRRect(
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
                          imageData[index - 1].data,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ))),
                InkWell(
                    onTap: isLoading
                        ? null
                        : () {
                      if (onTapDelete != null) onTapDelete!(index - 1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: AppConfig.borderRadius,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ))
              ]);
            }));
  }
}
