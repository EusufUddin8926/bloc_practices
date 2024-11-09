import 'package:counter_bloc/bloc/switch/switch_bloc.dart';
import 'package:counter_bloc/bloc/switch/switch_events.dart';
import 'package:counter_bloc/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notification',
                  style: TextStyle(color: Colors.black),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.isSwich != current.isSwich,
                  builder: (context, state) {
                    return Switch(
                        value: state.isSwich,
                        onChanged: (newValue) {
                          print('SwitchSSSSSSSSSSSSSSSSSSSSSSSSSS');
                          context.read<SwitchBloc>().add(EnableOrDisableNotification());
                        });
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.35,
                  decoration: BoxDecoration(color: Colors.blue.withOpacity(state.slider)),
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    print('Slidderrrrrrrrrrrrrrrr');
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  });
            },
          )
        ],
      ),
    );
  }
}
