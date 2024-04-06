// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:calculadora_imc/feature_layer/imc/cubit/imc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImcCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final Color customColor =
      Colors.primaries[math.Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    final imcCubit = context.read<ImcCubit>();
    final state = context.watch<ImcCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: customColor,
        actions: [
          RefreshButton(
            onPressed: imcCubit.onResetPressed,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //person icon
              Icon(
                Icons.person_outline,
                size: 120,
                color: customColor,
              ),
              HeightTextField(
                customColor: customColor,
                onChanged: imcCubit.onHeightChanged,
                height: state.formValues.height,
              ),
              const SizedBox(
                height: 20,
              ),
              WeightTextField(
                customColor: customColor,
                onChanged: imcCubit.onWeightChanged,
                weight: state.formValues.weight,
              ),
              CalculateButton(
                customColor: customColor,
                onPressed: imcCubit.onCalculatePressed,
              ),

              DisplayStatus(
                customColor: customColor,
                result: state.result,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
