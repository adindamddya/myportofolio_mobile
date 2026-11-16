import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _school = "";
  String _degree = "";
  String _fieldOfStudy = "";
  String _startYear = "";
  String _endYear = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Edukasi',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Field 1: Nama Institusi / Sekolah
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Universitas Indonesia",
                    labelText: "Nama Institusi / Sekolah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _school = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama institusi tidak boleh kosong!";
                    }
                    if (value.trim().length > 255) {
                      return "Nama institusi maksimal 255 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // Field 2: Jenjang / Gelar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Sarjana (S1), Diploma (D3)",
                    labelText: "Jenjang / Gelar",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _degree = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Jenjang pendidikan tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // Field 3: Bidang Studi / Jurusan
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Sistem Informasi",
                    labelText: "Bidang Studi / Jurusan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _fieldOfStudy = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Bidang studi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // Field 4: Tahun Mulai
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: 2023",
                    labelText: "Tahun Mulai",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _startYear = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Tahun mulai tidak boleh kosong!";
                    }
                    final parsed = int.tryParse(value.trim());
                    if (parsed == null) {
                      return "Tahun mulai harus berupa angka!";
                    }
                    if (parsed < 1900 || parsed > 2100) {
                      return "Tahun mulai harus antara 1900 dan 2100!";
                    }
                    return null;
                  },
                ),
              ),

              // Field 5: Tahun Selesai (Opsional)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: 2027 (kosongkan jika masih berlangsung)",
                    labelText: "Tahun Selesai (Opsional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _endYear = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value != null && value.trim().isNotEmpty) {
                      final parsedEnd = int.tryParse(value.trim());
                      if (parsedEnd == null) {
                        return "Tahun selesai harus berupa angka!";
                      }
                      if (parsedEnd < 1900 || parsedEnd > 2100) {
                        return "Tahun selesai harus antara 1900 dan 2100!";
                      }
                      final parsedStart = int.tryParse(_startYear.trim());
                      if (parsedStart != null && parsedEnd < parsedStart) {
                        return "Tahun selesai tidak boleh mendahului tahun mulai!";
                      }
                    }
                    return null;
                  },
                ),
              ),

              // Tombol Simpan
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Edukasi Berhasil Tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Institusi: $_school'),
                                    Text('Jenjang: $_degree'),
                                    Text('Bidang Studi: $_fieldOfStudy'),
                                    Text('Tahun Mulai: $_startYear'),
                                    Text(
                                      'Tahun Selesai: ${_endYear.trim().isEmpty ? "Masih Berlangsung" : _endYear.trim()}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _school = "";
                                      _degree = "";
                                      _fieldOfStudy = "";
                                      _startYear = "";
                                      _endYear = "";
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

