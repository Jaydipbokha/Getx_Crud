import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utiles/color.dart';
import '../Utiles/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool isBackButtonVisible;
  final bool isDrawerIconVisible;
  final bool isCenterTitle;
  final Function? onDrawerIconPressed;
  final Function? onBackButtonPressed;

  CustomAppBar({
    required this.title,
    this.actions = const [],
    this.isBackButtonVisible = false,
    this.isDrawerIconVisible = false,
    this.isCenterTitle = true,
    this.onDrawerIconPressed,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return AppBar(
          backgroundColor:
              themeController.isDarkMode ? Colors.black : AppColor.whiteColor,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: Text(
            title,
            style: TextStyle(
              color: themeController.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          centerTitle: isCenterTitle,
          leading: isBackButtonVisible
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: themeController.isDarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
                  onPressed: () {
                    if (onBackButtonPressed != null) {
                      onBackButtonPressed!();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                )
              : (isDrawerIconVisible
                  ? IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: themeController.isDarkMode
                            ? Colors.white
                            : Colors.black,
                      ),
                      onPressed: () {
                        if (onDrawerIconPressed != null) {
                          onDrawerIconPressed!();
                        } else {
                          Scaffold.of(context).openDrawer();
                        }
                      },
                    )
                  : null),
          actions: [
            ...actions,
           
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
