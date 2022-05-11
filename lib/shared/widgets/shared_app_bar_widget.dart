import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../configs/app_configs.dart';

class SharedAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final String? leadingSVG;
  final List<Widget> actions;
  final double? leadingWidth;
  final VoidCallback? onTappingTitle;
  final bool isHome;
  const SharedAppBarWidget(
      {Key? key,
      required this.title,
      required this.leadingSVG,
      required this.actions,
      required this.leadingWidth,
      required this.isHome,
      this.onTappingTitle})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 4.0,
      elevation: 0,
      backgroundColor: AppConfigs.primaryColor,
      leadingWidth: isHome ? 56 : 38,
      title: InkWell(
        onTap: onTappingTitle,
        child: AutoSizeText(
          title!,
          style: AppConfigs.appBarTitle,
        ),
      ),
      // leading: InkWell(
      //   onTap: isHome
      //       ? () {
      //           Scaffold.of(context).openDrawer();
      //         }
      //       : () {
      //           Navigator.of(context).pop();
      //         },
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 12, right: 12),
      //     child: SvgPicture.asset(
      //       leadingSVG!,
      //     ),
      //   ),
      // ),
      actions: actions,
    );
  }
}