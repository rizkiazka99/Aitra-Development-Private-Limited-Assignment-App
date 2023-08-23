import 'package:aitradevelopmentprivateltdassignmentapp/core/colors.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/core/font_sizes.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/controllers/krishi_bazaar_controller.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/data/data.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/widgets/custom_search_bar.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/widgets/items_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KrishiBazaarScreen extends StatefulWidget {
  const KrishiBazaarScreen({super.key});

  @override
  State<KrishiBazaarScreen> createState() => _KrishiBazaarScreenState();
}

class _KrishiBazaarScreenState extends State<KrishiBazaarScreen> {
  Widget transactionTypeButton(KrishiBazaarController controller, int transactionType, String type) {
    return Obx(() => InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        controller.transactionType = transactionType;
      },
      child: Container(
        height: 39,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: controller.transactionType == transactionType 
              ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(33)
        ),
        child: Center(
          child: Text(
            type,
            style: h5(
              color: controller.transactionType == transactionType 
                  ? Colors.white : Colors.black
            ),
          ),
        ),
      )
    ));
  }

  Widget itemCategoryButton(KrishiBazaarController controller, String iconPathSelected, String iconPathUnselected, int itemCategory, String type) {
    return Obx(() => InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        controller.itemCategory = itemCategory;
      },
      child: Container(
        height: 60,
        width: controller.itemCategory == itemCategory
          ? MediaQuery.of(context).size.width / 3
          : MediaQuery.of(context).size.width / 6,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          controller.itemCategory == itemCategory ? 19 : 10
        ),
        color: controller.itemCategory == itemCategory
          ? secondaryColor : categoryUnselectedColor
        ),
        child: controller.itemCategory == itemCategory
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconPathSelected
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    type,
                    style: buttonSm(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ) : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconPathUnselected
                  ),
                  const SizedBox(height: 4),
                  Flexible(
                    child: Text(
                      type,
                      style: buttonSm(
                        color: secondaryColor
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    KrishiBazaarController controller = Get.find<KrishiBazaarController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      transactionTypeButton(controller, 0, 'All'),
                      transactionTypeButton(controller, 1, 'Buy'),
                      transactionTypeButton(controller, 2, 'Rent')
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 55,
                    child: CustomSearchBar(
                      formKey: controller.searchFormKey, 
                      autovalidateMode: controller.autoValidateSearch, 
                      controller: controller.searchController, 
                      label: 'Search Product Name...',
                      prefixIcon: Image.asset('assets/icons/search.png'),
                      validator: (value) {}
                    ),
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        itemCategoryButton(
                          controller, 
                          'assets/icons/allitems_selected.png', 
                          'assets/icons/allitems_unselected.png', 
                          0, 
                          'All Items'
                        ),
                        itemCategoryButton(
                          controller, 
                          'assets/icons/transport_selected.png', 
                          'assets/icons/transport_unselected.png', 
                          1, 
                          'Transport'
                        ),
                        itemCategoryButton(
                          controller, 
                          'assets/icons/storage_selected.png', 
                          'assets/icons/storage_unselected.png', 
                          2, 
                          'Storage'
                        ),
                        itemCategoryButton(
                          controller, 
                          'assets/icons/equipment_selected.png', 
                          'assets/icons/equipment_unselected.png', 
                          3, 
                          'Equipment'
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  itemsGridview(Data.items),
                  const SizedBox(height: 15),
                  // Carousel Slider
                  const SizedBox(height: 15),
                  Text(
                    'Top Products',
                    style: h6(
                      color: secondaryColor
                    ),
                  ),
                  const SizedBox(height: 20),
                  itemsGridview(Data.topProducts)
                ],
              ),
            )
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Text(
            '+ Sell',
            style: buttonLg(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}