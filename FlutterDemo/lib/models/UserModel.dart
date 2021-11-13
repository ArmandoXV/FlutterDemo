import 'AccountModel.dart';

class User {
  final int _id;
  final String _userName;
  final String _key;
  Account _userAccount;

  User(this._userName, this._id, this._key, {Account userAccount}) {
    _userAccount = userAccount;
  }

  int getUserId() {
    return _id;
  }

  String getUserName() {
    return _userName;
  }

  String getUserKey() {
    return _key;
  }

  Account getUserAccount() {
    return _userAccount;
  }

  void setUserAccount(Account account) {
    _userAccount = account;
  }
}
