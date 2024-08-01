part of 'counter_cubit.dart';



class CounterState extends Equatable {  

  //! se agrega el paquete EQUATABLE | video S19 => EQUATABLE para más info

  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0, 
    this.transactionCount = 0
    });

  copyWith ({
    int? counter,
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  
  @override
  List<Object?> get props => [ counter, transactionCount ]; // indicamos los campos a considerar
  
}