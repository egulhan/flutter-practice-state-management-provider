import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// STATE MANAGEMENT PRACTICE
// LEARN HOW TO MOVE STATE TO INNER SCOPES BY PROVIDER

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateData>(
      builder: (context) => StateData(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(''),
          ),
          body: Column(
            children: <Widget>[
              Level1(),
            ],
          ),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          onChanged: (String newValue) {
            // DO NOT LISTEN TO UPDATE HERE
            Provider.of<StateData>(context, listen: false).changeData(newValue);
          },
          decoration: InputDecoration(hintText: 'write to change state text'),
        ),
        Level2(),
      ],
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // UPDATE HERE AS WELL WHEN data CHANGED
      child: Text(Provider.of<StateData>(context).data),
    );
  }
}

class StateData extends ChangeNotifier {
  String data = 'Flutter is awsome!';

  void changeData(String newValue) {
    data = newValue;
    notifyListeners();
  }
}
