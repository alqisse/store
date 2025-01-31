import 'package:qaisystore/controller/favorite_controller.dart';
import 'package:qaisystore/controller/items_controller.dart';
import 'package:qaisystore/core/class/handlingdataview.dart';
import 'package:qaisystore/core/constant/colors.dart';
import 'package:qaisystore/data/model/itemsmodel.dart';
import 'package:qaisystore/linkapi.dart';
import 'package:qaisystore/view/widget/home/customappbar_home.dart';
import 'package:qaisystore/view/widget/items/customlistitems.dart';
import 'package:qaisystore/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp favoriteController = Get.put(FavoriteControllerImp());
    //  ItemsModel itemsModel = ItemsModel();
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<ItemsControllerImp>(
                builder: ((controller) => ListView(
                      children: [
                        CustomAppBarHome(
                          hinttext: "53".tr,
                          onPressedIcon: () {
                            controller.goToCart();
                          },
                          onPressedPrefxIcon: () {
                            controller.onSearch();
                          },
                          iconButton: const Icon(
                            Icons.shopping_cart_checkout_outlined,
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
                                  listdatamodel: controller.datasearch)
                              : Column(
                                  children: [
                                    const CustomCategoriesItems(),
                                    GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller.data.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 0.7),
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          // favoriteController.isfavorite.clear();
                                          favoriteController.isfavorite[
                                              controller.data[index]['itmes_id']
                                                  .toString()] = controller
                                              .data[index]['favorit']
                                              .toString();
                                          print(
                                              "${favoriteController.isfavorite}");
                                          return CustomListItems(
                                              itemsModel: ItemsModel.fromJson(
                                                  controller.data[index]));
                                        }),
                                  ],
                                ),
                        )
                      ],
                    )))));
  }
}

class ListItemsSearch extends GetView<ItemsControllerImp> {
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
