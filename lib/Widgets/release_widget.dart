import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class Release extends StatefulWidget {
  Release({super.key, required this.url});
  String url;

  @override
  State<Release> createState() => _ReleaseState();
}

class _ReleaseState extends State<Release> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80,
      height: 70,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExtendedImage.network(widget.url),
          ),
           SizedBox(
            width: 800,
            child: ListTile(
              title: Text(
                '3TERNAL',
                style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              subtitle: Text(
                'sangaritta',
                style: TextStyle(
                  color: Theme.of(context).primaryColor
                ),
                
                ),
            ),
          )
        ],
      ),
    );
  }
}
