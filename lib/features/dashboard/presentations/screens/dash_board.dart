import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marchant_hub/common/widgets/custom_appbar.dart';
import 'package:marchant_hub/common/widgets/image_widget.dart';
import 'package:marchant_hub/common/widgets/text_view.dart';
import 'package:marchant_hub/core/theme/pallets.dart';
import 'package:marchant_hub/features/history/presentations/screens/history_tab.dart';
import 'package:marchant_hub/features/home/presentations/screens/home_screen.dart';
import 'package:marchant_hub/features/payments/presentations/screens/payments_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentindex = 0;
  int? selectedindex;


  List<Widget> pages=[
    HomeScreen(),
    PaymentsTab(),
    HistoryTab(),
    HistoryTab(),
    HistoryTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        tittle: TextView(
          text: "Matchant Hub",
          color: Pallets.primary,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Pallets.primary,
            fontSize: 20,
          ),
        ),
        actions: [Icon(Iconsax.eye, size: 16), 10.horizontalSpace],
      ),

      body: IndexedStack(
        index: currentindex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: Pallets.primary,
        currentIndex: currentindex,
        onTap: (i) => setState(() => currentindex = i),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon:  IgnorePointer(
              child:  Icon(Icons.home_filled),
            ),
            activeIcon:  Icon(Icons.home_filled),
            label: 'Home',
          ),
          
          BottomNavigationBarItem(
            icon:  IgnorePointer(
              child:  Icon(Icons.payments_outlined),
            ),
            activeIcon: IgnorePointer(
              child: Icon(Icons.payments_outlined),
            ),
            label: 'Payments',
          ),
          
          BottomNavigationBarItem(
            icon:  IgnorePointer(
              child: Icon(Icons.event_note),
            ),
            activeIcon: IgnorePointer(
              child: Icon(Icons.event_note),
            ),
            label: 'History',
          ),
          
          BottomNavigationBarItem(
            icon:  IgnorePointer(
              child: Icon(Icons.insights_outlined),
            ),
            activeIcon: IgnorePointer(
              child: Icon(Icons.insights_outlined),
            ),
            label: 'Insight',
          ),
          
          BottomNavigationBarItem(
            icon:  IgnorePointer(
              child: Icon(Iconsax.more),
            ),
            activeIcon: IgnorePointer(
              child: Icon(Iconsax.more),
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
