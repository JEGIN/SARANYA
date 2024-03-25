class RoleModel {
  bool? status;
  String? message;
  List<Data>? data;

  RoleModel({this.status, this.message, this.data});

  RoleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? roleName;
  String? description;
  bool? active;
  String? roleImage;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.roleName,
      this.description,
      this.active,
      this.roleImage,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleName = json['role_name'];
    description = json['description'];
    active = json['active'];
    roleImage = json['role_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_name'] = this.roleName;
    data['description'] = this.description;
    data['active'] = this.active;
    data['role_image'] = this.roleImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
