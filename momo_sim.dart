// Student: Iradukunda Gemma
// Reg no: 27844
const String regNo = '27844';
final int  = int.parse(regNo[regNo.length - 1]);
final int  = int.parse(regNo.substring(regNo.length - 2));

// by IG
int momoFee(int amount) {
  // by IG
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by IG
String formatRwf(int amount) {
  // by IG
  String sign = '';
  if (amount < 0) {
    sign = '-';
    amount = amount.abs();
  }
  String s = amount.toString();
  String result = '';
  int count = 0;
  int i = s.length - 1;
  while (i >= 0) {
    result = s[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ',' + result;
    }
    i--;
  }
  return sign + result + ' RWF';
}

// by IG
bool isValidPin(String pin) {
  // by IG
  if (pin.length != 5) return false;
  if (pin == '12345') return false;
  
  // check if all characters are digits and if all same digit
  bool allDigits = true;
  bool allSame = true;
  int i = 0;
  while (i < pin.length) {
    if (pin[i].compareTo('0') < 0 || pin[i].compareTo('9') > 0) {
      allDigits = false;
    }
    if (pin[i] != pin[0]) {
      allSame = false;
    }
    i++;
  }
  if (!allDigits || allSame) return false;
  return true;
}

// by IG
int sendMoney(int balance, int amount) {
  // by IG
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - (amount + fee);
  print('Sent  (fee ). New balance: ');
  return newBalance;
}

// by IG
int buyAirtime(int balance, int amount) {
  // by IG
  if (amount < 100 || amount > 50000 || amount > balance) {
    print('Failed: invalid airtime amount or insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime . New balance: ');
  return newBalance;
}

void main() {
  print('Reg no: \ | D=\ | T=\');

  // Part F main requirement 1
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821\'));
  print(isValidPin('48a21'));
  print(isValidPin('4821D'));

  // Part F main requirement 2
  int balance = 20000 + \ * 500;
  print('Starting balance: ');

  // Part F main requirement 3
  int sendAmount = (\ + 1) * 3000;
  int c = 0;
  while (c < 3) {
    balance = sendMoney(balance, sendAmount);
    c++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // Part F main requirement 4
  print('Final balance: ');

  // Part F main requirement 5: Test calls with comments
  // formatRwf tests
  // print(formatRwf(999999)); // Expected: 999,999 RWF
  // print(formatRwf(1000));   // Expected: 1,000 RWF
  // print(formatRwf(-5000));  // Expected: -5,000 RWF
  // isValidPin tests
  // print(isValidPin('48219')); // Expected: true
  // print(isValidPin('1234'));  // Expected: false (wrong length)
}
