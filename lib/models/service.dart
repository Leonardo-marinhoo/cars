class Service {
  int? id;
  int? tenantId;
  String? name;
  String? description;
  String? price;
  String? cost;
  int? durationMinutes;
  String? imageUrl;
  bool? isActive;
  bool? isFeatured;
  String? category;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;

  Service(
      {this.id,
      this.tenantId,
      this.name,
      this.description,
      this.price,
      this.cost,
      this.durationMinutes,
      this.imageUrl,
      this.isActive,
      this.isFeatured,
      this.category,
      this.sortOrder,
      this.createdAt,
      this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    cost = json['cost'];
    durationMinutes = json['duration_minutes'];
    imageUrl = json['image_url'];
    isActive = json['is_active'];
    isFeatured = json['is_featured'];
    category = json['category'];
    sortOrder = json['sort_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

 Map<String, dynamic> toJson() {
  return {
    'id': id,
    'tenant_id': tenantId,
    'name': name,
    'description': description,
    'price': price,
    'cost': cost,
    'duration_minutes': durationMinutes,
    'image_url': imageUrl,
    'is_active': isActive,
    'is_featured': isFeatured,
    'category': category,
    'sort_order': sortOrder,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

}