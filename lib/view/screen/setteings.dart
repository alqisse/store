import 'package:qaisystore/controller/setteings_controller.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/constant/imgaeasset.dart';
import 'package:qaisystore/core/constant/routes.dart';
import 'package:qaisystore/core/funcations/logout.dart';
import 'package:qaisystore/view/widget/custombuttonlang.dart';
import 'package:qaisystore/view/widget/settings/customsettings_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaisystore/view/widget/settings/customswitchsetting.dart';
import 'package:url_launcher/url_launcher.dart';

class SetteingsPage extends StatelessWidget {
  const SetteingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SetteingsPageController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<SetteingsPageController>(
            builder: (controller) => ListView(
              children: [
                Container(
                  height: 150,
                  color: AppColors.primaryColor.withOpacity(0.7),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          top: Get.width / 5,
                          left: Get.width / 3.2,
                          child: Column(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(160)),
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      AppImageAsset.avatar,
                                      height: 75,
                                      width: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "${controller.myServices.sharedPreferences.getString("username")}",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              Text(
                                " +967 ${controller.myServices.sharedPreferences.getString("phone")}",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 35),
                  child: Column(children: [
                    SwitchSetting(
                      title: "59".tr,
                      leadingIcon: Icons.notifications_off_outlined,
                      leadingIconColor: AppColors.primaryColor,
                      value: controller.valueNotifi,
                      onChanged: (value) {
                        controller.muteNotifications(value);
                      },
                    ),
                    SettingItem(
                      title: "60".tr,
                      leadingIcon: Icons.location_pin,
                      leadingIconColor: AppColors.primaryColor,
                      onTap: () {
                        Get.toNamed(AppRoute.addressview);
                      },
                    ),
                    SettingItem(
                      title: "107".tr,
                      leadingIcon: Icons.shopify_outlined,
                      leadingIconColor: AppColors.primaryColor,
                      onTap: () {
                        Get.toNamed(AppRoute.pendingorders);
                      },
                    ),
                    SettingItem(
                      title: "108".tr,
                      leadingIcon: Icons.archive_outlined,
                      leadingIconColor: AppColors.primaryColor,
                      onTap: () {
                        Get.toNamed(AppRoute.archiveorders);
                      },
                    ),
                    SettingItem(
                      title: "75".tr,
                      leadingIcon: Icons.help_outline_outlined,
                      leadingIconColor: AppColors.primaryColor,
                      onTap: () {},
                    ),
                    SettingItem(
                      title: "61".tr,
                      leadingIcon: Icons.phone_callback_outlined,
                      leadingIconColor: AppColors.primaryColor,
                      onTap: () {
                        launchUrl(Uri.parse('tel:+967772654248'));
                      },
                    ),
                    SettingItem(
                      title: "62".tr,
                      leadingIcon: Icons.language_outlined,
                      leadingIconColor: AppColors.primaryColor,
                      onTap: () {
                        Get.defaultDialog(
                            title: "71".tr,
                            content: Column(
                              children: [
                                CustomButtonLang(
                                    textbutton: "العربية",
                                    onPressed: (() {
                                      controller.changeLang("ar");
                                    })),
                                CustomButtonLang(
                                    textbutton: "English",
                                    onPressed: (() {
                                      controller.changeLang("en");
                                    })),
                              ],
                            ));
                      },
                    ),
                    SettingItem(
                      title: "63".tr,
                      leadingIcon: Icons.logout_outlined,
                      leadingIconColor: AppColors.primaryColor,
                      onTap: () {
                        showConfirmLogout(context);
                      },
                    ),
                  ]),
                ),
              ],
            ),
          )),
    );
  }
}
