import 'package:qaisystore/controller/home/homepage_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/core/funcations/translatdatabase.dart';
import 'package:qaisystore/data/model/itemsmodel.dart';
import 'package:qaisystore/linkapi.dart';
import 'package:qaisystore/view/widget/home/Customcategorieshome.dart';
import 'package:qaisystore/view/widget/home/customappbar_home.dart';
import 'package:qaisystore/view/widget/home/customcardhome.dart';
import 'package:qaisystore/view/widget/home/customlistitems.dart';
import 'package:qaisystore/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // HomePageControllerImp controller =
    Get.put(HomePageControllerImp());
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: GetBuilder<HomePageControllerImp>(
            builder: (controller) => RefreshIndicator(
                  onRefresh: () async {
                    await controller.onRefresh();
                  },
                  child: ListView(
                    children: [
                      CustomAppBarHome(
                        hinttext: "53".tr,
                        onPressedIcon: () {
                          controller.goToNotifications();
                        },
                        onPressedPrefxIcon: () {
                          controller.onSearch();
                        },
                        iconButton: const Icon(
                          Icons.notifications_active_outlined,
                          color: AppColors.primaryColor,
                        ),
                        myController: controller.search,
                        onChanged: (val) {
                          controller.checkSearch(val);
                        },
                      ),
                      HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: controller.issearch!
                              ? ListItemsSearch(
                                  listdatamodel: controller.datasearch,
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: controller.settingstxt.isNotEmpty
                                          ? CustomCardHome(
                                              title:
                                                  "${translationDatabase(controller.settingstxt[0]['settingstxt_title_ar'], controller.settingstxt[0]['settingstxt_title_en'])}",
                                              body:
                                                  "${translationDatabase(controller.settingstxt[0]['settingstxt_body_ar'], controller.settingstxt[0]['settingstxt_body_en'])}")
                                          : const Center(
                                              child: CircularProgressIndicator(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                    ),
                                    CustomTitleHome(title: "54".tr),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const CustomCategoriesHome(),
                                    CustomTitleHome(title: "55".tr),
                                    const CustomListItemsHome(),
                                  ],
                                ))
                    ],
                  ),
                )));
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToItemsDetalis(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
