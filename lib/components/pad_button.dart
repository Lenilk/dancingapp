import "package:flutter/material.dart";

Widget padButton(VoidCallback fn, Color color) {
  return ElevatedButton(
    style: TextButton.styleFrom(
      padding: EdgeInsetsGeometry.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(0),
      ),
      minimumSize: Size.zero,
      backgroundColor: color,
    ),
    onPressed: fn,
    child: SizedBox(width: 100, height: 100),
  );
}

Widget halfPadButton(VoidCallback fn, Color color) {
  return SizedBox(
    width: 100,
    height: 50,
    child: ElevatedButton(
      style: TextButton.styleFrom(
        padding: EdgeInsetsGeometry.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(0),
        ),
        backgroundColor: color,
      ),
      onPressed: fn,
      child: null,
    ),
  );
}
