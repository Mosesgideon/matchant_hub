import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marchant_hub/features/history/presentations/widget/amount_cad.dart';
import 'package:marchant_hub/features/history/presentations/widget/pay_items.dart';
import 'package:marchant_hub/features/history/presentations/widget/today_sale.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AmountCad(),
              24.verticalSpace,

              PayItems(),
              24.verticalSpace,
              TodaySales(),


            ],
          ),
        ),
      ),
    );
  }
}
