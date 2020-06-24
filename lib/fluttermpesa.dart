library fluttermpesa;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttermpesa/Request.dart';
import 'package:fluttermpesa/Response.dart';
import 'AccessToken.dart';

class Mpesa {

  var productionUrl="https://api.safaricom.co.ke/";
  var sandboxUrl="https://sandbox.safaricom.co.ke/";


  Future<AccessToken> accessToken() async{

    final http.Response response = await http.get( sandboxUrl+"/oauth/v1/generate?grant_type=client_credentials");

    return AccessToken.fromJson(jsonDecode(response.body));

  }

  Future<Response> lipaNaMpesa(Request request) async{
    var json = jsonEncode(request.toJson());
    final http.Response response = await http.post( sandboxUrl+"/Mpesa/b2c/v1/paymentrequest",
        headers: {"Content-Type": "application/json"},
        body: json);
    return Response.fromJson(jsonDecode(response.body));

  }



}
