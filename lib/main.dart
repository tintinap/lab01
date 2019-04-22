import 'package:flutter/material.dart';
import 'package:lab01/bloc/counter_event.dart';


import './ui/first_screen.dart';
import './ui/second_screen.dart';
import './ui/detail_screen.dart';
import './ui/my_custom_form.dart';
import './ui/list_data.dart';
import './ui/todo_screen.dart';

import './ui/login_screen.dart';
import './ui/register_screen.dart';

import './ui/book_screen.dart';

import './ui/list_book.dart';

import 'ui/map_screen.dart';

import 'package:lab01/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

//MyApp with bloc
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}

class MyAppState extends State<MyApp> {
  final CounterBloc _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        bloc: _counterBloc,
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    CounterBloc _bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Counter"),
        actions: <Widget>[
          IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () {
                  _bloc.dispatch(CounterEvent.decrease);
                },
              ),
          ]
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, int state) {
          return Center(
            child: Text('$state '),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: () {
          _bloc.dispatch(CounterEvent.increase);
        },
      ),
    );
  }

}

//MyApp do like default
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       // home: MyHomePage(),
//       initialRoute: "/",
//       routes : {
//         // "/" : (context) => FirstScreen(),
//         // "/" : (context) => ListData(),
//         // "/" : (context) => SecondScreen(),
//         // "/" : (context) => MyCustomForm(),
//         // "/second" : (context) => SecondScreen(),
//         // "/detail" : (context) => DetailScreen(title: 'Detail',) no need for goto with parameter
//         // "/" : (context) => TodoScreen(),

//         // "/": (context) => LoginScreen(),
//         // "/register": (context) => RegisterScreen(),

//         // "/": (context) => BookScreen(),

//         // "/": (context) => ListBook(),
//         "/": (context) => MapScreen(),

//       }
//     );
//   }
// }

//TAB AND TABBARVIEW EXAMPLE
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Tabbar"),
//           bottom: TabBar(
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.camera),
//                 text:"Camera",
//               ),
//               Tab(
//                 icon: Icon(Icons.add_alarm),
//                 text: "Alarm",
//               ),
//               Tab(
//                 icon: Icon(Icons.account_box),
//                 text: "box",
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             Icon(Icons.camera),
//             Icon(Icons.add_alarm),
//             Icon(Icons.account_box),
//           ],
//         )
//       ),
//     );
//   }

// }

//STATEFULLWIDGET EXAMPLE
// class MyHomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MyHomePageState();
//   }

// }

// class MyHomePageState extends State<MyHomePage> {
//   int counter = 0;
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hello World test ...."),
//     ),
//     body: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Text("$counter"),
//         Text("Value 2"),
//         Text("Value 3"),
//       ],
//     ),
//     floatingActionButton: FloatingActionButton(
//       child: Icon(Icons.add),
//       onPressed: () {
//         setState(() {
//           counter++;        
//         });
//         print("Counter values : $counter");
//       }
//       ),
//     );
//   }
  
// }

// STATELESSWIDGET EXAMPLE
// class MyHomePage extends StatelessWidget {
//   int counter = 0;
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: Text("Hello World test ...."),
//     ),
//     body: Text("$counter"),
//     floatingActionButton: IconButton(
//       icon: Icon(Icons.add),
//       onPressed: () {
//         counter++;
//         print("Counter values : $counter");
//       }
//       ),
//     );
//   }
// }