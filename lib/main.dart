import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/increment1/increment_bloc.dart';
import 'main1/coloFullTile.dart';
import 'main1/secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IncrementBloc>(
          create: (context) => IncrementBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Exisintg test No.1'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> tiles = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ColorfulTile(),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ColorfulTile(),
    ),
  ];

  void _swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  void _goToSecondPage() => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => SecondPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<IncrementBloc, IncrementState>(
            builder: (context, state) {
              return Text(
                'page 1 num : ${state.number}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tiles,
          ),
          MaterialButton(
            onPressed: _swapTiles,
            child: const Text('swap color'),
            color: Colors.greenAccent,
          ),
          MaterialButton(
            onPressed: _goToSecondPage,
            child: const Text('go to second page'),
            color: Colors.redAccent,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<IncrementBloc>(context).add(IncrementAdded());
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
