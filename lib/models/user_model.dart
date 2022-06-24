
import 'package:hive/hive.dart';


part 'user_model.g.dart';
@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? middleName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? dateOfBirth;
  @HiveField(5)
  String? address;
  @HiveField(6)
  String? zipcode;
  @HiveField(7)
  String? city;
  @HiveField(8)
  String? phone;
  @HiveField(9)
  String? phoneMobile;
  @HiveField(10)
  String? country;
  @HiveField(11)
  String? email;
  @HiveField(12)
  String? identificationType;
  @HiveField(13)
  String? identificationNumber;
  @HiveField(14)
  String? password;
  @HiveField(15)
  int? demo;
  @HiveField(16)
  dynamic activationToken;
  @HiveField(17)
  dynamic emailVerifiedAt;
  @HiveField(18)
  String? lastLogin;
  @HiveField(19)
  int? status;
  @HiveField(20)
  String? lang;
  @HiveField(21)
  String? rememberToken;
  @HiveField(22)
  String? createdAt;
  @HiveField(23)
  String? updatedAt;
  @HiveField(24)
  String? apiToken;

  UserModel(
      {this.id,
        this.firstName,
        this.middleName,
        this.lastName,
        this.dateOfBirth,
        this.address,
        this.zipcode,
        this.city,
        this.phone,
        this.phoneMobile,
        this.country,
        this.email,
        this.identificationType,
        this.identificationNumber,
        this.password,
        this.demo,
        this.activationToken,
        this.emailVerifiedAt,
        this.lastLogin,
        this.status,
        this.lang,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.apiToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    address = json['address'];
    zipcode = json['zipcode'];
    city = json['city'];
    phone = json['phone'];
    phoneMobile = json['phone_mobile'];
    country = json['country'];
    email = json['email'];
    identificationType = json['identification_type'];
    identificationNumber = json['identification_number'];
    password = json['password'];
    demo = json['demo'];
    activationToken = json['activation_token'];
    emailVerifiedAt = json['email_verified_at'];
    lastLogin = json['last_login'];
    status = json['status'];
    lang = json['lang'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['address'] = this.address;
    data['zipcode'] = this.zipcode;
    data['city'] = this.city;
    data['phone'] = this.phone;
    data['phone_mobile'] = this.phoneMobile;
    data['country'] = this.country;
    data['email'] = this.email;
    data['identification_type'] = this.identificationType;
    data['identification_number'] = this.identificationNumber;
    data['password'] = this.password;
    data['demo'] = this.demo;
    data['activation_token'] = this.activationToken;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['last_login'] = this.lastLogin;
    data['status'] = this.status;
    data['lang'] = this.lang;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['api_token'] = this.apiToken;
    return data;
  }
}