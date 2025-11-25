void main() {
  // Data papan skor pemain
  List<int> scores = [100, 100, 50, 40, 40, 20, 10];

  // Inisiasi data skor pemain
  List<int> gitsScores = [5, 25, 50, 120];
  List<int> antonScores = [20, 40, 50, 120];
  List<int> budiScores = [10, 20, 40, 50];

  // Menghitung ranking pemain
  List<int> resultGits = denseRanking(scores, gitsScores);
  List<int> resultAnton = denseRanking(scores, antonScores);
  List<int> resultBudi = denseRanking(scores, budiScores);

  // Hasil ranking pemain
  print("Ranking Gits: ${resultGits.join(' ')}");
  print("Ranking Anton: ${resultAnton.join(' ')}");
  print("Ranking Budi: ${resultBudi.join(' ')}");
}

// Fungsi menentukan ranking
List<int> denseRanking(List<int> scores, List<int> playerScores) {
  // Menghapus duplikat skor di papan skor
  List<int> distinctScores = scores.toSet().toList();

  // Deklarasi ranking
  List<int> rankings = [];

  // Indeks terbawah
  int i = distinctScores.length - 1;

  for (int skor in playerScores) {
    while (i >= 0 && skor > distinctScores[i]) {
      i--;
    }
    // Menentukan ranking
    if (i < 0) {
      rankings.add(1);    // Skor tertinggi
    } else if (skor == distinctScores[i]) {
      rankings.add(i+1);  // Skor sama
    } else {
      rankings.add(i+2);  // Skor dibawah
    }
  }

  return rankings;
}