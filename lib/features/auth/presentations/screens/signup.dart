import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:marchant_hub/common/widgets/custom_button.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/common/widgets/underlined_form_field.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/features/auth/presentations/screens/otp_verification.dart';
import 'package:marchant_hub/features/auth/presentations/screens/signin.dart';
import 'package:marchant_hub/features/dashboard/presentations/screens/dash_board.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailConteroller = TextEditingController();
  final usernameConteroller = TextEditingController();
  final paswordConteroller = TextEditingController();
  final numberConteroller = TextEditingController();
  final _key = GlobalKey<FormState>();

  bool isTermsAccepted = false;
  bool termsHasError = false;
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
              ImageWidget(imageUrl: "assets/images/logo.png", size: 60),
              TextView(
                text: "Welcome To \nMarchant Hub",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Pallets.primary,
                ),
              ),

              10.verticalSpace,
              // TextView(
              //   text: "SignUp",
              //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w600,
              //     color: Pallets.primary,
              //   ),
              // ),

              UnderlinedFormField(hint: "email", controller: emailConteroller,
                validator: MultiValidator([
                RequiredValidator(errorText: "email is required")
              ]),),
              20.verticalSpace,
              UnderlinedFormField(
                hint: "username",
                controller: usernameConteroller,
                validator: MultiValidator([
                  RequiredValidator(errorText: "username is required")
                ]),
              ), 20.verticalSpace,
              UnderlinedFormField(
                hint: "Phone number",
                controller: numberConteroller,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Phone number is required")
                ]),
              ),
              20.verticalSpace,
              UnderlinedFormField(
                hint: "Password",
                controller: paswordConteroller,
                validator: MultiValidator([
                  RequiredValidator(errorText: "password is required")
                ]),
              ),
              15.verticalSpace,

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isTermsAccepted,
                    isError: termsHasError,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    checkColor: Pallets.primary,
                    fillColor: WidgetStatePropertyAll(
                      Pallets.primary.withOpacity(0.3),
                    ),
                    onChanged: (value) {
                      setState(() {
                        isTermsAccepted = value ?? false;

                        if (isTermsAccepted) {
                          termsHasError = false;
                        }
                      });
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: TextView(
                        text: "I agree with terms and conditions",
                        color: isTermsAccepted ? null : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
              CustomButton(
                onPressed: () {

                  if(_key.currentState!.validate()){
                    if (!isTermsAccepted) {
                      setState(() {
                        termsHasError = true;
                      });

                      return;
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>OtpVerification()));

                  }
                },
                bgColor: Pallets.primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(
                      text: "Register",
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
                    text: "Already have an account? ",
                    // style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    //   color: Pallets.primary,
                    //   fontSize: 14,
                    // ),
                  ),
                  TextView(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ct)=>SigninScreen()));
                    },
                    text: "SignIn",
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
      ),
    );
  }
}
