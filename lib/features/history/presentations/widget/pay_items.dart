import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
class PayItems extends StatefulWidget {
  const PayItems({super.key});

  @override
  State<PayItems> createState() => _PayItemsState();
}

class _PayItemsState extends State<PayItems> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 160,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Pallets.bordercolor)
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Pallets.primary.withOpacity(.4)
                    ),
                      child: Icon(Icons.qr_code_2,color:Pallets.primary,)),
                  5.verticalSpace,


                  TextView(text: "Receive Payment")
                ],
              ),
            ),
            Container(
              width: 160,

              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Pallets.bordercolor)
              ),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Pallets.successGreen.withOpacity(.4)
                      ),
                      child: Icon(Icons.send,color: Pallets.successGreen,)),
                  5.verticalSpace,


                  TextView(text: "Send Money")
                ],
              ),
            ),
          ],
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 160,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Pallets.bordercolor)
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Pallets.grey60.withOpacity(.4)
                    ),
                      child: Icon(Icons.sticky_note_2_outlined,)),
                  5.verticalSpace,


                  TextView(text: "Create Invoice")
                ],
              ),
            ),
            Container(
              width: 160,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Pallets.bordercolor)
              ),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Pallets.grey60.withOpacity(.4)
                      ),
                      child: Icon(Icons.wallet_rounded,)),
                  5.verticalSpace,
                  TextView(text: "Withdraw")
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }
}
