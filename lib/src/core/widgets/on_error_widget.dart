import 'package:flutter/material.dart';
import 'package:brand_admin/src/core/colors/colors.dart';
import 'package:gap/gap.dart';

class OnErrorWidget extends StatelessWidget {
  const OnErrorWidget({super.key, required this.refresh});
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: AppColors.red,),
          Text('We have problem, please try again later'),
          Gap(10),
          InkWell(
            onTap: refresh,
            borderRadius: BorderRadius.circular(12),
            child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.mainColor
            ),
            width: 200,
            height: 50,
            child: Center(
              child: Icon(Icons.refresh, color: AppColors.white),
            ),
          ),
          )
        ],
      ),
    );
  }
}