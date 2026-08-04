import 'package:flutter/material.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/constants/package_exports.dart';


class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.grey, width: 0.5)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ImageWidget(
              imageUrl: '',

            ),
            10.horizontalSpace,
            const TextView(text: 'Search')
          ],
        ),
      ),
    );
  }
}
