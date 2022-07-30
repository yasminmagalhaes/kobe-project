import 'package:flutter/material.dart';
import 'package:prjkode/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key, required this.leftIcon}) : super(key: key);

  final Widget leftIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBarColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftIcon,
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo1.png',
                    width: 115,
                    height: 77,
                  ),
                  const Text(
                    'RICK AND MORTY API',
                    style: TextStyle(
                        color: AppColors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Icon(
                Icons.account_circle,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);
}
