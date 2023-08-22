class Contact {
    String name;
    String profilePicture;
    String address;
    String distance;

    Contact({
        required this.name,
        required this.profilePicture,
        required this.address,
        required this.distance,
    });

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["name"],
        profilePicture: json["profile_picture"],
        address: json["address"],
        distance: json["distance"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "profile_picture": profilePicture,
        "address": address,
        "distance": distance,
    };
}