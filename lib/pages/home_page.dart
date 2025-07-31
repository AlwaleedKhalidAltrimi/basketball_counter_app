import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/counter_cubit.dart';
import '../cubit/counter_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<CounterCubit>(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text(
              'Points Counter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Team A Column
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team A',
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          '${cubit.teamAPointer}',
                          style: const TextStyle(fontSize: 150),
                        ),
                        for (int i = 1; i <= 3; i++)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: const Size(150, 50),
                            ),
                            onPressed: () {
                              cubit.teamIncrement(team: 'A', points: i);
                            },
                            child: Text(
                              'Add $i Point',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Divider
                  const SizedBox(
                    height: 500,
                    child: VerticalDivider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),

                  // Team B Column
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team B',
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          '${cubit.teamBPointer}',
                          style: const TextStyle(fontSize: 150),
                        ),
                        for (int i = 1; i <= 3; i++)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: const Size(150, 50),
                            ),
                            onPressed: () {
                              cubit.teamIncrement(team: 'B', points: i);
                            },
                            child: Text(
                              'Add $i Point',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              // Reset Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  cubit.reset();
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
