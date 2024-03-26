class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.withError({this.status, this.message}) {
  
  }

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? dob;
  String? email;
  String? mobileNumber;
  Null? address;
  String? staffRole;
  String? staffRoleId;
  Null? educationQualification;
  String? password;
  String? active;
  String? loginTime;
  String? createdAt;
  String? updatedAt;
  String? token;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.gender,
      this.dob,
      this.email,
      this.mobileNumber,
      this.address,
      this.staffRole,
      this.staffRoleId,
      this.educationQualification,
      this.password,
      this.active,
      this.loginTime,
      this.createdAt,
      this.updatedAt,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    dob = json['dob'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    address = json['address'];
    staffRole = json['staff_role'];
    staffRoleId = json['staff_role_id'];
    educationQualification = json['education_qualification'];
    password = json['password'];
    active = json['active'];
    loginTime = json['login_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['address'] = this.address;
    data['staff_role'] = this.staffRole;
    data['staff_role_id'] = this.staffRoleId;
    data['education_qualification'] = this.educationQualification;
    data['password'] = this.password;
    data['active'] = this.active;
    data['login_time'] = this.loginTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}
