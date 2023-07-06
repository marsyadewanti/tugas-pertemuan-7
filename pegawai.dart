class Pegawai {
  String? id;
  String namaPegawai;
  String posisiPegawai;

  Pegawai({
    this.id,
    required this.namaPegawai,
    required this.posisiPegawai,
  });

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
      id: json["id"],
      namaPegawai: json["nama_pegawai"],
      posisiPegawai: json["posisi_pegawai"]);

  Map<String, dynamic> toJson() => {
        "nama_pegawai": namaPegawai,
        "posisi_pegawai": posisiPegawai,
      };
}
