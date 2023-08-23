import 'package:aitradevelopmentprivateltdassignmentapp/core/colors.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/core/font_sizes.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/controllers/detail_controller.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/data/data.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/widgets/default_button.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/widgets/items_gridview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Widget firstHalf(DetailController controller) {
    return Stack(
      children: [
        CarouselSlider(
            carouselController: controller.carouselController,
            items: Data.detailImages.map((e) {
              return Image.asset(Data.detail.item.image, fit: BoxFit.cover);
            }).toList(),
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 2,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    controller.carouselIndex = index;
                  });
                })),
        Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Image.asset('assets/icons/back.png'),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/icons/share.png')),
                      Obx(() => IconButton(
                          onPressed: () {
                            controller.isBookmarked = !controller.isBookmarked;
                          },
                          icon: Image.asset(!controller.isBookmarked
                              ? 'assets/icons/bookmark.png'
                              : 'assets/icons/bookmarked.png'))),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: DotsIndicator(
                    dotsCount: Data.detailImages.length,
                    position: controller.carouselIndex,
                    decorator: const DotsDecorator(
                        color: contextGrey, activeColor: primaryColor),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DetailController controller = Get.find<DetailController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                firstHalf(controller),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Data.detail.item.type,
                        style: bodyMd(
                          fontFamily: 'Montserrat'
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        Data.detail.item.name,
                        style: h4(
                          color: secondaryColor
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(() => Text(
                        '₹ ${controller.detailFee.toString()}/ Day',
                        style: h4_5(
                          color: primaryColorLight
                        )
                      )),
                      const SizedBox(height: 15),
                      Obx(() => SfSlider(
                        min: 0,
                        max: 2,
                        value: controller.sliderValue,
                        onChanged: (value) {
                          controller.pricing(value);
                        },
                        interval: 1,
                        showLabels: true,
                        stepSize: 1,
                        activeColor: primaryColorLight,
                        showDividers: true,
                        labelFormatterCallback: (actualValue, formattedText) {
                          if (actualValue == 0) {
                            formattedText = 'Daily';
                          } else {
                            if (actualValue == 1) {
                              formattedText = 'Weekly';
                            } else {
                              formattedText = 'Monthly';
                            }
                          }

                          return formattedText;
                        },
                      )),
                      const SizedBox(height: 35),
                      Text(
                        'Description',
                        style: h6(
                          color: secondaryColor
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        Data.detail.item.description,
                        style: bodySm(color: textGrey),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Seller Information',
                        style: h6(
                          color: secondaryColor
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: primaryColorLighter,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: primaryColorLight.withOpacity(0.2),
                                          width: 2
                                        )
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          Data.detail.contact.profilePicture
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      Data.detail.contact.name,
                                      style: h5(color: secondaryColor),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/distance.png'
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      Data.detail.contact.distance,
                                      style: bodyXs(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: primaryColor,
                                        size: 15,
                                      ),
                                      const SizedBox(width: 4),
                                      Flexible(
                                        child: Text(
                                          Data.detail.contact.address,
                                          style: bodyXs(
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'View Profile',
                                    style: buttonMd(
                                      color: primaryColor
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),
                      DefaultButton(
                        height: 47, 
                        width: MediaQuery.of(context).size.width, 
                        buttonText: 'Contact',
                        buttonColor: disabledButton,
                        buttonTextColor: Color(0xFF999999),
                        borderRadius: 25,
                      ),
                      const SizedBox(height: 35),
                      Text(
                        'Related Products',
                        style: h6(
                          color: secondaryColor
                        ),
                      ),
                      const SizedBox(height: 15),
                      itemsGridview(Data.detail.relatedProducts, () {}),
                      const SizedBox(height: 15),
                      Center(
                        child: TextButton(
                          onPressed: () {}, 
                          child: Text(
                            'View more',
                            style: buttonLg(color: primaryColor),
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}