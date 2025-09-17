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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_id'] = this.tenantId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['cost'] = this.cost;
    data['duration_minutes'] = this.durationMinutes;
    data['image_url'] = this.imageUrl;
    data['is_active'] = this.isActive;
    data['is_featured'] = this.isFeatured;
    data['category'] = this.category;
    data['sort_order'] = this.sortOrder;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}