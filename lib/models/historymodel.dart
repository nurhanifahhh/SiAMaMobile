part of '../ui/pages/pages.dart';

HistoryModel historyModelFromJson(String str) => HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
    HistoryModel({
        this.idAbsen,
        this.iduser,
        this.id,
        this.nim,
        this.idMatakuliah,
        this.namaMatakuliah,
        this.keterangan,
        this.tanggal,
    });

    String idAbsen;
    String iduser;
    String id;
    String nim;
    String idMatakuliah;
    String namaMatakuliah;
    String keterangan;
    DateTime tanggal;

    factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        idAbsen: json["id_absen"],
        iduser: json["iduser"],
        id: json["id"],
        nim: json["nim"],
        idMatakuliah: json["id_matakuliah"],
        namaMatakuliah: json["nama_matakuliah"],
        keterangan: json["keterangan"],
        tanggal: DateTime.parse(json["tanggal"]),
    );

    Map<String, dynamic> toJson() => {
        "id_absen": idAbsen,
        "iduser": iduser,
        "id": id,
        "nim": nim,
        "id_matakuliah": idMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "keterangan": keterangan,
        "tanggal": tanggal==null ? null : tanggal.toIso8601String(),
    };
}
