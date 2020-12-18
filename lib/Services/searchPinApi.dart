import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pin_finder/HelperPages/CustomMessages.dart';

Future<String> getLocationList(pinNumber) async {
  var response =
      await http.get("https://api.postalpincode.in/pincode/$pinNumber");
  if (response.statusCode == 200) {
    var constantValues = json.decode(response.body)[0];
    if (constantValues['Status'] == "Success") {
      return response.body;
    } else {
      return ErrorMessage.invReq;
    }
  } else {
    return ErrorMessage.servError;
  }
}
