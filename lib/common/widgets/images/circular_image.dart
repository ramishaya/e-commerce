import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetWorkImage = false,
    this.overLayColor,
    this.backGroundColor,
     this.width,
     this.height,
    this.padding = ESizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetWorkImage;
  final Color? overLayColor;
  final Color? backGroundColor;
  final double? width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HelperFunctions.screenWidtht() * 0.15,
      height: HelperFunctions.screenWidtht() * 0.15,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
          color: backGroundColor ??
              (HelperFunctions.isDarkMode(context)
                  ? EColors.black
                  : EColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Image(
            fit: fit,
            image: isNetWorkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
            color: overLayColor),
      ),
    );
  }
}
