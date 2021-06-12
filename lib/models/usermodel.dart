part of '../ui/pages/pages.dart';
// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

List userModelFromJson(String str) =>
    List.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List data) =>
    json.encode(List.from(data.map((x) => x.toJson())));

class UserModel {
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

  UserModel({
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

  factory UserModel.fromJson(Map json) => UserModel(
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

  Map toJson() => {
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
