class Restaurant {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? name;
  String? description;
  String? address;
  String? phone;
  String? email;
  String? image;
  double? rating;
  String? latitude;
  String? longitude;
  int? openHours;
  List<String>? cuisineType;

  Restaurant(
      {this.id,
      this.dateCreated,
      this.dateUpdated,
      this.name,
      this.description,
      this.address,
      this.phone,
      this.email,
      this.image,
      this.rating,
      this.latitude,
      this.longitude,
      this.openHours,
      this.cuisineType});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    rating = json['rating'].toDouble();
    latitude = json['latitude'];
    longitude = json['longitude'];
    openHours = json['open_hours'];
    cuisineType = json['cuisine_type']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['date_created'] = dateCreated;
    data['date_updated'] = dateUpdated;
    data['name'] = name;
    data['description'] = description;
    data['address'] = address;
    data['phone'] = phone;
    data['email'] = email;
    data['image'] = image;
    data['rating'] = rating;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['open_hours'] = openHours;
    data['cuisine_type'] = cuisineType;
    return data;
  }
}
