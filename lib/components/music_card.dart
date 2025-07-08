import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/services/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicCard extends StatelessWidget {
  final String name;
  final int index;
  const MusicCard({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Provider.of<MusicProvider>(context).musicnumber_selected == index
                ? Colors.blue[100]
                : null,
          ),
        ),
        onPressed: () {
          Provider.of<MusicProvider>(context, listen: false).select(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.music_note),
              SizedBox(width: 20),
              GeneralText(data: name),
            ],
          ),
        ),
      ),
    );
  }
}
