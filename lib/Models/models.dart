// ignore_for_file: camel_case_types

class userModel {
  String Id;
  String name;
  String image;

  userModel({
    this.Id,
    this.image,
    this.name,
  });
}

class orderModel {
  String id;
  String provider;
  String name;
  String date;
  String service;
  String price;

  orderModel({
    this.id,
    this.provider,
    this.price,
    this.name,
    this.service,
    this.date,
  });
}

class regModel {
  String id;
  String name;
  String phone;
  String email;
  String location;
  String pass;

  regModel({
    this.id,
    this.phone,
    this.name,
    this.email,
    this.location,
    this.pass,
  });
}

class providerModel {
  String id;
  String name;
  String email;
  String contact;
  String service;
  String profile;
  String pass;
  String cnic;
  String location;
 
  
  


  providerModel({
    this.id,
    this.email,
    this.name,
    this.cnic,
    this.contact,
    this.location,
    this.pass,
    this.profile,
    this.service,
  });
}
