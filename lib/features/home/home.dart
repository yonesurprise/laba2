import 'package:flutter/material.dart';
import 'package:laba2/features/task1/task1.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Task1(),
                  ),
                );
              },
              child: const Text('Task1'),
            ),
          ],
        ),
      ),
    );
  }
}
