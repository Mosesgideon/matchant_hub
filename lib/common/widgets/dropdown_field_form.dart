import 'package:flutter/material.dart';
import 'package:marchant_hub/core/constants/package_exports.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/core/utils/theme/text_theme.dart';

class DropdownFieldButton extends StatefulWidget {
  const DropdownFieldButton(
      {Key? key,
      required this.hint,
      required this.onTap,
      this.val,
      required this.preffix,
      this.decoration,
      this.radius})
      : super(key: key);
  final String hint;
  final String? val;
  final VoidCallback onTap;
  final Widget preffix;
  final Decoration? decoration;
  final BorderRadius? radius;

  @override
  State<DropdownFieldButton> createState() => _DropdownFieldButtonState();
}

class _DropdownFieldButtonState extends State<DropdownFieldButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      child: Container(
        decoration: widget.decoration ??
            BoxDecoration(
                // border: Border.all(color: Pallets.grey.withOpacity(0.3)),
                color: Theme.of(context).colorScheme.surface,
                borderRadius: widget.radius),
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            IconTheme(
                data: const IconThemeData(color: Colors.grey),
                child: widget.preffix),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                (widget.val != null && widget.val!.isNotEmpty)
                    ? widget.val!
                    : widget.hint,
                style: appTextTheme.labelSmall
                    ?.copyWith(color: Pallets.lighterGrey, fontSize: 14.sp),
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
