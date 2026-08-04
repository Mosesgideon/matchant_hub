import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/constants/package_exports.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/core/utils/extensions/context_extension.dart';
import 'package:marchant_hub/core/utils/theme/text_theme.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.actions,
      this.leading,
      this.tittle,
      this.tittleText,
      this.onBackPressed,
      this.elevation,
      this.bgColor,
      this.fgColor,
      this.height,
      this.centerTitle = false,
      this.automaticallyApplyLeading = false,
      this.leadingWidth});

  final List<Widget>? actions;
  final Widget? leading;
  final Widget? tittle;
  final String? tittleText;
  final double? elevation;
  final VoidCallback? onBackPressed;
  final Color? bgColor;
  final Color? fgColor;
  final double? height;
  final double? leadingWidth;
  final bool? centerTitle;
  final bool? automaticallyApplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xfffdfcf),
      foregroundColor: fgColor,
      elevation: elevation ?? 0,
      centerTitle: centerTitle,
      leadingWidth:
          (leading == null && onBackPressed == null) ? 0 : leadingWidth ?? 0,
      automaticallyImplyLeading: automaticallyApplyLeading!,
      titleTextStyle: GoogleFonts.jost(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color:Colors.black),
      leading: leading ??
          IconButton(
            onPressed: () {
              onBackPressed != null ? onBackPressed!() : context.pop(context);
            },
            icon: ImageWidget(
              color: fgColor ?? Theme.of(context).colorScheme.onBackground,
              imageUrl: "",
              size: 35,
              fit: BoxFit.cover,
            ),
          ),
      title: tittle ??
          TextView(
            text: tittleText ?? 'My Appbar',
            fontWeight: FontWeight.w700,
            style: appTextTheme.titleLarge?.copyWith(fontSize: 22),
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
