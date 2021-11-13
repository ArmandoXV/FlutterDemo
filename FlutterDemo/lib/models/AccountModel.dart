class Account {
  final String _key;
  final int _balance;

  Account(this._key, this._balance);

  String getKey() {
    return _key;
  }

  int getBalance() {
    return _balance;
  }

  int convertToUSD() {
    return _balance;
  }
}
