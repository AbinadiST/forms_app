import 'package:flutter/material.dart';


class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
        actions: [
          IconButton(
            onPressed: () => {}, 
            icon: const Icon( Icons.refresh_outlined ) // se agrega el ícono en el APPBAR
            )
        ],
      ),
      body: const Center(
        child: Text('Counter value: xxxx'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: '1', // para identificar el FAB ya que hay varios
            child: const Text('+3'),
            onPressed: () => {},
            ),
            const SizedBox( height: 15),

          FloatingActionButton(
            heroTag: '2', // para identificar el FAB ya que hay varios
            child: const Text('+2'),
            onPressed: () => {},
            ),
            const SizedBox(height: 15),

          FloatingActionButton(
            heroTag: '3', // para identificar el FAB ya que hay varios
            child: const Text('+1'),
            onPressed: () => {},
            ),
        ],
      ),
    );
  }
}