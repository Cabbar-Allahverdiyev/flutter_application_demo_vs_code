import 'package:flutter/material.dart';

import 'models/student.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        // debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Cabbar", "Allahverdiyev", 45),
    Student.withId(2, "Seymur", "Veliyev", 25),
    Student.withId(3, "Murad", "Heshimov", 70)
  ];

  Student selectedStudent = Student.withId(0, "", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Programim"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                    students[index].firstName + " " + students[index].lastName),
                subtitle: Text("Imthan neticesi : " +
                    students[index].grade.toString() +
                    "[" +
                    students[index].getStatus +
                    "]"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/77884315?v=4"),
                ),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    this.selectedStudent = students[index];
                  });
                },
                onLongPress: () => print("Uzun basildi"),
              );
            },
          ),
        ),
        Text("Secilen " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                child: Row(children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Yeni telebe")
                ]),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                onPressed: () {
                  print("tezte");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                child: Row(children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Yenile")
                ]),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                onPressed: () {
                  print("Yenile");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Row(children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Sil")
                ]),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                onPressed: () {
                  print("sil");
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50)
      return Icon(Icons.done);
    else if (grade > 40)
      return Icon(Icons.album);
    else
      return Icon(Icons.clear);
  }
}



// class MaterialApp extends Widget{
//   MaterialApp({Widget home  })
// }


























// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
