import 'package:flutter/material.dart';
import 'package:marchant_hub/core/theme/pallets.dart';

class StackedImagesWidget extends StatefulWidget {
  const StackedImagesWidget({Key? key}) : super(key: key);

  @override
  State<StackedImagesWidget> createState() => _StackedImagesWidgetState();
}

class _StackedImagesWidgetState extends State<StackedImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallets.errorRed,
      height: 50,

      // width: 40,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.topLeft,
        clipBehavior: Clip.none,
        children: List.generate(
            4,
            (index) => Positioned(
                  left: 1,
                  right: (20 * index).toDouble(),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.withOpacity(0.3 * index),
                  ),
                )),
      ),
    );
  }
}
