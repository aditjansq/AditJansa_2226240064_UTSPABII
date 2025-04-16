class Bmkg {
  final int id;
  final String Tanggal;
  final String Jam;
  final String DateTime;
  final String Coordinates;
  final String Lintang;
  final String Bujur;
  final int Magnitude;
  final String Kedalaman;
  final String Wilayah;
  final String Potensi;
  final String Dirasakan;
  final String Shakemap;

  Bmkg({
    required this.id,
    required this.Tanggal,
    required this.Jam,
    required this.DateTime,
    required this.Coordinates,
    required this.Lintang,
    required this.Bujur,
    required this.Magnitude,
    required this.Kedalaman,
    required this.Wilayah,
    required this.Potensi,
    required this.Dirasakan,
    required this.Shakemap,
  });

  factory Bmkg.fromJson(Map<String, dynamic> json) {
    return Bmkg(
      id: json["id"],
      Tanggal: json["Tanggal"],
      Jam: json["Jam"],
      DateTime: json["DateTime"],
      Coordinates: json["Coordinates"],
      Lintang: json["Lintang"],
      Bujur: json["Bujur"],
      Magnitude: json["Magnitude"],
      Kedalaman: json["Kedalaman"],
      Wilayah: json["Wilayah"],
      Potensi: json["Potensi"],
      Dirasakan: json["Dirasakan"],
      Shakemap: json["Shakemap"],
    );
  }
}
