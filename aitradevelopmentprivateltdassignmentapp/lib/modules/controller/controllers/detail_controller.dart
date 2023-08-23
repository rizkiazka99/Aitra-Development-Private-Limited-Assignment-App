import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  CarouselController carouselController = CarouselController();

  RxBool _isBookmarked = false.obs;
  RxInt _carouselIndex = 0.obs;

  bool get isBookmarked => _isBookmarked.value;
  int get carouselIndex => _carouselIndex.value;

  set isBookmarked(bool isBookmarked) =>
      this._isBookmarked.value = isBookmarked;
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