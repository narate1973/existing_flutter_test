import 'package:existing_test/bloc/increment2/increment2_bloc.dart';
import 'package:existing_test/bloc/status/status_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatusBloc>(
      create: (context) => StatusBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              title: Text('eixsint test no. 3'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<StatusBloc, StatusState>(
                    builder: (context, state) {
                      return Container(
                        width: 200,
                        height: 50,
                        color: Colors.yellow,
                        child: Center(
                            child: Text(
                          'status is ${state.isSuccess ? "success" : "failed"}',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  BlocBuilder<Increment2Bloc, Increment2State>(
                    builder: (context, state) {
                      return Text(
                        'page 2 num : ${state.number}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  MaterialButton(
                    onPressed: () {
                      BlocProvider.of<StatusBloc>(context)
                          .add(StatusToSuccess());
                    },
                    child: Text('switch to success'),
                    color: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () {
                      BlocProvider.of<StatusBloc>(context)
                          .add(StatusToFailed());
                    },
                    child: Text('switch to fail'),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<Increment2Bloc>(context).add(Increment2Added());
              },
              child: Icon(Icons.plus_one),
            ),
          );
        },
      ),
    );
  }
}
