import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), 
        child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  //* Método para mejorar el código en los estados pero de los botones ----------------------------

  void increaseCounterBy( BuildContext context, [ int value = 1] ){
    context.read<CounterCubit>().increaseBy( value );

  }

  @override
  Widget build(BuildContext context) {


    // final counterState = context.watch<CounterCubit>().state;  // para escuchar los cambios que tiene el STATE

    return Scaffold(
      appBar: AppBar(
        title: context.select( (CounterCubit value) { 
          
          //? Para evitar CONTEXT.WATCH() que valida todos los widgets, hacemos esto y sólo valida este bloc
          //? S19 => EQUATABLE => min 8:00
          
        return Text('Cubit Counter: ${ value.state.transactionCount }');

        }), 

        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset(); // se resetea al dar clic en el ícono
              },
              icon: const Icon(
                  Icons.refresh_outlined) // se agrega el ícono en el APPBAR
              )
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter, | mas info en CONSUMIR Y UTILIZAR EL COUNTERCUBIT min 6:30
          builder: (context, state) {
            return Text('Counter value: ${ state.counter }');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: '1', // para identificar el FAB ya que hay varios
            child: const Text('+3'),
            onPressed: () => increaseCounterBy( context, 3 )
          ),

          const SizedBox(height: 15),

          FloatingActionButton(
            heroTag: '2', // para identificar el FAB ya que hay varios
            child: const Text('+2'),
            onPressed: () => increaseCounterBy( context, 2 )
          ),

          const SizedBox(height: 15),

          FloatingActionButton(
            heroTag: '3', // para identificar el FAB ya que hay varios
            child: const Text('+1'),
            onPressed: () => increaseCounterBy( context )  // no se pone INT porque ya está por default en el método: INCREASECOUNTERBY
          ),
        ],
      ),
    );
  }
}
