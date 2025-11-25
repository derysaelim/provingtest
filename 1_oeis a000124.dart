import 'dart:io';

void main() {
  while (true) { // Perulangan
    stdout.write("Input: ");
    String? input = stdin.readLineSync();

    // Validasi input harus angka
    if (input != null && int.tryParse(input) != null) {
      int n = int.parse(input);

      List<int> result = generateA000124(n);

      print("Output: ${result.join('-')}\n");
    } else {
      print("Masukkan angka yang valid!\n");
    }
  }
}

// Fungsi menghitung deret OEIS A000124
List<int> generateA000124(int count) {
  if (count <= 0) return [];
  return List<int>.generate(count, (i) => (i * (i + 1) ~/ 2) + 1);
}