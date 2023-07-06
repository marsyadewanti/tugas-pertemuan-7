import 'package:flutter/material.dart';
import '../../model/pegawai.dart';
import '../../service/pegawai_service.dart';
import 'pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({Key? key}) : super(key: key);
  _PegawaiFormState createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPegawaiCtrl = TextEditingController();
  final _posisiPegawaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPegawai(),
              _fieldPosisiPegawai(),
              const SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldPosisiPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
      controller: _posisiPegawaiCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Pegawai pegawai = Pegawai(
          namaPegawai: _namaPegawaiCtrl.text,
          posisiPegawai: _posisiPegawaiCtrl.text,
        );
        await PegawaiService().simpan(pegawai).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PegawaiDetail(pegawai: value)),
          );
        });
      },
      child: const Text("Simpan"),
    );
  }
}
