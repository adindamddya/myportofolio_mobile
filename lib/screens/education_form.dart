import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

/// Halaman formulir untuk menambahkan data riwayat edukasi portofolio baru.
/// Menggunakan [StatefulWidget], [Form], dan [GlobalKey<FormState>] untuk validasi.
class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  // State variabel penampung nilai input formulir
  String _school = "";
  String _degree = "";
  String _fieldOfStudy = "";
  String _startYear = "";
  String _endYear = "";

  /// Mengosongkan seluruh isian formulir
  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _school = "";
      _degree = "";
      _fieldOfStudy = "";
      _startYear = "";
      _endYear = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Tambah Edukasi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Isi detail riwayat pendidikan Anda di bawah ini:",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),

              // Field 1: Nama Institusi / Sekolah
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.school_outlined),
                    hintText: "Contoh: Universitas Indonesia",
                    labelText: "Nama Institusi / Sekolah *",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  maxLength: 255,
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.workspace_premium_outlined),
                    hintText: "Contoh: Sarjana (S1), Diploma (D3), SMA",
                    labelText: "Jenjang / Gelar *",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
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

              // Field 3: Bidang Studi / Program Studi
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.menu_book_outlined),
                    hintText: "Contoh: Sistem Informasi, Ilmu Komputer",
                    labelText: "Bidang Studi / Program Studi *",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_today_outlined),
                    hintText: "Contoh: 2023",
                    labelText: "Tahun Mulai *",
                    helperText: "Format 4 digit tahun (1900 - 2100)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
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
                      return "Tahun mulai harus berupa angka bulat!";
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.event_available_outlined),
                    hintText: "Contoh: 2027",
                    labelText: "Tahun Selesai (Opsional)",
                    helperText: "Kosongkan jika pendidikan masih berlangsung",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
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
                        return "Tahun selesai harus berupa angka bulat!";
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

              const SizedBox(height: 16.0),

              // Baris Tombol Simpan dan Reset
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: const Text("Reset"),
                    onPressed: _resetForm,
                  ),
                  const SizedBox(width: 12.0),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 12.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    icon: const Icon(Icons.save),
                    label: const Text(
                      "Simpan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.green),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'Edukasi Tersimpan',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ],
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    _buildSummaryRow(
                                      Icons.school,
                                      'Institusi',
                                      _school.trim(),
                                    ),
                                    _buildSummaryRow(
                                      Icons.workspace_premium,
                                      'Jenjang',
                                      _degree.trim(),
                                    ),
                                    _buildSummaryRow(
                                      Icons.menu_book,
                                      'Bidang Studi',
                                      _fieldOfStudy.trim(),
                                    ),
                                    _buildSummaryRow(
                                      Icons.calendar_today,
                                      'Tahun Mulai',
                                      _startYear.trim(),
                                    ),
                                    _buildSummaryRow(
                                      Icons.event_available,
                                      'Tahun Selesai',
                                      _endYear.trim().isEmpty
                                          ? "Masih Berlangsung"
                                          : _endYear.trim(),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _resetForm();
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Data edukasi berhasil disimpan ke portofolio!",
                                          ),
                                          backgroundColor: Colors.green,
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper untuk membangun baris ringkasan data di dalam dialog
  Widget _buildSummaryRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18.0, color: Colors.indigo),
          const SizedBox(width: 8.0),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, fontSize: 13.5),
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
