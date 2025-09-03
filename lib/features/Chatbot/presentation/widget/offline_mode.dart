import 'package:flutter/material.dart';

class OfflineMode extends StatelessWidget {
  const OfflineMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.warning, color: Colors.black),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Offline — using limited guidance',
            style: TextStyle(color: Color(0xFF92400E)),
          ),
        ),
      ],
    );
  }
}