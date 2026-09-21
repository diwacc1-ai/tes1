import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _angka1Controller = TextEditingController();
  final _angka2Controller = TextEditingController();
  final _angka1Focus = FocusNode();
  final _angka2Focus = FocusNode();
  String _hasil = '';

  @override
  void dispose() {
    _angka1Controller.dispose();
    _angka2Controller.dispose();
    _angka1Focus.dispose();
    _angka2Focus.dispose();
    super.dispose();
  }

  void _tambahAngka(String angka) {
    final controller = _angka2Focus.hasFocus
        ? _angka2Controller
        : _angka1Controller;
    controller.text += angka;
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  void _hitung(String operasi) {
    final angka1 = double.tryParse(_angka1Controller.text);
    final angka2 = double.tryParse(_angka2Controller.text);

    if (angka1 == null || angka2 == null) {
      setState(() => _hasil = 'Isi kedua angka terlebih dahulu');
      return;
    }

    double hasil;
    switch (operasi) {
      case '+':
        hasil = angka1 + angka2;
        break;
      case '-':
        hasil = angka1 - angka2;
        break;
      case '%':
        hasil = angka1 % angka2;
        break;
      default:
        hasil = angka1 * angka2;
    }

    setState(() {
      _hasil = hasil % 1 == 0 ? hasil.toInt().toString() : hasil.toString();
    });
  }

  Widget _tombol(String teks, {VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onPressed ?? () => _tambahAngka(teks),
          child: Text(teks, style: const TextStyle(fontSize: 22)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Sederhana')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _angka1Controller,
                focusNode: _angka1Focus,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Angka 1',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _angka2Controller,
                focusNode: _angka2Focus,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Angka 2',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _hasil.isEmpty ? 'Hasil: -' : 'Hasil: $_hasil',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(children: [_tombol('1'), _tombol('2'), _tombol('3')]),
              Row(children: [_tombol('4'), _tombol('5'), _tombol('6')]),
              Row(children: [_tombol('7'), _tombol('8'), _tombol('9')]),
              Row(children: [_tombol('0')]),
              Row(
                children: [
                  _tombol('+', onPressed: () => _hitung('+')),
                  _tombol('-', onPressed: () => _hitung('-')),
                  _tombol('%', onPressed: () => _hitung('%')),
                  _tombol('x', onPressed: () => _hitung('x')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
