import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../configs/app_configs.dart';

class SharedLoadingDialog extends StatelessWidget {
  late String title;
  late double? loadingProgress;
  SharedLoadingDialog({Key? key, required this.title, this.loadingProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(
            color: Colors.grey,
            valueColor:  AlwaysStoppedAnimation(AppConfigs.primaryColor),
          ),
          Container(
              margin: const EdgeInsets.only(left: 15),
              child: FittedBox(
                child: Text(
                  title,
                  style: title.length >= 15
                      ? AppConfigs.screenTitlesTextStyle
                          .copyWith(fontSize: 12.5.sp)
                      : AppConfigs.screenTitlesTextStyle.copyWith(fontSize: 14.sp),
                ),
              ))
        ],
      ),
    );
  }
}
