import 'package:flutter/material.dart';

class FCard extends StatelessWidget {
  const FCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Ahora',
              style: const TextStyle().copyWith(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Image.network(
              'https://img.icons8.com/fluency/240/null/sun.png',
              scale: 4,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '51°',
              style: const TextStyle().copyWith(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
