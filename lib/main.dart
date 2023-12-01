import 'package:flutter/material.dart';

void main() {
  runApp(const CharlieApp());
}

class CharlieApp extends StatelessWidget {
  const CharlieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: CharlieFirstPage(),
    );
  }
}

class CharlieFirstPage extends StatelessWidget {

  @override
  TextEditingController nameController = TextEditingController();
  String? name;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.door_sliding_outlined),
        title: Text("Sambalod's Entry Form"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "Enter you name here..."
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => CharlieSecondPage(name: nameController.text))
                );
              },
              child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}

class CharlieSecondPage extends StatelessWidget {

  @override
  TextEditingController nameController = TextEditingController();
  String? name;

  CharlieSecondPage({ this.name });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.door_sliding_outlined),
        title: Text("Sambalod's Inside Room"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Center(
            child: Text("Welcome to Sambalod's Inside Room, $name!"),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
            ),
            child: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
