import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
class TodaySales extends StatefulWidget {
  const TodaySales({super.key});

  @override
  State<TodaySales> createState() => _TodaySalesState();
}

class _TodaySalesState extends State<TodaySales> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Pallets.bordercolor),
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(text: "Today's Sales",fontSize: 12,),
                  TextView(text: "\$4,250.00",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600,fontSize: 20),)
                ,10.verticalSpace,
                  TextView(text: "+12.4% vs yesterday",color: Pallets.successGreen,fontSize: 12,)
              
                ],
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Pallets.primary.withOpacity(0.2)
                ),
                  child: Icon(Icons.payments_outlined,))
            ],
          ),
          24.verticalSpace,
          Divider(),
          24.verticalSpace,
          TextView(text: "Monthly Revenue",fontSize: 12,),
          TextView(text: "\$124,500.00",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 18),)
,
          10.verticalSpace,
          Row(

            children: [
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  value: .8,
                  valueColor: AlwaysStoppedAnimation<Color>(Pallets.primary),
                  stopIndicatorRadius: 5,
                  stopIndicatorColor: Pallets.grey60,
                ),
              ),
              10.horizontalSpace,
              TextView(text: "82% of Goal",fontSize: 12,),

            ],
          ),
        ],
      ),
    );
  }
}
