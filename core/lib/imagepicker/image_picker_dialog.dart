import 'dart:io';
import 'dart:typed_data';

import 'package:design_system/animate/ink_well.dart';
import 'package:design_system/config.dart';
import 'package:design_system/dialog/bottom_sheet_dialog.dart';
import 'package:design_system/dialog/bottom_sheet_header_delegate.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:design_system/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:function_system/utilities/navigation/navigation.dart';
import 'package:function_system/utilities/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

import 'image_detail.dart';

class ImagePickerDialog {
  final BuildContext context;
  final int initialLength;
  final int maxLength;

  const ImagePickerDialog(
    this.context, {
    this.initialLength = 0,
    this.maxLength = 8,
  });

  Future<List<Uint8List>> show() async {
    final tempImage = (await showModalBottomSheet<List<AssetEntity>>(
            context: context,
            isScrollControlled: true,
            enableDrag: true,
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: AppConfig.borderRadiusTop),
            useSafeArea: true,
            builder: (context) {
              return DraggableScrollableSheet(
                  snap: true,
                  expand: false,
                  maxChildSize: 1.0,
                  initialChildSize: 0.9,
                  minChildSize: 0.89,
                  shouldCloseOnMinExtent: true,
                  builder: (context, scrollController) => ClipRRect(
                      borderRadius: AppConfig.borderRadiusTop,
                      child: _ImagePickerScreen(
                        scrollController,
                        initialLength,
                        maxLength,
                      )));
            })) ??
        [];

    final List<Uint8List> imageList = [];
    for (AssetEntity photo in tempImage) {
      Uint8List? imageData = await photo.thumbnailDataWithSize(
        const ThumbnailSize(720, 720),
        quality: 90, // 품질 설정
      );
      if (imageData != null) {
        imageList.add(imageData);
      }
    }
    return imageList;
  }
}

class _ImagePickerScreen extends StatefulWidget {
  final ScrollController controller;
  final int initialLength;
  final int maxLength;

  @override
  State<StatefulWidget> createState() => _Widget();

  const _ImagePickerScreen(
    this.controller,
    this.initialLength,
    this.maxLength,
  );
}

class _Widget extends State<_ImagePickerScreen> {
  List<AssetEntity> photos = [];
  List<AssetEntity> selectedPhotos = [];

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
    requestPhotos();
  }

  int page = 0;
  final int pageSize = 50;
  bool isLoading = false;
  AssetPathEntity? album;

  Future<void> loadMorePhotos() async {
    if (isLoading || album == null) return;

    setState(() {
      isLoading = true;
    });

    List<AssetEntity> newPhotos =
        await album!.getAssetListPaged(page: page, size: pageSize);

    setState(() {
      photos.addAll(newPhotos);
      page += 1;
      isLoading = false;
    });
  }

  void _onScroll() {
    if (widget.controller.position.pixels >=
        widget.controller.position.maxScrollExtent - 200) {
      loadMorePhotos();
    }
  }

  Future<void> requestPhotos() async {
    // final PermissionState permission =
    // await PhotoManager.requestPermissionExtend();
    // if (permission.isAuth) {
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
    );

    if (albums.isNotEmpty) {
      album = albums.first;
      loadMorePhotos();
    }
    // } else {
    //   PhotoManager.openSetting();
    // }
  }

  void toggleSelection(BuildContext context, AssetEntity asset) {
    if (selectedPhotos.contains(asset)) {
      setState(() {
        selectedPhotos.remove(asset);
      });
      return;
    }
    if ((selectedPhotos.length + widget.initialLength) >= widget.maxLength) {
      context.warningToast('사진은 최대 ${widget.maxLength}개 까지만 선택할 수 있어요');
      return;
    }
    setState(() {
      selectedPhotos.add(asset);
    });
  }

  Future<void> _takePicture() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      // 사진 찍은 후, 사진을 photos 목록에 추가하는 로직
      final newAsset = await PhotoManager.editor.saveImage(File( photo.path).readAsBytesSync(), filename: photo.name);
      setState(() {
        photos.insert(0, newAsset); // 그리드에서 첫 번째 위치에 새 사진 추가
        toggleSelection(context,newAsset);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.controller,
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: BottomSheetHeaderDelegate(
              title: '사진 선택',
              onBack: () => Navigator.pop(context),
              actionButtons: [
                MMateInkWell(
                    enableSplash: false,
                    onTap: selectedPhotos.isEmpty
                        ? null
                        : () {
                            context.pop(selectedPhotos);
                          },
                    borderRadius: AppConfig.borderRadius,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        child: IndexText(
                          '${selectedPhotos.isEmpty ? '' : selectedPhotos.length} 선택',
                          color: selectedPhotos.isEmpty
                              ? Theme.of(context).colorScheme.onTertiary
                              : Theme.of(context).colorScheme.primary,
                        ))) as Widget
              ]),
        ),
        photos.isEmpty
            ? SliverToBoxAdapter(
                child: SizedBox(),
              )
            : SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: photos.length + 1, // +1을 해서 카메라 버튼을 추가
                itemBuilder: (context, index) {
                  // 첫 번째 항목이 카메라 버튼이 되도록
                  if (index == 0) {
                    return MMateInkWell(
                      enableSplash: false,
                      onTap: () {
                        _takePicture();
                        // context.warningToast('카메라를 열어요!');
                      },
                      child: Container(
                          color: Theme.of(context).colorScheme.tertiary,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                          )),
                    );
                  }

                  final asset = photos[index - 1]; // 1을 빼서 실제 이미지 데이터 가져오기
                  return MMateInkWell(
                    enableSplash: false,
                    onTap: () => toggleSelection(context, asset),
                    onLogTap: () async {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ImageDetail(
                            asset,
                            index: index - 1,
                          );
                        }));
                      });
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        AssetEntityImage(
                          asset,
                          isOriginal: false,
                          fit: BoxFit.cover,
                        ),
                        if (selectedPhotos.contains(asset))
                          Container(
                            color: Colors.black54,
                            child:
                                Icon(Icons.check_circle, color: Colors.white),
                          ),
                      ],
                    ),
                  );
                },
              ),
      ],
    );
  }
}
