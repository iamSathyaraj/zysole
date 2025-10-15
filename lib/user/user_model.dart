class Address {
  final String line1;
  final String? line2;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  Address({
    required this.line1,
    this.line2,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  Map<String, dynamic> toMap() => {
    'line1': line1,
    'line2': line2,
    'city': city,
    'state': state,
    'country': country,
    'postalCode': postalCode,
  };

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      line1: map['line1'],
      line2: map['line2'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      postalCode: map['postalCode'],
    );
  }
}

class AppUser{

  final String id;
  final String name;
  final String? userName;
  final String email;
  final String? phone;
  final String? profileImage;
  final String role;
  String status;
  // Address? address;

  AppUser({
    required this.id,
    required this.name,
    this.userName,
    required this.email,
     this.phone,
     this.profileImage,
     required this.role,
     this.status="active",
      // this.address
  });

  factory AppUser.fromMap(Map<String, dynamic>data, String id){
    return AppUser(id: id,
    userName: data['userName']?? " ",
     name: data['name']?? '',
      email: data['email']?? ' ',
      phone: data['phone']?? ' ',
      profileImage: data['profileImage']?? ' ',
      role: data['role']?? 'user',
      status: data['status']?? 'Active',

      // address: data['address']?? " "
      );
  }

  Map<String, dynamic>toMap(){
    return {
      'name':name,
      'userName':userName,
      'email':email,
      'phone':phone,
      'profileImage':profileImage,
      'role':role,
      'status':status,
      // 'address':address
    };
  }

} 