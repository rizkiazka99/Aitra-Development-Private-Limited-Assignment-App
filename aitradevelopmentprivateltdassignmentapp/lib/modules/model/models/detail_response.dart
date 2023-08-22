import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/models/contact_response.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/model/models/items_response.dart';

class Detail {
    Items item;
    Contact contact;
    List<Items> relatedProducts;

    Detail({
        required this.item,
        required this.contact,
        required this.relatedProducts,
    });

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        item: Items.fromJson(json["item"]),
        contact: Contact.fromJson(json["contact"]),
        relatedProducts: List<Items>.from(json["related_products"].map((x) => Items.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "item": item.toJson(),
        "contact": contact.toJson(),
        "related_products": List<dynamic>.from(relatedProducts.map((x) => x.toJson())),
    };
}