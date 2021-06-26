part of '../ui/pages/pages.dart';
// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

AdminModel adminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  AdminModel({
    this.id,
    this.nid,
    this.nama_dosen,
    this.jenismatkul,
    this.password,
  });

  String id;
  String nid;
  String nama_dosen;
  String jenismatkul;
  String password;

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        id: json["id"],
        nid: json["nid"],
        nama_dosen: json["nama_dosen"],
        jenismatkul: json["jenismatkul"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nid": nid,
        "nama_dosen": nama_dosen,
        "jenismatkul": jenismatkul,
        "password": password,
      };
}
