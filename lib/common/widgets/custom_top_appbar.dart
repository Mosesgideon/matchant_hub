import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/theme/pallets.dart';

class CustomTopAppBar extends StatefulWidget {
  // final TextEditingController controller;
  final String title;

  const CustomTopAppBar({super.key, required this.title, });

  @override
  State<CustomTopAppBar> createState() => _CustomTopAppBarState();
}

class _CustomTopAppBarState extends State<CustomTopAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          text: widget.title,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Pallets.textcolor,
        ),
        Row(
          children: [
            // InkWell(
            //   onTap:(){
            //     // AnimationSearchBar(
            //     //     backIconColor: Colors.black,
            //     //     centerTitle: 'App Title',
            //     //     onChanged: (text) => debugPrint(text),
            //     //     searchTextEditingController: widget.controller,
            //     //     horizontalPadding: 5);
            //   },
            //     child: const Icon(Iconsax.search_normal_1)),
            20.horizontalSpace,
            // const Icon(Iconsax.sort)
          ],
        )
      ],
    );
  }

  // AnimationSearchBar animateSearch() {
  //   return AnimationSearchBar(
  //       backIconColor: Colors.black,
  //       centerTitle: 'App Title',
  //       onChanged: (text) => debugPrint(text),
  //       searchTextEditingController: controller,
  //       horizontalPadding: 5);
  // }

}
