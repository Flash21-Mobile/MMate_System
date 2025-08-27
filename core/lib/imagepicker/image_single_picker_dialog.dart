import 'dart:io';

import 'package:design_system/animate/ink_well.dart';
import 'package:design_system/config.dart';
import 'package:design_system/image/image.dart';
import 'package:design_system/loading/loading_widget.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/domain/uint_file/entity/uint_file.dart';
import 'package:function_system/utilities/navigation/navigation.dart';
import 'package:function_system/utilities/permission/permission.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class ImageSinglePickerDialog {
  final BuildContext context;

  const ImageSinglePickerDialog(this.context);

  Future<UintFile?> show({UintFile? initialImage}) async {
    final isGranted = await MMatePermission.photos();
    if (isGranted == false) {
      return null;
    }

    final result = await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '닫기',
      pageBuilder: (_, __, ___) {
        return Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
            left: AppConfig.paddingIndex,
            right: AppConfig.paddingIndex,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Material(
              child: _ImageSinglePickerScreen(
                initialImage,
              ),
            ),
          ),
        );
      },
    );

    if (result == null) return initialImage;
    if (result is int) return null;

    if (result is UintFile) {
      return result;
    }
    throw '에러';
  }
}

class _ImageSinglePickerScreen extends ConsumerStatefulWidget {
  final UintFile? initialImage;

  const _ImageSinglePickerScreen(this.initialImage);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Widget();
}

class _Widget extends ConsumerState<_ImageSinglePickerScreen> {
  UintFile? imageData;

  @override
  void initState() {
    super.initState();
    imageData = widget.initialImage;
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile =
        await picker.pickImage(source: source, maxWidth: 1080);
    if (pickedFile != null) {
      imageData = UintFile(
          data: File(pickedFile.path).readAsBytesSync(),
          extension: p.extension(pickedFile.path ?? '').replaceFirst('.', ''));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth - (AppConfig.paddingIndex * 4);

    return Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        padding: AppConfig.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IndexTextMax(
              '프로필 사진을 선택해주세요',
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: AppConfig.paddingIndex),
            ClipRRect(
              borderRadius: AppConfig.borderRadius,
              child: Container(
                width: imageWidth,
                height: imageWidth / 16 * 9,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: imageData == null
                    ? Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.onTertiary,
                        size: 42,
                      )
                    : Stack(children: [
                        LoadingWidget.sizedBox(
                          width: imageWidth,
                          height: imageWidth / 16 * 9,
                        ),
                        MMateImage(
                          imageData!.data,
                          fit: BoxFit.cover,
                          width: imageWidth,
                          height: imageWidth / 16 * 9,
                        )
                      ]),
              ),
            ),
            SizedBox(height: AppConfig.paddingIndex / 2),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                  child: MMateInkWell(
                      onTap: () {
                        _pickImage(ImageSource.gallery);
                      },
                      child: Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).scaffoldBackgroundColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: Theme.of(context).colorScheme.onTertiary,
                            ),
                            SizedBox(width: 5),
                            IndexText(
                              '갤러리',
                              height: 0.9,
                              color: Theme.of(context).colorScheme.onTertiary,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ))),
              SizedBox(width: AppConfig.paddingIndex / 2),
              Expanded(
                  child: MMateInkWell(
                onTap: () {
                  _pickImage(ImageSource.camera);
                },
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).scaffoldBackgroundColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_rounded,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                      SizedBox(width: 5),
                      IndexText(
                        '카메라',
                        height: 0.9,
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              ))
            ]),
            SizedBox(height: AppConfig.paddingIndex / 2),
            Row(
              children: [
                Expanded(
                    child: MMateInkWell(
                        onTap: () {
                          setState(() {
                            imageData = null;
                          });
                        },
                        child: Container(
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: AppConfig.borderRadius,
                              color: Theme.of(context).colorScheme.secondary),
                          child: IndexText('지우기',
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ))),
                SizedBox(width: AppConfig.paddingIndex / 2),
                Expanded(
                    child: MMateInkWell(
                        onTap: () => context.pop(imageData ?? 0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: AppConfig.borderRadius,
                              color: Theme.of(context).colorScheme.primary),
                          child: IndexText('완료',
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ))),
              ],
            )
          ],
        ));
  }
}
