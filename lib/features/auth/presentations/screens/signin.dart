import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marchant_hub/common/widgets/custom_button.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/common/widgets/underlined_form_field.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/features/dashboard/presentations/screens/dash_board.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}


class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            60.verticalSpace,
            ImageWidget(imageUrl: "assets/images/logo.png", size: 60),
            TextView(
              text: "Welcome Back",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Pallets.primary,
              ),
            ),

            40.verticalSpace,
            TextView(
              text: "SignIn",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Pallets.primary,
              ),
            ),

            UnderlinedFormField(hint: "email"),
            20.verticalSpace,
            UnderlinedFormField(hint: "Password"),
            15.verticalSpace,
            TextView(
              text: "Forgot Password",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Pallets.primary,
                fontSize: 14,
              ),
            ),

            40.verticalSpace,
            CustomButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoard()),
                );
              },
              bgColor: Pallets.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                    text: "Sign In",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Pallets.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  10.horizontalSpace,
                  Icon(Icons.arrow_forward, color: Pallets.white),
                ],
              ),
            ),

            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextView(
                  text: "Don't have an account? ",
                  // style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  //   color: Pallets.primary,
                  //   fontSize: 14,
                  // ),
                ),
                TextView(
                  text: "Register",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Pallets.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
