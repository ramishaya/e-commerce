import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ESpacingStyles {
  
  static  EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(top: ESizes.appBarHeight,
                left: HelperFunctions.screenWidtht() * 0.03 ,
                right:  HelperFunctions.screenWidtht() * 0.03,
                bottom: ESizes.defaultSpace);
}
