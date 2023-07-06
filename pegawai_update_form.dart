import 'package:flutter/material.dart';
import '../../model/pegawai.dart';
import '../../service/pegawai_service.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPegawaiCtrl = TextEditingController();
  final _posisiPegawaiCtrl = TextEditingController();

  Future<Pegawai> getData() async {
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    setState(() {
      _namaPegawaiCtrl.text = data.namaPegawai;
      _posisiPegawaiCtrl.text = data.posisiPegawai;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
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
      decoration: const InputDecoration(labelText: "Posisi Pegawai"),
      controller: _posisiPegawaiCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Pegawai pegawai = Pegawai(
            namaPegawai: _namaPegawaiCtrl.text,
            posisiPegawai: _posisiPegawaiCtrl.text);
        String id = widget.pegawai.id.toString();
        await PegawaiService().ubah(pegawai, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PegawaiDetail(pegawai: value),
            ),
          );
        });
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
