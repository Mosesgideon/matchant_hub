import 'package:flutter/material.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/constants/package_exports.dart';
import 'package:marchant_hub/core/utils/theme/text_theme.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog(
      {Key? key,
      this.image,
      this.imageWidget,
      this.footer,
      this.tittle,
      this.subtittle})
      : super(key: key);
  final String? image;
  final Widget? imageWidget;
  final Widget? footer;
  final String? tittle;
  final String? subtittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null)
            ImageWidget(
              imageUrl: image!,
              size: 150.h,
            ),
          imageWidget ?? 0.verticalSpace,
          16.verticalSpace,
          TextView(
            text: tittle ?? "Congratulation!",
            style: appTextTheme.headlineLarge,
          ),
          16.verticalSpace,
          if (subtittle != null)
            TextView(
              text: subtittle ?? "Congratulation!",
              style: appTextTheme.titleSmall,
              align: TextAlign.center,
            ),
          footer ?? 0.verticalSpace,
        ],
      ),
    );
  }
}
