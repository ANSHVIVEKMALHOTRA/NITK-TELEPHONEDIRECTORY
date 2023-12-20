class facultyindividual {
  int? id;
  String? name;
  String? email;
  String? siteName;
  String? joiningDate;
  String? createdAt;
  String? updatedAt;
  int? departmentId;
  int? mobile1;
  int? mobile2;
  int? landlineOffice;
  int? landlineResidential;
  int? landlineOfficeIntercom;
  int? landlineOfficeDirect;
  int? designationId;
  int? position1Id;
  int? position2Id;

  facultyindividual(
      {this.id,
      this.name,
      this.email,
      this.siteName,
      this.joiningDate,
      this.createdAt,
      this.updatedAt,
      this.departmentId,
      this.mobile1,
      this.mobile2,
      this.landlineOffice,
      this.landlineResidential,
      this.landlineOfficeIntercom,
      this.landlineOfficeDirect,
      this.designationId,
      this.position1Id,
      this.position2Id});

  facultyindividual.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    siteName = json['site_name'];
    joiningDate = json['joining_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    departmentId = json['department_id'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    landlineOffice = json['landline_office'];
    landlineResidential = json['landline_residential'];
    landlineOfficeIntercom = json['landline_office_intercom'];
    landlineOfficeDirect = json['landline_office_direct'];
    designationId = json['designation_id'];
    position1Id = json['position1_id'];
    position2Id = json['position2_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['site_name'] = siteName;
    data['joining_date'] = joiningDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['department_id'] = departmentId;
    data['mobile1'] = mobile1;
    data['mobile2'] = mobile2;
    data['landline_office'] = landlineOffice;
    data['landline_residential'] = landlineResidential;
    data['landline_office_intercom'] = landlineOfficeIntercom;
    data['landline_office_direct'] = landlineOfficeDirect;
    data['designation_id'] = designationId;
    data['position1_id'] = position1Id;
    data['position2_id'] = position2Id;
    return data;
  }
}
