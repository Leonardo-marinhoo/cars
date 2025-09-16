class User{
  String name;
  String email;
  String phone;
  String cpf_cnpj;
  String image_url;
  String role;
  String token;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.cpf_cnpj,
    required this.image_url,
    required this.role,
    required this.token
  });


  factory User.fromJson(Map<String, dynamic> json){
    return User(
      name: json["name"],
      email:json["email"],
      phone: json["phone"],
      cpf_cnpj: json["cpf_cnpj"],
      image_url: json["image_url"],
      role: json["role"],
      token: json["token"]
    );
  }
}