part of '../ui/pages/pages.dart';
// To parse this JSON data, do
//
//     final CourseModel = CourseModelFromJson(jsonString);

CourseModel CourseModelFromJson(String str) =>
    CourseModel.fromJson(json.decode(str));

String CourseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  CourseModel({
    this.id_matakuliah,
    this.nama_matakuliah,
    this.id_jadwalkuliah,
    this.hari,
    this.tanggal,
    this.waktu,
    this.dosen_pengajar,
  });

  String id_matakuliah;
  String nama_matakuliah;
  String id_jadwalkuliah;
  String hari;
  String tanggal;
  String waktu;
  String dosen_pengajar;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id_matakuliah: json["id_matakuliah"],
        nama_matakuliah: json["nama_matakuliah"],
        id_jadwalkuliah: json["id_jadwalkuliah"],
        hari: json["hari"],
        tanggal: json["tanggal"],
        waktu: json["waktu"],
        dosen_pengajar: json["dosen_pengajar"],
      );

  Map<String, dynamic> toJson() => {
        "id_matakuliah": id_matakuliah,
        "nama_matakuliah": nama_matakuliah,
        "id_jadwalkuliah": id_jadwalkuliah,
        "hari": hari,
        "tanggal": tanggal,
        "waktu": waktu,
        "dosen_pengajar": dosen_pengajar,
      };
}
