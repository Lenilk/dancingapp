import "dart:convert";

import "package:http/http.dart" as http;

String antokey = "";
Future<String> readRelayStateFromAnto(
  http.Client thishttp,
  String chanel,
) async {
  String thing = "Relay";
  final res = await thishttp.get(
    Uri.parse("https://api.anto.io/channel/get/$antokey/$thing/$chanel"),
  );
  if (res.statusCode == 200) {
    return (jsonDecode(res.body) as Map<String, dynamic>)["value"];
  } else {
    return "error";
  }
}

Future<bool> writeRelayDataToAnto(
  http.Client thishttp,
  String chanel,
  String data,
) async {
  String thing = "Relay";
  final res = await thishttp.get(
    Uri.parse("https://api.anto.io/channel/set/$antokey/$thing/$chanel/$data"),
  );
  if (res.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<String> readSwitchStateFromAnto(
  http.Client thishttp,
  String chanel,
) async {
  final res = await thishttp.get(
    Uri.parse("https://api.anto.io/channel/get/$antokey/Switch/$chanel"),
  );
  if (res.statusCode == 200) {
    return (jsonDecode(res.body) as Map<String, dynamic>)["value"];
  } else {
    return "error";
  }
}
