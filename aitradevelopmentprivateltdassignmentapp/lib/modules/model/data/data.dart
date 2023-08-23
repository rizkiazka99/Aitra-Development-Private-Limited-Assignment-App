import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/models/contact_response.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/models/detail_response.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/models/items_response.dart';

class Data {
  static final List<Items> items = [
    Items(
      name: "Rotovator", 
      type: "Equipment", 
      distance: "23 Km", 
      fee: "250", 
      image: "assets/images/rotovator.png"
    ),
    Items(
      name: "Strawreeper", 
      type: "Equipment", 
      distance: "23 Km", 
      fee: "250", 
      image: "assets/images/strawreeper.png"
    ),
    Items(
      name: "Planter", 
      type: "Equipment", 
      distance: "2 Km", 
      fee: "250", 
      image: "assets/images/planter.png"
    ),
    Items(
      name: "Tructor", 
      type: "Transport", 
      distance: "23 Km", 
      fee: "250", 
      image: "assets/images/tructor.png"
    )
  ];

  static final List<Items> topProducts = [
    Items(
      name: "Tomatoes", 
      type: "Vegetables", 
      distance: "2 Km", 
      fee: "250", 
      image: "assets/images/topproducts1.png"
    ),
    Items(
      name: "Wheat", 
      type: "Grains", 
      distance: "23 Km", 
      fee: "250", 
      image: "assets/images/topproducts2.png"
    ),
    Items(
      name: "Milk",
      type: "Dairy",
      distance: "2 Km",
      fee: "250",
      image: "assets/images/topproducts3.png"
    ),
    Items(
      name: "Cheese",
      type: "Dairy",
      distance: "23 Km",
      fee: "250",
      image: "assets/images/topproducts4.png"
    )
  ];

  static final Detail detail = Detail(
    item: Items(
      name: "Rotovator",
      type: "Equipment",
      distance: '2 km',
      fee: "240",
      image: "assets/images/rotavatordetail.png"
    ), 
    contact: Contact(
      name: "Ram Prasad",
      profilePicture: "assets/images/ramprasad.png",
      address: "227, Muradpur, Uttar Pradesh 110049",
      distance: "2 km"
    ), 
    relatedProducts: [
      Items(
        name: "Tomatoes",
        type: "Vegetables",
        distance: "2 Km",
        fee: "250",
        image: "assets/images/relatedproducts1.png"
      ),
      Items(
        name: "Wheat",
        type: "Grains",
        distance: "23 Km",
        fee: "250",
        image: "assets/images/relatedproducts2.png"
      )
    ]
  );

  static final newestProducts = [
    'assets/images/newestproducts.png',
    'assets/images/newestproducts.png',
    'assets/images/newestproducts.png',
    'assets/images/newestproducts.png'
  ];

  static final detailImages = [
    'assets/images/rotavatordetail.png',
    'assets/images/rotavatordetail.png',
    'assets/images/rotavatordetail.png'
  ];
}