import 'dart:async';

import 'package:flutter/material.dart';

import 'editable_drop_down.dart';
import 'custom_menu_anchor.dart' as cm;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay with a Timer
    Timer(Duration(seconds: 3), () {
      // Navigate to the next screen after the delay
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => const MyHomePage(title: 'Custom Widget Demo Home Page')), (route) => false
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue, // Customize the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Flutter Splash Screen',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listAnimalOriginal = <String>[
    'Dog',
    'Cat',
    'Tiger',
    'Lion',
    'Cat',
    'Tiger',
    'Lion',
    'Cat',
    'Tiger',
    'Lion',
    'Cat',
    'Tiger',
    'Lion',
    'Cat',
    'Tiger',
    'Lion',
    'Cat',
    'Tiger',
    'Lion',
    'Cat',
    'Tiger',
    'Lion',
    'Cat',
    'Tiger',
    'Lion'
  ];
  var listAnimalFiltered = <String>[
    'Dog',
    'Cat',
    'Tiger',
    'Lion',
    'Cat',
    'Tiger',
    'Lion',
    'Cat',
    'Tiger'
  ];
  ScrollController? scrollController;
  TextEditingController fullNameTextController = TextEditingController();
  String selectedMenu = "";
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            EditableDropdownMenu<String>(
              labelText: "Animals",
              hintText: "Please select animal from here",
              controller: fullNameTextController,
              focusBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              onSelected: (doctorInfo) {
                setState(() {});
              },
              onChange: (value) {
                if (value?.isNotEmpty ?? false) {
                  listAnimalFiltered = listAnimalOriginal
                      .where((element) => element
                          .toLowerCase()
                          .contains(value.toString().toLowerCase()))
                      .toList();
                } else {
                  listAnimalFiltered = listAnimalOriginal;
                }
                setState(() {});
              },
                menuStyle: MenuStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green.shade100)
                ),
              dropdownMenuEntries: listAnimalFiltered
                      ?.map((e) => EditableDropdownMenuEntry<String>(
                            value: e,
                            label: e,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.green.shade100),
                                padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)))
                          ))
                      .toList() ??
                  [],
              menuHeight: 300,
              onScroll: (controller) {
                if (controller.position.extentAfter <= 0) {}
              },
              scrollController: scrollController,
              isSearch: true,
              fieldDecoration: InputDecoration(
                labelText: "Animals",
                hintText: "Please select animal from here",
                suffixIcon: IconButton(
                  onPressed:(){
                    fullNameTextController.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              )
            ),
            cm.MenuAnchor(
              style: const MenuStyle(
                minimumSize: MaterialStatePropertyAll<Size>(Size(700, 0.0)),
                maximumSize: MaterialStatePropertyAll<Size>(Size(700, 50)),
                visualDensity: VisualDensity.standard,
              ),
              builder: (context, controller, child) {
                return TextField(
                  controller: textEditingController,
                  onTap: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                );
              },
              menuChildren: List<MenuItemButton>.generate(
                3,
                (int index) => MenuItemButton(
                  onPressed: () => setState(() {
                    selectedMenu = listAnimalOriginal[index];
                    textEditingController.text = selectedMenu;
                  }),
                  child: Text(listAnimalOriginal[index]),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            }, child: Text(" go to next"))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text(" go to next")),
            Text('Welcome to the Home Screen!'),
          ],
        ),
      ),
    );
  }
}
