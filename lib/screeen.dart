import 'package:flutte_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return ScreenState();
  }

}
class ScreenState  extends State<ScreenDemo>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          child: Column(
            children: [

                  BlocBuilder<CounterBloc,CounterState>(
                    builder: (context,state){
                      return Text(state.counterValue.toString(),style: TextStyle(fontSize: 30),);
                    }
                    ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                  color: Colors.green,
                  child: Icon(Icons.add),
                    onPressed: (){
                    BlocProvider.of<CounterBloc>(context).add(EventCounter.increment);

                }
                ),
                  RaisedButton(
                      color: Colors.red,
                      child: Icon(Icons.remove),
                      onPressed: (){
                        BlocProvider.of<CounterBloc>(context).add(EventCounter.decremnet);
                      }
                  ),
                ]
              ),

            ],
          ),
        ),
      ),
    );
  }

}