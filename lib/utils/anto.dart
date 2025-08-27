import "dart:convert";

import "package:danceteaching/utils/anto.key.dart";
import "package:flutter/foundation.dart";
import "package:http/http.dart" as http;

Future<String> readRelayStateFromAnto(
  http.Client thishttp,
  String chanel,
) async {
  try {
    String thing = "Relay";
    final res = await thishttp.get(
      Uri.parse("https://api.anto.io/channel/get/$antokey/$thing/$chanel"),
    );
    if (res.statusCode == 200) {
      return (jsonDecode(res.body) as Map<String, dynamic>)["value"];
    } else {
      return "error";
    }
  } catch (e) {
    debugPrint("error");
    return "0";
  }
}

Future writeRelayDataToAnto(
  http.Client thishttp,
  String chanel,
  String data,
) async {
  try {
    String thing = "Relay";
    final res = await thishttp.get(
      Uri.parse(
        "https://api.anto.io/channel/set/$antokey/$thing/$chanel/$data",
      ),
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    debugPrint("error");
    return "error";
  }
}

Future writeStartStateToAnto(int isStart) async {
  try {
    final res = await http.get(
      Uri.parse(
        "https://api.anto.io/channel/set/$antokey/Relay/isStart/$isStart",
      ),
    );

    if (res.statusCode == 200) {
      debugPrint(
        "value write is start ${(jsonDecode(res.body) as Map<String, dynamic>)["value"]}",
      );
    } else {
      debugPrint("error");
    }
  } catch (e) {
    debugPrint("error");
    return "error";
  }
}

Future writeSongStateToAnto(int song) async {
  try {
    final res = await http.get(
      Uri.parse("https://api.anto.io/channel/set/$antokey/Relay/song/$song"),
    );
    if (res.statusCode == 200) {
      debugPrint(
        "value write is song ${(jsonDecode(res.body) as Map<String, dynamic>)["value"]}",
      );
    } else {
      debugPrint("error");
    }
  } catch (e) {
    debugPrint("error");
    return "error";
  }
}

Future writeSpeedStateToAnto(double speed) async {
  try {
    final res = await http.get(
      Uri.parse("https://api.anto.io/channel/set/$antokey/Relay/speed/$speed"),
    );
    if (res.statusCode == 200) {
      debugPrint(
        "value write is speed ${(jsonDecode(res.body) as Map<String, dynamic>)["value"]}",
      );
    } else {
      debugPrint("error");
    }
  } catch (e) {
    debugPrint("error");
    return "error";
  }
}
