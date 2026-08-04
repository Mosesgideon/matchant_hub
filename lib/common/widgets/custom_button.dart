import 'package:flutter/material.dart';
import 'package:marchant_hub/core/utils/extensions/context_extension.dart';

import '../../core/theme/pallets.dart';

class CustomButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? bgColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final bool? isExpanded;
  final BorderRadius? borderRadius;
  final double? elevation;
  final BorderSide? side;

  const CustomButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.bgColor,
      this.padding,
      this.isExpanded = true,
      this.foregroundColor,
      this.borderRadius,
      this.elevation,
      this.side = BorderSide.none})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            flex: widget.isExpanded! ? 1 : 0,
            child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                elevation: widget.elevation,
                padding: widget.padding ?? const EdgeInsets.all(16),
                foregroundColor: widget.foregroundColor ?? Colors.transparent,
                shape: RoundedRectangleBorder(
                    side: widget.side!,
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(10)),
                disabledBackgroundColor: widget.bgColor == null
                    ? Colors.transparent
                    : widget.bgColor!.withAlpha(-200),
                backgroundColor: widget.bgColor ?? Colors.transparent,
              ),
              child: widget.child,
            )),
      ],
    );
  }
}
