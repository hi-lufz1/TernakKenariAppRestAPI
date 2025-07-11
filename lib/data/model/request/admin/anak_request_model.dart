import 'dart:convert';

class AnakRequestModel {
    final int? id;
    final String? noRing;
    final DateTime? tanggalLahir;
    final String? jenisKelamin;
    final String? jenisKenari;
    final dynamic gambarAnak;
    final String? ayahNoRing;
    final String? ibuNoRing;

    AnakRequestModel({
        this.id,
        this.noRing,
        this.tanggalLahir,
        this.jenisKelamin,
        this.jenisKenari,
        this.gambarAnak,
        this.ayahNoRing,
        this.ibuNoRing,
    });

    AnakRequestModel copyWith({
        int? id,
        String? noRing,
        DateTime? tanggalLahir,
        String? jenisKelamin,
        String? jenisKenari,
        dynamic gambarAnak,
        String? ayahNoRing,
        String? ibuNoRing,
    }) => 
        AnakRequestModel(
            id: id ?? this.id,
            noRing: noRing ?? this.noRing,
            tanggalLahir: tanggalLahir ?? this.tanggalLahir,
            jenisKelamin: jenisKelamin ?? this.jenisKelamin,
            jenisKenari: jenisKenari ?? this.jenisKenari,
            gambarAnak: gambarAnak ?? this.gambarAnak,
            ayahNoRing: ayahNoRing ?? this.ayahNoRing,
            ibuNoRing: ibuNoRing ?? this.ibuNoRing,
        );

    factory AnakRequestModel.fromJson(String str) => AnakRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AnakRequestModel.fromMap(Map<String, dynamic> json) => AnakRequestModel(
        id: json["id"],
        noRing: json["no_ring"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        jenisKenari: json["jenis_kenari"],
        gambarAnak: json["gambar_anak"],
        ayahNoRing: json["ayah_no_ring"],
        ibuNoRing: json["ibu_no_ring"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "no_ring": noRing,
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "jenis_kenari": jenisKenari,
        "gambar_anak": gambarAnak,
        "ayah_no_ring": ayahNoRing,
        "ibu_no_ring": ibuNoRing,
    };
}