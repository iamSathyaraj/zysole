class AppUser{
  final String id;
  final String name;
  final String? userName;
  final String email;
  final String? phone;
  final String? profileImage;
  final String role;
  String status;

  AppUser({
    required this.id,
    required this.name,
    this.userName,
    required this.email,
     this.phone,
     this.profileImage,
     required this.role,
     this.status="active",
  });

  factory AppUser.fromMap(Map<String, dynamic>data, String id){
    return AppUser(id: id,
    userName: data['userName']?? " ",
     name: data['name']?? '',
      email: data['email']?? ' ',
      phone: data['phone']?? ' ',
      profileImage: data['profileImage'],
      role: data['role']?? 'user',
      status: data['status']?? 'Active',

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
    };
  }

} 