import 'package:flutter/material.dart';

class AutocompletespinPage extends StatefulWidget {
  const AutocompletespinPage({super.key});

  @override
  State<AutocompletespinPage> createState() =>
      _AutocompletespinPageState();
}

class _AutocompletespinPageState
    extends State<AutocompletespinPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _universityController =
      TextEditingController();
  final TextEditingController _majorController =
      TextEditingController();

  String? _selectedEducationLevel;
  String? _selectedYear;

  final List<String> _universities = [
    'Universitas Indonesia',
    'Institut Teknologi Bandung',
    'Universitas Gadjah Mada',
    'Universitas Padjadjaran',
    'Universitas Airlangga',
    'Institut Pertanian Bogor',
    'Universitas Brawijaya',
    'Universitas Diponegoro',
    'Universitas Sebelas Maret',
    'Universitas Negeri Jakarta',
    'Universitas Pamulang',
  ];

  final List<String> _majors = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Manajemen',
    'Akuntansi',
    'Hukum',
    'Kedokteran',
    'Psikologi',
    'Desain Komunikasi Visual',
    'Hubungan Internasional',
  ];

  final List<String> _educationLevels = [
    'SMA/Sederajat',
    'D3',
    'S1',
    'S2',
    'S3',
  ];

  final List<String> _years = [
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text(
          "Form dengan AutoComplete dan Spinner",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Card(
          color: const Color(0xFFF5EFFA),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.edit_note,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Informasi Mahasiswa",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Divider(
                    color: Colors.deepPurple.shade200,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),

                  _buildAutocompleteField(
                    label: "Universitas",
                    hint: "Cari universitas...",
                    controller: _universityController,
                    options: _universities,
                    icon: Icons.school,
                  ),

                  const SizedBox(height: 22),

                  _buildAutocompleteField(
                    label: "Jurusan",
                    hint: "Cari jurusan...",
                    controller: _majorController,
                    options: _majors,
                    icon: Icons.book,
                  ),

                  const SizedBox(height: 22),

                  _buildDropdownField(
                    label: "Jenjang Pendidikan",
                    hint: "Pilih jenjang pendidikan",
                    value: _selectedEducationLevel,
                    items: _educationLevels,
                    icon: Icons.trending_up,
                    onChanged: (value) {
                      setState(() {
                        _selectedEducationLevel = value;
                      });
                    },
                  ),

                  const SizedBox(height: 22),

                  _buildDropdownField(
                    label: "Tahun Masuk",
                    hint: "Pilih tahun masuk",
                    value: _selectedYear,
                    items: _years,
                    icon: Icons.calendar_today,
                    onChanged: (value) {
                      setState(() {
                        _selectedYear = value;
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  _buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.deepPurple),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          " *",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAutocompleteField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required List<String> options,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label, icon),
        const SizedBox(height: 8),
        Autocomplete<String>(
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return options.where((option) =>
                option.toLowerCase().contains(
                    textEditingValue.text.toLowerCase()));
          },
          onSelected: (value) {
            controller.text = value;
          },
          fieldViewBuilder:
              (context, textController, focusNode, _) {
            return TextFormField(
              controller: textController,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: hint,
                suffixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? "Wajib diisi" : null,
            );
          },
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required IconData icon,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label, icon),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          hint: Text(hint),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
          items: items
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: onChanged,
          validator: (value) =>
              value == null ? "Wajib dipilih" : null,
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: _submitForm,
        icon: const Icon(Icons.save),
        label: const Text(
          "Simpan Data",
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: const [
              Icon(Icons.check_circle,
                  color: Colors.green, size: 30),
              SizedBox(width: 10),
              Text(
                "Berhasil!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Data mahasiswa berhasil disimpan:"),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color:
                      Colors.deepPurple.withOpacity(0.08),
                  borderRadius:
                      BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    _buildDetailRow(Icons.school,
                        "Universitas",
                        _universityController.text),
                    _buildDetailRow(Icons.book,
                        "Jurusan",
                        _majorController.text),
                    _buildDetailRow(Icons.trending_up,
                        "Jenjang",
                        _selectedEducationLevel!),
                    _buildDetailRow(Icons.calendar_today,
                        "Tahun",
                        _selectedYear!),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _resetForm();
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _buildDetailRow(
      IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon,
              color: Colors.deepPurple, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$label: $value",
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  void _resetForm() {
    setState(() {
      _universityController.clear();
      _majorController.clear();
      _selectedEducationLevel = null;
      _selectedYear = null;
    });
  }

  @override
  void dispose() {
    _universityController.dispose();
    _majorController.dispose();
    super.dispose();
  }
}