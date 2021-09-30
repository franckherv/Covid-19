class Users {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
 
  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
 
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['_id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      address: Address.fromJson(json['address'])
     
    );
  }
}

// ADDRESS

class Address {
  final String street;
  final String city;
  final Location geo;
  Address({
    required this.street,
    required this.city,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      city: json["city"],
      street: json["street"],
       geo: Location.fromJson(json["geo"]),
      );
  }
}


// LOCATION
class Location {
  final int lat;
  final int long;
  Location(
    {required this.lat, 
    required this.long});

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      lat: json["lat"],
      long: json["long"],
    );
  }
}
