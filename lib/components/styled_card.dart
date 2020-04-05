import 'package:flutter/material.dart';

class StyledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Stack(
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image(
                height: 300,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.squarespace-cdn.com/content/v1/548783b4e4b0b32138d9c3e0/1546769101779-OSEF9ZC33EF5OACCQSFA/ke17ZwdGBToddI8pDm48kIIFsYAJJX10OgNkc4SuD20UqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKce0j9vvU4chI_bB_CjBNrJapSKkBorzMUDpE1NYw5XxnDgGKGBETQKcT3bo-auxwM/gt_06-b_strangers_w.jpg?format=750w'),
              ),
            ),
            alignment: Alignment.center,
          ),
          Container(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.zero, bottom: Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Anxiety',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
