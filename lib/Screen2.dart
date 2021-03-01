import 'package:flutte_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen2 extends StatefulWidget {
  Screen2({this.color});
  var color;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return ScreenState(color);
  }
}

class ScreenState extends State<Screen2> {
  ScreenState(this.color);
  var color;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: Center(
        child: Container(
          color: color,
          height: 500,
          child: Column(
            children: [
              BlocConsumer<CounterBloc, CounterState>(
                  listener: (context, state) {
                    if (state.isIncremented == true) {
                      return Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Incremented'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    }
                    else{
                      return Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Decremented'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                RaisedButton(
                    color: Colors.green,
                    child: Icon(Icons.add),
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(EventCounter.increment);
                    }),
                RaisedButton(
                    color: Colors.red,
                    child: Icon(Icons.remove),
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(EventCounter.decremnet);
                    }),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
