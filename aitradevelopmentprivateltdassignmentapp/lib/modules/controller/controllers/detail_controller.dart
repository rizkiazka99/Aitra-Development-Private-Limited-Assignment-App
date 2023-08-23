import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/data/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  CarouselController carouselController = CarouselController();

  RxBool _isBookmarked = false.obs;
  RxInt _carouselIndex = 0.obs;
  RxInt _sliderValue = 0.obs;
  RxInt _detailFee = int.parse(Data.detail.item.fee).obs;

  bool get isBookmarked => _isBookmarked.value;
  int get carouselIndex => _carouselIndex.value;
  int get sliderValue => _sliderValue.value;
  int get detailFee => _detailFee.value;

  set isBookmarked(bool isBookmarked) =>
      this._isBookmarked.value = isBookmarked;
  set carouselIndex(int carouselIndex) =>
      this._carouselIndex.value = carouselIndex;
  set sliderValue(int sliderValue) =>
      this._sliderValue.value = sliderValue;
  set detailFee(int detailFee) =>
      this._detailFee.value = detailFee;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int pricing(value) {
    sliderValue = (value as double).round();

    if (sliderValue == 0) {
      detailFee = int.parse(Data.detail.item.fee);
    } else {
      if (value == 1) {
        detailFee = int.parse(Data.detail.item.fee) * 7;
      } else {
        detailFee = int.parse(Data.detail.item.fee) * 30;
      }
    }

    return sliderValue;
  }
}