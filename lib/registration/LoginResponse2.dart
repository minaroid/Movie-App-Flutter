class LoginResponse2 {
  String _accessToken;
  Branch _branch;
  String _createTime;
  String _errorMessage;
  String _iD;
  List<String> _roles;
  int _status;
  bool _success;
  User _user;
  String _claims;
  int _currentBalance;
  bool _isPOR;
  bool _isPrimary;
  Party _party;
  int _type;

  LoginResponse2(
      {String accessToken,
      Branch branch,
      String createTime,
      String errorMessage,
      String iD,
      List<String> roles,
      int status,
      bool success,
      User user,
      String claims,
      int currentBalance,
      bool isPOR,
      bool isPrimary,
      Party party,
      int type}) {
    this._accessToken = accessToken;
    this._branch = branch;
    this._createTime = createTime;
    this._errorMessage = errorMessage;
    this._iD = iD;
    this._roles = roles;
    this._status = status;
    this._success = success;
    this._user = user;
    this._claims = claims;
    this._currentBalance = currentBalance;
    this._isPOR = isPOR;
    this._isPrimary = isPrimary;
    this._party = party;
    this._type = type;
  }

  String get accessToken => _accessToken;

  set accessToken(String accessToken) => _accessToken = accessToken;

  Branch get branch => _branch;

  set branch(Branch branch) => _branch = branch;

  String get createTime => _createTime;

  set createTime(String createTime) => _createTime = createTime;

  String get errorMessage => _errorMessage;

  set errorMessage(Null errorMessage) => _errorMessage = errorMessage;

  String get iD => _iD;

  set iD(String iD) => _iD = iD;

  List<String> get roles => _roles;

  set roles(List<String> roles) => _roles = roles;

  int get status => _status;

  set status(int status) => _status = status;

  bool get success => _success;

  set success(bool success) => _success = success;

  User get user => _user;

  set user(User user) => _user = user;

  String get claims => _claims;

  set claims(String claims) => _claims = claims;

  int get currentBalance => _currentBalance;

  set currentBalance(int currentBalance) => _currentBalance = currentBalance;

  bool get isPOR => _isPOR;

  set isPOR(bool isPOR) => _isPOR = isPOR;

  bool get isPrimary => _isPrimary;

  set isPrimary(bool isPrimary) => _isPrimary = isPrimary;

  Party get party => _party;

  set party(Party party) => _party = party;

  int get type => _type;

  set type(int type) => _type = type;

  LoginResponse2.fromJson(Map<String, dynamic> json) {
    _accessToken = json['AccessToken'];
    _branch =
        json['Branch'] != null ? new Branch.fromJson(json['Branch']) : null;
    _createTime = json['CreateTime'];
    _errorMessage = json['ErrorMessage'];
    _iD = json['ID'];
    _roles = json['Roles'] != null ? json['Roles'].cast<String>() : null;
    _status = json['Status'];
    _success = json['Success'];
    _user = json['User'] != null ? new User.fromJson(json['User']) : null;
    _claims = json['Claims'];
    _currentBalance = json['CurrentBalance'];
    _isPOR = json['IsPOR'];
    _isPrimary = json['IsPrimary'];
    _party = json['Party'] != null ? new Party.fromJson(json['Party']) : null;
    _type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccessToken'] = this._accessToken;
    if (this._branch != null) {
      data['Branch'] = this._branch.toJson();
    }
    data['CreateTime'] = this._createTime;
    data['ErrorMessage'] = this._errorMessage;
    data['ID'] = this._iD;
    data['Roles'] = this._roles;
    data['Status'] = this._status;
    data['Success'] = this._success;
    if (this._user != null) {
      data['User'] = this._user.toJson();
    }
    data['Claims'] = this._claims;
    data['CurrentBalance'] = this._currentBalance;
    data['IsPOR'] = this._isPOR;
    data['IsPrimary'] = this._isPrimary;
    if (this._party != null) {
      data['Party'] = this._party.toJson();
    }
    data['Type'] = this._type;
    return data;
  }
}

class Branch {
  Null _englishName;
  Null _fax;
  int _iD;
  String _name;
  Null _phone;

  Branch({Null englishName, Null fax, int iD, String name, Null phone}) {
    this._englishName = englishName;
    this._fax = fax;
    this._iD = iD;
    this._name = name;
    this._phone = phone;
  }

  Null get englishName => _englishName;

  set englishName(Null englishName) => _englishName = englishName;

  Null get fax => _fax;

  set fax(Null fax) => _fax = fax;

  int get iD => _iD;

  set iD(int iD) => _iD = iD;

  String get name => _name;

  set name(String name) => _name = name;

  Null get phone => _phone;

  set phone(Null phone) => _phone = phone;

  Branch.fromJson(Map<String, dynamic> json) {
    _englishName = json['EnglishName'];
    _fax = json['Fax'];
    _iD = json['ID'];
    _name = json['Name'];
    _phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EnglishName'] = this._englishName;
    data['Fax'] = this._fax;
    data['ID'] = this._iD;
    data['Name'] = this._name;
    data['Phone'] = this._phone;
    return data;
  }
}

class User {
  int _iD;
  String _name;

  User({int iD, String name}) {
    this._iD = iD;
    this._name = name;
  }

  int get iD => _iD;

  set iD(int iD) => _iD = iD;

  String get name => _name;

  set name(String name) => _name = name;

  User.fromJson(Map<String, dynamic> json) {
    _iD = json['ID'];
    _name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this._iD;
    data['Name'] = this._name;
    return data;
  }
}

class Party {
  int _accountID;
  String _address;
  String _email;
  int _iD;
  String _name;
  int _number;
  String _phoneNumber;
  int _status;

  Party(
      {int accountID,
      String address,
      String email,
      int iD,
      String name,
      int number,
      String phoneNumber,
      int status}) {
    this._accountID = accountID;
    this._address = address;
    this._email = email;
    this._iD = iD;
    this._name = name;
    this._number = number;
    this._phoneNumber = phoneNumber;
    this._status = status;
  }

  int get accountID => _accountID;

  set accountID(int accountID) => _accountID = accountID;

  String get address => _address;

  set address(String address) => _address = address;

  String get email => _email;

  set email(String email) => _email = email;

  int get iD => _iD;

  set iD(int iD) => _iD = iD;

  String get name => _name;

  set name(String name) => _name = name;

  int get number => _number;

  set number(int number) => _number = number;

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;

  int get status => _status;

  set status(int status) => _status = status;

  Party.fromJson(Map<String, dynamic> json) {
    _accountID = json['AccountID'];
    _address = json['Address'];
    _email = json['Email'];
    _iD = json['ID'];
    _name = json['Name'];
    _number = json['Number'];
    _phoneNumber = json['PhoneNumber'];
    _status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountID'] = this._accountID;
    data['Address'] = this._address;
    data['Email'] = this._email;
    data['ID'] = this._iD;
    data['Name'] = this._name;
    data['Number'] = this._number;
    data['PhoneNumber'] = this._phoneNumber;
    data['Status'] = this._status;
    return data;
  }
}
