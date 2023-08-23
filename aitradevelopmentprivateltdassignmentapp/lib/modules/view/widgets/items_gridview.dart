import 'package:aitradevelopmentprivateltdassignmentapp/core/colors.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/core/font_sizes.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/models/items_response.dart';
import 'package:flutter/material.dart';

Widget itemsGridview(List<Items> items, void Function()? onTap) {
  return items.isNotEmpty ? GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 7,
                      color: contextGrey.withOpacity(0.1),
                      offset: const Offset(0, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    items[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  items[index].type,
                  style: bodySm(
                      fontFamily: 'Montserrat',
                      color: typeColor,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  items[index].name,
                  style: h4(color: secondaryColor),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: primaryColor,
                          size: 15,
                        ),
                        Text(
                          items[index].distance,
                          style: bodyXs(
                              color: primaryColor, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '₹ ${items[index].fee}',
                          style: h5(color: primaryColor),
                        ),
                        Text(
                          ' /day',
                          style: h5(
                              color: primaryColor, fontWeight: FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }) : Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/empty.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 15),
            Text(
              'No items found',
              style: h5(
                color: secondaryColor,
              ),
            )
          ],
        ),
      );
}