import 'package:aitradevelopmentprivateltdassignmentapp/core/colors.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/core/font_sizes.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/controllers/krishi_bazaar_controller.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/data/data.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/widgets/custom_search_bar.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/widgets/default_button.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/widgets/items_gridview.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/router/screens.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
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
        controller.searchController.clear();
        if (itemCategory == 0) {
          controller.itemsList = Data.items;
        }
        controller.filterItemsByCategory(itemCategory);
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

  Widget newestProductsCarousel(KrishiBazaarController controller) {
    return Column(
      children: [
        CarouselSlider(
            carouselController: controller.carouselController,
            items: Data.newestProducts.map((e) {
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(e)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          'All grains',
                          style: h5(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'Newest Products',
                          style: h3(color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                        DefaultButton(
                          onTap: () {},
                          height: 47, 
                          width: MediaQuery.of(context).size.width / 3, 
                          buttonText: 'View all', 
                          borderRadius: 25,
                        ),
                        const SizedBox(height: 15)
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
            options: CarouselOptions(
                height: 313,
                enableInfiniteScroll: false,
                viewportFraction: 0.9,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    controller.carouselIndex = index;
                  });
                }
            )),
        const SizedBox(height: 25),
        Center(
          child: DotsIndicator(
            dotsCount: Data.newestProducts.length,
            position: controller.carouselIndex,
            decorator: const DotsDecorator(
              color: contextGrey,
              activeColor: primaryColor
            ),
          ),
        )
      ],
    );
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
                      onChanged: (value) {
                        controller.searchItems(controller.itemCategory, value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please input a proper search query';
                        }
                      }
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
                  Obx(() => itemsGridview(
                    controller.itemCategory == 0 ? controller.itemsList
                        : controller.filteredItemsByCategory, 
                    () {
                      Get.toNamed(Routes.DETAIL);
                    }
                  )),
                  const SizedBox(height: 45),
                  newestProductsCarousel(controller),
                  const SizedBox(height: 55),
                  Text(
                    'Top Products',
                    style: h6(
                      color: secondaryColor
                    ),
                  ),
                  const SizedBox(height: 20),
                  itemsGridview(Data.topProducts, () {
                    Get.toNamed(Routes.DETAIL);
                  })
                ],
              ),
            )
          ),
        ),
      ),
      floatingActionButton: DefaultButton(
        onTap: () {},
        height: 40,
        width: MediaQuery.of(context).size.width / 4,
        buttonText: '+ Sell'
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}