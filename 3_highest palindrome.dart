void main() {
  // Sampel ke-1
  String s1 = "3943";
  int k1 = 1;
  String result1 = highestPalindrome(s1, k1);
  print("Sampel 1");
  print("string: $s1");
  print("k: $k1");
  print("Output: $result1\n");

  // Sampel ke-2
  String s2 = "932239";
  int k2 = 2;
  String result2 = highestPalindrome(s2, k2);
  print("Sampel 2");
  print("string: $s2");
  print("k: $k2");
  print("Output: $result2\n");

  // Sampel ke-3
  String s3 = "42724";
  int k3 = 1;
  String result3 = highestPalindrome(s3, k3);
  print("Sampel 3");
  print("string: $s3");
  print("k: $k3");
  print("Output: $result3");
}

// Fungsi menghasilkan Highest Palindrome
String highestPalindrome(String s, int k) {
  List<String> chars = s.split("");

  // Membuat Palindrome minimal dahulu
  List<String>? minPal = makePalindrome(chars, 0, chars.length - 1, k);

  // Jika tidak bisa menjadi Palindrome
  if (minPal == null) {
    return "-1";
  }

  // Maksimalkan Palindrome hingga 9
  List<String> maxPal = maximizePalindrome(minPal, 0, minPal.length - 1, k);

  return maxPal.join("");
}

// Membentuk palindrome minimal dengan perubahan maksimum k
List<String>? makePalindrome(List<String> s, int left, int right, int k) {
  if (left >= right) return s;

  if (s[left] == s[right]) {
    return makePalindrome(s, left + 1, right - 1, k);
  }

  if (k <= 0) return null;

  // Samakan kedua digit dengan memilih digit terbesar
  String maxDigit = int.parse(s[left]) > int.parse(s[right]) ? s[left] : s[right];

  s[left] = maxDigit;
  s[right] = maxDigit;

  return makePalindrome(s, left + 1, right - 1, k - 1);
}

// memaksimalkan Palindrome menjadi 9
List<String> maximizePalindrome(List<String> s, int left, int right, int k) {
  if (left > right || k <= 0) return s;

  // Jika di tengah jadikan 9
  if (left == right) {
    if (k > 0) s[left] = "9";
    return s;
  }

  // Jika kiri-kanan bukan 9, tingkatkan menjadi 9
  if (s[left] != "9") {
    if (k >= 2) {
      s[left] = "9";
      s[right] = "9";
      return maximizePalindrome(s, left + 1, right - 1, k - 2);
    }
  }

  return maximizePalindrome(s, left + 1, right - 1, k);
}