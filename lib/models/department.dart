class department {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? unitId;

  department({this.id, this.name, this.createdAt, this.updatedAt, this.unitId});

  department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unitId = json['unit_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['unit_id'] = unitId;
    return data;
  }
}
