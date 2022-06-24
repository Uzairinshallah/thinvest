// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int?,
      firstName: fields[1] as String?,
      middleName: fields[2] as String?,
      lastName: fields[3] as String?,
      dateOfBirth: fields[4] as String?,
      address: fields[5] as String?,
      zipcode: fields[6] as String?,
      city: fields[7] as String?,
      phone: fields[8] as String?,
      phoneMobile: fields[9] as String?,
      country: fields[10] as String?,
      email: fields[11] as String?,
      identificationType: fields[12] as String?,
      identificationNumber: fields[13] as String?,
      password: fields[14] as String?,
      demo: fields[15] as int?,
      activationToken: fields[16] as dynamic,
      emailVerifiedAt: fields[17] as dynamic,
      lastLogin: fields[18] as String?,
      status: fields[19] as int?,
      lang: fields[20] as String?,
      rememberToken: fields[21] as String?,
      createdAt: fields[22] as String?,
      updatedAt: fields[23] as String?,
      apiToken: fields[24] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.middleName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.dateOfBirth)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.zipcode)
      ..writeByte(7)
      ..write(obj.city)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.phoneMobile)
      ..writeByte(10)
      ..write(obj.country)
      ..writeByte(11)
      ..write(obj.email)
      ..writeByte(12)
      ..write(obj.identificationType)
      ..writeByte(13)
      ..write(obj.identificationNumber)
      ..writeByte(14)
      ..write(obj.password)
      ..writeByte(15)
      ..write(obj.demo)
      ..writeByte(16)
      ..write(obj.activationToken)
      ..writeByte(17)
      ..write(obj.emailVerifiedAt)
      ..writeByte(18)
      ..write(obj.lastLogin)
      ..writeByte(19)
      ..write(obj.status)
      ..writeByte(20)
      ..write(obj.lang)
      ..writeByte(21)
      ..write(obj.rememberToken)
      ..writeByte(22)
      ..write(obj.createdAt)
      ..writeByte(23)
      ..write(obj.updatedAt)
      ..writeByte(24)
      ..write(obj.apiToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
