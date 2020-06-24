library fluttermpesa;

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Mpesa {

  var productionUrl="https://api.safaricom.co.ke";
  var sandboxUrl="https://sandbox.safaricom.co.ke";


  Future<_AccessToken> _accessToken(String consumerKey, String consumerSecret) async{
    var auth = 'Basic '+base64Encode(utf8.encode('$consumerKey:$consumerSecret'));
    final http.Response response = await http.get( sandboxUrl+"/oauth/v1/generate?grant_type=client_credentials",
        headers: {HttpHeaders.authorizationHeader: auth});
    return _AccessToken.fromJson(jsonDecode(response.body));

  }

  Future<Response> lipaNaMpesa(Request request, String consumerKey, String consumerSecret) async{
    _AccessToken accessToken= await this._accessToken(consumerKey, consumerSecret);
    String token=accessToken.accessToken;

    var json = jsonEncode(request.toJson());
    final http.Response response = await http.post( sandboxUrl+"/mpesa/stkpush/v1/processrequest",
        headers: {"Content-Type": "application/json",
          HttpHeaders.authorizationHeader:"Bearer "+ "$token"},
        body: json);
    return Response.fromJson(jsonDecode(response.body));

  }
}

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

class Response {
  String merchantRequestID;
  String checkoutRequestID;
  String responseCode;
  String responseDescription;
  String customerMessage;

  Response(
      {this.merchantRequestID,
        this.checkoutRequestID,
        this.responseCode,
        this.responseDescription,
        this.customerMessage});

  Response.fromJson(Map<String, dynamic> json) {
    merchantRequestID = json['MerchantRequestID'];
    checkoutRequestID = json['CheckoutRequestID'];
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    customerMessage = json['CustomerMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MerchantRequestID'] = this.merchantRequestID;
    data['CheckoutRequestID'] = this.checkoutRequestID;
    data['ResponseCode'] = this.responseCode;
    data['ResponseDescription'] = this.responseDescription;
    data['CustomerMessage'] = this.customerMessage;
    return data;
  }
}

class _AccessToken {
  String accessToken;
  String expiresIn;

  _AccessToken({this.accessToken, this.expiresIn});

  _AccessToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}