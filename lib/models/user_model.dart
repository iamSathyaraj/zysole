class AppUser{
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImage;
  final String role;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
     this.phone,
     this.profileImage,
     required this.role
  });

  factory AppUser.fromMap(Map<String, dynamic>data, String id){
    return AppUser(id: id,
     name: data['name'],
      email: data['email'],
      phone: data['phone'],
      profileImage: data['profileImage'],
      role: data['role']
      );
  }

  Map<String, dynamic>toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'profileImage':profileImage,
      'role':role
    };
  }

} 