import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utiles/color.dart';
import '../Utiles/asset.dart';
import '../Utiles/theme.dart';
import '../widget/custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    bool isDarkMode = themeController.isDarkMode;

    return Drawer(
      backgroundColor: isDarkMode ? Colors.black : AppColor.whiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: isDarkMode ? Colors.grey[800] : Colors.brown),
            child: Center(
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      child: Image.asset(
                        AppAsset.ImgDashMan,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  CustomText(
                    stText: 'Test',
                    stColor: AppColor.whiteColor,
                    stFontSize: 22,
                  )
                ],
              ),
            ),
          ),
          _buildDrawerItem(Icons.dashboard, "Dashboard", () {}, isDarkMode),
          _buildExpandableItem(Icons.calendar_today, "Calendar", [
            _buildSubItem("Event 1", () {}, isDarkMode),
            _buildSubItem("Event 2", () {}, isDarkMode),
          ], isDarkMode),
          _buildExpandableItem(Icons.check_box, "To-Do List", [
            _buildSubItem("Task 1", () {}, isDarkMode),
            _buildSubItem("Task 2", () {}, isDarkMode),
          ], isDarkMode),
          _buildExpandableItem(Icons.notifications, "Announcements", [
            _buildSubItem("Announcement 1", () {}, isDarkMode),
            _buildSubItem("Announcement 2", () {}, isDarkMode),
          ], isDarkMode,
              subtitle: "You have 5 new notifications"),
          _buildExpandableItem(Icons.accessibility, "Accessibility Options", [
            _buildDrawerItem(Icons.text_fields, "Text Size", () {}, isDarkMode, isSubItem: true),
            _buildDrawerItem(Icons.contrast, "Contrast", () {}, isDarkMode, isSubItem: true),
            _buildDrawerItem(Icons.color_lens, "Color Scheme", () {}, isDarkMode, isSubItem: true),
          ], isDarkMode),
          _buildDrawerItem(Icons.settings, "Settings", () {}, isDarkMode),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap, bool isDarkMode, {bool isSubItem = false}) {
    return ListTile(
      leading: isSubItem ? null : Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
      title: CustomText(
        stText: title,
        stColor: isDarkMode ? Colors.white : Colors.black,
        stFontSize: isSubItem ? 14 : 16,
      ),
      onTap: onTap,
    );
  }

  Widget _buildExpandableItem(IconData icon, String title, List<Widget> children, bool isDarkMode, {String? subtitle}) {
    return ExpansionTile(
      leading: Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
      title: CustomText(
        stText: title,
        stColor: isDarkMode ? Colors.white : Colors.black,
        stFontSize: 16,
      ),
      subtitle: subtitle != null
          ? CustomText(
              stText: subtitle,
              stColor: isDarkMode ? Colors.grey[400] : AppColor.greyColor,
              stFontSize: 12,
            )
          : null,
      children: children,
    );
  }

  Widget _buildSubItem(String title, VoidCallback onTap, bool isDarkMode) {
    return _buildDrawerItem(Icons.circle, title, onTap, isDarkMode, isSubItem: true);
  }
}
