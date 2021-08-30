import 'package:existing_test/bloc/increment1/increment_bloc.dart';
import 'package:existing_test/bloc/increment2/increment2_bloc.dart';
import 'package:existing_test/main1/thirdPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  void _shoeModal(context) {
    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<Increment2Bloc>(context),
          child: AlertDialog(
            content: BlocBuilder<Increment2Bloc, Increment2State>(
              builder: (context, state) {
                return Text(
                  'page 2 num : ${state.number}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _gotToThirdPage(context) => Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => BlocProvider.value(
            value: BlocProvider.of<Increment2Bloc>(context),
            child: ThirdPage(),
          )));

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Increment2Bloc>(
      create: (context) => Increment2Bloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              title: Text('existing test no.2'),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<IncrementBloc, IncrementState>(
                    builder: (context, state) {
                      return Text(
                        'page 1 num : ${state.number}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
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
                      _shoeModal(context);
                    },
                    child: const Text('show bottom sheet'),
                    color: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () {
                      _gotToThirdPage(context);
                    },
                    child: const Text('go to third page'),
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
