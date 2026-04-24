import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 0, 47, 255)),
      home: const HomeScreen(),
    );
  }
}

// Pantalla principal
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  void _reset() {
    setState(() => counter = 0);
  }

  void _increment() {
    setState(() => counter++);
  }

  void _decrement() {
    if (counter > 0) {
      setState(() => counter--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        leading: const Icon(Icons.home),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              'Click${counter == 1 ? '' : 's'}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _CustomButton(
            heroTag: "reset",
            icon: Icons.refresh,
            onPressed: _reset,
          ),
          const SizedBox(height: 10),
          _CustomButton(
            heroTag: "sum",
            icon: Icons.plus_one,
            onPressed: _increment,
          ),
          const SizedBox(height: 10),
          _CustomButton(
            heroTag: "rest",
            icon: Icons.exposure_minus_1_rounded,
            onPressed: _decrement,
          ),
        ],
      ),
    );
  }
}

// Widget personalizado
class _CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String heroTag;

  const _CustomButton({
    required this.icon,
    required this.onPressed,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
