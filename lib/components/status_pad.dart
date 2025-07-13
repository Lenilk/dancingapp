import "package:flutter/material.dart";

Widget statusPad(bool isactive) {
  return Container(
    color: isactive ? Colors.amber : Colors.grey,
    width: 75,
    height: 75,
  );
}

Widget halfStatusPad(bool isactive) {
  return Container(
    color: isactive ? Colors.amber : Colors.grey,
    width: 75,
    height: 37.5,
  );
}
