import 'package:calculator/cubits/calculator_cubit/calculator_cubit.dart';
import 'package:calculator/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Calcualta());
}

class Calcualta extends StatelessWidget {
  const Calcualta({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
