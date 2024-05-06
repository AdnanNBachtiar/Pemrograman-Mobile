import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text('1', style: TextStyle(color: Color.fromARGB(255, 248, 0, 0))),
          Text('2', style: TextStyle(color: Color.fromARGB(255, 0, 255, 136))),
          Text('3', style: TextStyle(color: Color.fromARGB(255, 0, 236, 165))),
          Text('4', style: TextStyle(color: Color.fromARGB(255, 82, 1, 1))),
          Text('5', style: TextStyle(color: Color.fromARGB(255, 63, 0, 47))),
          Text('6', style: TextStyle(color: Color.fromARGB(255, 253, 236, 0))),
        ],
      ),
    );
  }
}
