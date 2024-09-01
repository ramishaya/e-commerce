import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/device/device_utillity.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ETabBar extends StatelessWidget implements PreferredSizeWidget {
  const ETabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          HelperFunctions.isDarkMode(context) ? EColors.black : EColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: EColors.primary,
        labelColor: HelperFunctions.isDarkMode(context)
            ? EColors.white
            : EColors.primary,
        unselectedLabelColor: EColors.darkGrey,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarBarHeight());
}
