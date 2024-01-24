class department {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? unitId;
  int? subDirectoryId;
  int? customOrder;

  department(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.unitId,
      this.subDirectoryId,
      this.customOrder});

  department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unitId = json['unit_id'];
    subDirectoryId = json['sub_directory_id'];
    customOrder = json['custom_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['unit_id'] = this.unitId;
    data['sub_directory_id'] = this.subDirectoryId;
    data['custom_order'] = this.customOrder;
    return data;
  }
}


/*
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
*/