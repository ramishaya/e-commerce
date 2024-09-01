import 'package:ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PrimaryHedaerContainer extends StatelessWidget {
  const PrimaryHedaerContainer({
    super.key, required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: EColors.primary,
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: HelperFunctions.screenWidtht() * 1,
        child: Stack(
          children: [
            Positioned(
              top: -HelperFunctions.screenWidtht() * 0.3,
              right: -HelperFunctions.screenWidtht() * 0.5,
              child: CircularContainer(
                height: HelperFunctions.screenWidtht() * 0.9,
                width: HelperFunctions.screenWidtht() * 0.9,
                radius: HelperFunctions.screenWidtht() * 0.9,
                backgroundColor: EColors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: HelperFunctions.screenWidtht() * 0.26,
              right: -HelperFunctions.screenWidtht() * 0.55,
              child: CircularContainer(
                height: HelperFunctions.screenWidtht() * 0.9,
                width: HelperFunctions.screenWidtht() * 0.9,
                radius: HelperFunctions.screenWidtht() * 0.9,

                backgroundColor: EColors.white.withOpacity(0.1),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
