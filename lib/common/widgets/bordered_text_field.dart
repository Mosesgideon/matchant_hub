import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:marchant_hub/core/constants/package_exports.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/core/utils/extensions/context_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderedTextField extends StatelessWidget {
  const BorderedTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.validator,
      required this.height,
      required this.width,
      this.tittle,
      this.inputType});

  final TextEditingController controller;
  final String labelText;
  final String? tittle;
  final String? Function(String?)? validator;
  final double height;
  final double width;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tittle != null)
          Text(
            tittle!,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        if (tittle != null)
          8.verticalSpace,
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(
              validator: validator,
              controller: controller,
              keyboardType: inputType ?? TextInputType.number,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(color: context.colorScheme.onBackground),

                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Pallets.lightGrey),
                  borderRadius: BorderRadius.circular(4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Pallets.lightGrey),
                  borderRadius: BorderRadius.circular(4),
                ),
                // border: OutlineInputBorder()
              )),
        ),
      ],
    );
  }
}
