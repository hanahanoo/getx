// To parse this JSON data, do
//
//     final bacaModel = bacaModelFromJson(jsonString);

import 'dart:convert';

List<BacaModel> bacaModelFromJson(String str) => List<BacaModel>.from(json.decode(str).map((x) => BacaModel.fromJson(x)));

String bacaModelToJson(List<BacaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BacaModel {
    String? arti;
    String? asma;
    int? ayat;
    String? nama;
    Type? type;
    String? urut;
    String? audio;
    String? nomor;
    String? rukuk;
    String? keterangan;

    BacaModel({
        this.arti,
        this.asma,
        this.ayat,
        this.nama,
        this.type,
        this.urut,
        this.audio,
        this.nomor,
        this.rukuk,
        this.keterangan,
    });

    factory BacaModel.fromJson(Map<String, dynamic> json) => BacaModel(
        arti: json["arti"],
        asma: json["asma"],
        ayat: json["ayat"],
        nama: json["nama"],
        type: typeValues.map[json["type"]]!,
        urut: json["urut"],
        audio: json["audio"],
        nomor: json["nomor"],
        rukuk: json["rukuk"],
        keterangan: json["keterangan"],
    );

    Map<String, dynamic> toJson() => {
        "arti": arti,
        "asma": asma,
        "ayat": ayat,
        "nama": nama,
        "type": typeValues.reverse[type],
        "urut": urut,
        "audio": audio,
        "nomor": nomor,
        "rukuk": rukuk,
        "keterangan": keterangan,
    };
}

enum Type {
    MADINAH,
    MEKAH
}

final typeValues = EnumValues({
    "madinah": Type.MADINAH,
    "mekah": Type.MEKAH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}