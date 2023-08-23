import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/data/data.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/models/items_response.dart';
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
  RxList<Items> _itemsList = <Items>[].obs;
  RxList<Items> _filteredItemsByCategory = <Items>[].obs;

  int get transactionType => _transactionType.value;
  int get itemCategory => _itemCategory.value;
  int get carouselIndex => _carouselIndex.value;
  List<Items> get itemsList => _itemsList;
  List<Items> get filteredItemsByCategory => _filteredItemsByCategory;

  set transactionType(int transactionType) =>
      this._transactionType.value = transactionType;
  set itemCategory(int itemCategory) =>
      this._itemCategory.value = itemCategory;
  set carouselIndex(int carouselIndex) =>
      this._carouselIndex.value = carouselIndex;
  set itemsList(List<Items> itemsList) =>
      this._itemsList.value = itemsList;
  set filteredItemsByCategory(List<Items> filteredItemsByCategory) =>
      this._filteredItemsByCategory.value = filteredItemsByCategory;

  @override
  void onInit() {
    super.onInit();
    itemsList = Data.items;
  }

  @override
  void onClose() {
    super.onClose();
  }

  filterItemsByCategory(itemCategory) {
    filteredItemsByCategory = Data.items.where((element) {
      if (itemCategory == 1) {
        return element.type.toLowerCase().contains('Transport'.toLowerCase());
      } else if (itemCategory == 2) {
        return element.type.toLowerCase().contains('Storage'.toLowerCase());
      } else if (itemCategory == 3) {
        return element.type.toLowerCase().contains('Equipment'.toLowerCase());
      } else {
        return true;
      }
    }).toList();
  }

  searchItems(itemCategory, String query) {
    if (itemCategory != 0) {
      filteredItemsByCategory = Data.items.where((element) {
        if (itemCategory == 1) {
          return element.type
                  .toLowerCase()
                  .contains('Transport'.toLowerCase()) &&
              element.name.toLowerCase().contains(query.toLowerCase());
        } else if (itemCategory == 2) {
          return element.type
                  .toLowerCase()
                  .contains('Storage'.toLowerCase()) &&
              element.name.toLowerCase().contains(query.toLowerCase());
        } else if (itemCategory == 3) {
          return element.type
                  .toLowerCase()
                  .contains('Equipment'.toLowerCase()) &&
              element.name.toLowerCase().contains(query.toLowerCase());
        } else {
          return true;
        }
      }).toList();
    } else {
      itemsList = Data.items.where((element) => 
        element.name
            .toLowerCase()
            .contains(query.toLowerCase())
      ).toList();
    }
    
  }
}