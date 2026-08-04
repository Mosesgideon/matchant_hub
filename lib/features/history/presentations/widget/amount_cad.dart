import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
class AmountCad extends StatefulWidget {
  const AmountCad({super.key});

  @override
  State<AmountCad> createState() => _AmountCadState();
}

class _AmountCadState extends State<AmountCad> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Pallets.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextView(text: "AVAILABLE BALANCE",fontSize: 12,color: Colors.white,),
              5.horizontalSpace,
              Icon(Iconsax.eye,size: 14,color: Colors.white,),
            ],
          ),4.verticalSpace,

          TextView(text: "\$24,850.42",style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white,fontSize: 30),),
40.verticalSpace,
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(text: "Active Payouts",fontSize: 12,color: Colors.white,),
                  TextView(text: "\$1,200.00",fontSize: 14,color: Colors.white
                    ,),
                ],
              ),
              30.horizontalSpace,
              SizedBox(
                height: 20,
                  child: VerticalDivider()),
              30.horizontalSpace,
              

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(text: "In Review",fontSize: 12,color: Colors.white,),
                  TextView(text: "\$420.15",fontSize: 14,color: Colors.white
                    ,),
                ],
              ),
            ],
          )



        ],
      ),

    );
  }
}
