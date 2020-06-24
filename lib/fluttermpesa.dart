library fluttermpesa;

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fluttermpesa/Request.dart';
import 'package:fluttermpesa/Response.dart';
import 'AccessToken.dart';

class Mpesa {

  var productionUrl="https://api.safaricom.co.ke";
  var sandboxUrl="https://sandbox.safaricom.co.ke";


  Future<AccessToken> accessToken(String consumerKey, String consumerSecret) async{
    var auth = 'Basic '+base64Encode(utf8.encode('$consumerKey:$consumerSecret'));
    final http.Response response = await http.get( sandboxUrl+"/oauth/v1/generate?grant_type=client_credentials",
        headers: {HttpHeaders.authorizationHeader: auth});
    return AccessToken.fromJson(jsonDecode(response.body));

  }

  Future<Response> lipaNaMpesa(Request request, String consumerKey, String consumerSecret) async{
    AccessToken accessToken=this.accessToken(consumerKey, consumerSecret) as AccessToken;
    String token=accessToken.accessToken;

    var json = jsonEncode(request.toJson());
    final http.Response response = await http.post( sandboxUrl+"/Mpesa/b2c/v1/paymentrequest",
        headers: {"Content-Type": "application/json",
        "Authorization":"Bearer"+ "$token"},
        body: json);
    return Response.fromJson(jsonDecode(response.body));

  }



}
