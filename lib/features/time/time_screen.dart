import 'package:flutter/material.dart';
import 'package:streams_exercises/features/time/time_repository.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({
    super.key,
    required this.timeRepository,
  });

  final TimeRepository timeRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Time Screen'),
      ),
      body: Center(
        child: StreamBuilder<DateTime>(
          stream: timeRepository.dateTimeStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final dateTime = snapshot.data!;
              return Text(
                '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return const Text("Keine Daten verfügbar");
            }
          },
        ),
      ),
    );
  }
}
