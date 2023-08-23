import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KrishiBazaarController extends GetxController {
  TextEditingController searchController = TextEditingController();
  CarouselController carouselController = CarouselController();

  final searchFormKey = GlobalKey<FormState>();
  var autoValidateSearch = AutovalidateMode.disabled;

  RxInt _transactionType = 0.obs;
  RxInt _itemCategory = 0.obs;
  RxInt _carouselIndex = 0.obs;

  int get transactionType => _transactionType.value;
  int get itemCategory => _itemCategory.value;
  int get carouselIndex => _carouselIndex.value;

  set transactionType(int transactionType) =>
      this._transactionType.value = transactionType;
  set itemCategory(int itemCategory) =>
      this._itemCategory.value = itemCategory;
  set carouselIndex(int carouselIndex) =>
      this._carouselIndex.value = carouselIndex;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}