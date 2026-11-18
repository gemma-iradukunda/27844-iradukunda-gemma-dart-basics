// Student: Iradukunda Gemma
// Reg no: 27844
const String regNo = '27844';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by IG
  int count = 0;
  String vowels = 'aeiouAEIOU';
  int i = 0;
  while (i < text.length) {
    if (vowels.contains(text[i])) {
      count++;
    }
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by IG
  fullName = fullName.trim();
  if (fullName.isEmpty) return '';
  List<String> parts = fullName.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      result += '${parts[i][0].toUpperCase()}.';
    }
    i++;
  }
  return result;
}

void drawTriangle(int height) {
  // by IG
  if (height <= 0) return;
  int i = 1;
  while (i <= height) {
    String char = (i % 2 != 0) ? '*' : '#';
    String spaces = '';
    int spaceCount = height - i;
    int s = 0;
    while (s < spaceCount) {
      spaces += ' ';
      s++;
    }
    String symbols = '';
    int symCount = i;
    int c = 0;
    while (c < symCount) {
      symbols += char;
      c++;
    }
    print('$spaces$symbols');
    i++;
  }
}

int momoFee(int amount) {
  // by IG
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by IG
  if (phone.length != 10) return 'INVALID';
  return phone.substring(0, 3) + '*****' + phone.substring(8);
}

void main() {
  print('Reg no: $regNo | D=$d | T=$t');

  // B2 test
  String myName = 'Iradukunda Gemma';
  print('$myName has ${countVowels(myName)} vowels');

  // B3 test
  print(initials('Iradukunda Gemma'));
  print(initials('ana uwase'));
  print(initials('   '));

  // C5 test (height = D + 3 = 7)
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(2);

  // D2 MoMo receipt loop
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    String phone = maskPhone('0788123456');
    print('Receipt $i $amount RWF | fee $fee RWF | to $phone');
    i++;
  }
  print('Total fees: $totalFees RWF.');
}
