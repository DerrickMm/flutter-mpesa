class Request {
  String businessShortCode;
  String password;
  String timestamp;
  String transactionType;
  String amount;
  String partyA;
  String partyB;
  String phoneNumber;
  String callBackURL;
  String accountReference;
  String transactionDesc;

  Request(
      {this.businessShortCode,
        this.password,
        this.timestamp,
        this.transactionType,
        this.amount,
        this.partyA,
        this.partyB,
        this.phoneNumber,
        this.callBackURL,
        this.accountReference,
        this.transactionDesc});

  Request.fromJson(Map<String, dynamic> json) {
    businessShortCode = json['BusinessShortCode'];
    password = json['Password'];
    timestamp = json['Timestamp'];
    transactionType = json['TransactionType'];
    amount = json['Amount'];
    partyA = json['PartyA'];
    partyB = json['PartyB'];
    phoneNumber = json['PhoneNumber'];
    callBackURL = json['CallBackURL'];
    accountReference = json['AccountReference'];
    transactionDesc = json['TransactionDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BusinessShortCode'] = this.businessShortCode;
    data['Password'] = this.password;
    data['Timestamp'] = this.timestamp;
    data['TransactionType'] = this.transactionType;
    data['Amount'] = this.amount;
    data['PartyA'] = this.partyA;
    data['PartyB'] = this.partyB;
    data['PhoneNumber'] = this.phoneNumber;
    data['CallBackURL'] = this.callBackURL;
    data['AccountReference'] = this.accountReference;
    data['TransactionDesc'] = this.transactionDesc;
    return data;
  }
}