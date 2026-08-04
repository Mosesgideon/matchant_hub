import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/features/onboard/presentations/screens/welcome_sceen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 20),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeSceen()));

    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageWidget(imageUrl: 'assets/images/logo.png',size: 200,),

              20.verticalSpace,
              CircularProgressIndicator(strokeWidth: 1,),
              30.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Pallets.bordercolor)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified_user,color: Pallets.primary,),
                    5.horizontalSpace,
                    TextView(text: "Securing your business...")
                  ],
                ),
              ),
              40.verticalSpace,
              TextView(text: "© 2024 MerchantHub Enterprise. v4.2.0",fontSize: 12,)
            ],
          ),
        ),
      ),
    );
  }
}
