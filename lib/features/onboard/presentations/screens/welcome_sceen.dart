import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marchant_hub/common/widgets/custom_button.dart';
import 'package:marchant_hub/common/widgets/custom_outlined_button.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/features/auth/presentations/screens/signin.dart';
import 'package:marchant_hub/features/dashboard/presentations/screens/dash_board.dart';

class WelcomeSceen extends StatefulWidget {
  const WelcomeSceen({super.key});

  @override
  State<WelcomeSceen> createState() => _WelcomeSceenState();
}

class _WelcomeSceenState extends State<WelcomeSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          30.verticalSpace,
          Container(
            width: 1.sw,
            decoration: BoxDecoration(
              // gradient:  LinearGradient(
              //   colors: [
              //     Pallets.primary,
              //     Pallets.wlight,
              //     Pallets.wlight
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
              image: DecorationImage(
                image: AssetImage("assets/images/blur.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ImageWidget(
                imageUrl: 'assets/images/welcome.png',
                size: 300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: "Scale Your\nBusiness with",
                  fontSize: 25,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 25),
                ),
                TextView(
                  text: "MerchantHub",
                  fontSize: 25,
                  color: Pallets.primary,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 25,color: Pallets.primary),
                ),

                15.verticalSpace,
                TextView(
                  text:
                      "Accept payments, manage invoices, and track settlements all in one place. The ultimate platform for the modern entrepreneur.",
                ),
                15.verticalSpace,
                CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard()));
                  },
                  bgColor: Pallets.primary,
                  child: TextView(
                    text: "Get Started",
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: Pallets.white),
                  ),
                ),
                15.verticalSpace,

                CustomOutlinedButton(
                  child: TextView(
                    text: "Login",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SigninScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
