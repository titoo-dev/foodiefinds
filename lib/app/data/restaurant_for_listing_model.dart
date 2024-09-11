class RestaurantForListing {
  int? id;
  String? name;
  String? description;
  String? address;
  int? rating;
  String? image;
  List<String>? cuisineType;

  RestaurantForListing(
      {this.id,
      this.name,
      this.description,
      this.address,
      this.rating,
      this.image,
      this.cuisineType});

  RestaurantForListing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    rating = json['rating'];
    image = json['image'];
    cuisineType = json['cuisine_type']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['address'] = address;
    data['rating'] = rating;
    data['image'] = image;
    data['cuisine_type'] = cuisineType;
    return data;
  }
}
