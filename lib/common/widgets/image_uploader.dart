import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/di/injector.dart';

import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/core/utils/theme/text_theme.dart';


class ImageUploaderWidget extends StatefulWidget {
  const ImageUploaderWidget(
      {super.key,
      this.logo,
      this.banner,
      required this.onLogoSelected,
      required this.onBannerSelected});

  final String? logo;
  final String? banner;
  final Function(String logo) onLogoSelected;
  final Function(String banner) onBannerSelected;

  @override
  State<ImageUploaderWidget> createState() => _ImageUploaderWidgetState();
}

class _ImageUploaderWidgetState extends State<ImageUploaderWidget> {
  String? logo;
  String? banner;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        banner != null
            ? ImageWidget(
                imageType: ImageWidgetType.file,
                onTap: () {
                  // _selectBanner();
                },
                borderRadius: BorderRadius.circular(10),
                width: 1.sw,
                imageUrl: banner!,
                fit: BoxFit.cover,
                height: 150.h,
              )
            : InkWell(
                onTap: () {
                  // _selectBanner();
                },
                child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Pallets.lighterGrey.withOpacity(0.13),
                      borderRadius: BorderRadius.circular(10)),
                  height: 150.h,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Expanded(child: 0.verticalSpace),
                        ImageWidget(imageUrl: ''),
                        TextView(
                          text: 'Upload Banner',
                          style: appTextTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ),
              ),
        Positioned(
          left: 22,
          bottom: -32,
          child: logo != null
              ? InkWell(
                  onTap: () {
                    // _selectLogo();
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: FileImage(File(logo!)),
                  ),
                )
              : InkWell(
                  onTap: () {
                    // _selectLogo();
                  },
                  child: CircleAvatar(
                    radius: 35,
                    foregroundColor: Pallets.white,
                    backgroundColor: Colors.grey.shade600,
                    child: const Center(
                        child: TextView(
                      text: 'Upload Logo',
                      align: TextAlign.center,
                      color: Pallets.white,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                ),
        )
      ],
    );
  }

  // void _selectBanner() async {
  //   var file = await ImageManager().showPhotoSourceDialog(context);
  //
  //   if (file != null) {
  //     logger.i(file.path);
  //     banner = file.path;
  //     widget.onBannerSelected(banner!);
  //   }
  //   setState(() {});
  // }

  // void _selectLogo() async {
  //   var file = await ImageManager().showPhotoSourceDialog(context);
  //   if (file != null) {
  //     logo = file.path;
  //     widget.onLogoSelected(logo!);
  //   }
  //   setState(() {});
  // }
}
