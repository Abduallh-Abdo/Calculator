import 'package:calculator/Lists/list_icos.dart';
import 'package:calculator/cubits/calculator_cubit/calculator_cubit.dart';
import 'package:calculator/cubits/calculator_cubit/calculator_states.dart';
import 'package:calculator/models/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    var calculatorCubit = BlocProvider.of<CalculatorCubit>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
          ),
        ),
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (context, state) {
                return Text(
                  calculatorCubit.userInput,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          SizedBox(
            width: double.infinity,
            height: 75,
            child: Text(
              calculatorCubit.result,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white38,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: iconList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                listIcon icon = iconList[index];
                return CustomButtons(
                  text: icon.text,
                  onPressed: () =>
                      calculatorCubit.handleButtonPressed(icon.text),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
