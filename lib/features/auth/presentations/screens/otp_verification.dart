import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:marchant_hub/common/widgets/custom_button.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/features/dashboard/presentations/screens/dash_board.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  final otpConteroller = TextEditingController();
  final _key = GlobalKey<FormState>();

  bool isTermsAccepted = false;
  bool termsHasError = false;
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.verticalSpace,
              ImageWidget(imageUrl: "assets/images/logo.png", size: 70),
              10.verticalSpace,
              TextView(
                text:
                    "A 4 digit verification Code was sent to moses******@gmail.com",
              ),
              20.verticalSpace,
              Center(
                child: Pinput(
                  controller: otpConteroller,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "otp is required",),
                  ]),
                  errorText: 'This field is  required',
                  errorTextStyle: TextStyle(fontSize: 12,color: Pallets.red),
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: 45,
                    height: 50,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(text: "Didn't recieve OTP ?, "),
                  TextView(
                    text: "Resend OTP",
                    color: Pallets.primary,
                    fontSize: 15,
                  ),
                ],
              ),
              40.verticalSpace,
              CustomButton(
                bgColor: Pallets.primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(
                      text: "Verify OTP",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Pallets.white,
                    ),
                    8.horizontalSpace,
                    Icon(Icons.arrow_forward, color: Pallets.white),
                  ],
                ),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
