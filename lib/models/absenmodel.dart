part of '../ui/pages/pages.dart';

AbsensiModel absensiModelFromJson(String str) =>
    AbsensiModel.fromJson(json.decode(str));

String absensiModelToJson(AbsensiModel data) => json.encode(data.toJson());

class AbsensiModel {
  AbsensiModel({
    this.idabsen,
    this.iduser,
    this.idmatkul,
    this.keterangan,
  });

  String idabsen;
  String iduser;
  String idmatkul;
  String keterangan;

  factory AbsensiModel.fromJson(Map<String, dynamic> json) => AbsensiModel(
        idabsen: json["idabsen"],
        iduser: json["iduser"],
        idmatkul: json["idmatkul"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "idabsen": idabsen,
        "iduser": iduser,
        "idmatkul": idmatkul,
        "keterangan": keterangan,
      };
}
