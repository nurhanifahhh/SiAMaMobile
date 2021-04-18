part of '../ui/pages/pages.dart';
// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  UserLoginModel({
    this.id,
    this.nim,
    this.nama,
    this.kelas,
    this.jurusan,
    this.alamat,
    this.notelp,
    this.angkatan,
    this.password,
    this.email,
  });

  int id;
  String nim;
  String nama;
  String kelas;
  String jurusan;
  String alamat;
  String notelp;
  String angkatan;
  String password;
  String email;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        id: json["id"],
        nim: json["nim"],
        nama: json["nama"],
        kelas: json["kelas"],
        jurusan: json["jurusan"],
        alamat: json["alamat"],
        notelp: json["notelp"],
        angkatan: json["angkatan"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nim": nim,
        "nama": nama,
        "kelas": kelas,
        "jurusan": jurusan,
        "alamat": alamat,
        "notelp": notelp,
        "angkatan": angkatan,
        "password": password,
        "email": email,
      };
}
