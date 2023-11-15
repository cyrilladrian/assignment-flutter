# assignment_flutter

Cyrill Adrian Wicaksono 
2206822225

## Assignment 7
1. What are the main differences between stateless and stateful widget in Flutter?
Stateless Widget: Stateless widgets are immutable and do not have any internal state. They are built once and do not change after being created. Stateless widgets are suitable for displaying static content that doesn't change during the widget's lifetime.

Stateful Widget: Stateful widgets, on the other hand, can maintain internal state that can change over time. They can be rebuilt multiple times during their lifetime, and the state they hold can be updated, leading to changes in their appearance or behavior.

2. Explain all widgets that you used in this assignment.
The widgets that are used in this assignment are: Shop card and myHomePage. The myHomepage is a stateless widget to display the main application. Each shop item is represented by a ShopCard widget, which provides a card-like UI for displaying the item's name and icon. When a ShopCard is tapped, it shows a SnackBar with the item's name. For the myHomePage widget The build method creates the UI for the home page, which includes an AppBar, a Scaffold, and a GridView containing ShopCard widgets.The AppBar displays the app's title, "InventLaris." The GridView is used to display the list of shop items in a grid layout. It uses the ShopCard widget to represent each item. On the other hand for the ShopCard widget It takes a ShopItem as a parameter in its constructor. The build method creates a card that includes an icon and the name of the shop item.
It uses a Material widget as the outer container with a teal background color.

3.  Explain how you implemented the checklist above step-by-step (not just following the tutorial).
a. create a new main.dart file
b. create a simple stateless widget in the menu.dart file, which include the MyHomePage class
c. add text and cards to represent the items stored
d. defining the types of items that are sold
e. create a list of items that are going to be displayed using the defined data types of item
f. build the widget to show the user interfaces 
g. create a new stateless widget to display the cards 

## Assignment 8 
a. Explain the difference between Navigator.push() and Navigator.pushReplacement(), accompanied by examples of the correct usage of both methods!
We use Navigator.push() when you want to add a new screen to the navigation stack and allow the user to navigate back.
On the other hand we use Navigator.pushReplacement() when you want to replace the current screen with a new one and prevent the user from navigating back to the original screen.

b. Explain each layout widget in Flutter and their respective usage contexts!
(1) Container widget is a versatile box model that can contain other widgets.
It allows you to customize the size, padding, margin, and decoration of its child widgets.
dart
(2) Row and Column are flex widgets that arrange their children in a horizontal (Row) or vertical (Column) sequence.
They are useful for building flexible and responsive layouts.
(3) ListView is used for scrolling lists of widgets. It lazily loads its children, making it efficient for displaying large lists.
It's suitable for scenarios where you need a scrollable list of items.
(4) Expanded and Flexible are widgets that control how a child widget occupies available space within a Row or Column.
They are useful for distributing space among multiple widgets.
(5) Stack allows you to overlay widgets on top of each other.
It's useful when you want to position widgets on top of one another, like in a layered UI.
(6) GridView arranges its children in a two-dimensional array. It's commonly used for displaying items in a grid format.
It supports both scrolling and non-scrolling grids.

c. List the form input elements you used in this assignment and explain why you used these input elements!
a. Name 
b. Price 
c. Amount 
d. Description
The input fields are the same as the input field of my django assignment

d. How is clean architecture implemented in a Flutter application?
Clean Architecture is a software design philosophy that aims to separate concerns and make a system more modular, testable, and maintainable. It emphasizes a clear separation between the business logic, application framework, and external dependencies. In a Flutter application, Clean Architecture can be implemented by organizing the code into different layers, each serving a specific purpose

e. Explain how you implemented the checklist above step-by-step! (not just following the tutorial)
1. Implement the shopping form 
```dart
import 'package:flutter/material.dart';
// Import the previously created drawer
import 'package:assignment_flutter/widgets/left_drawer.dart'; // Import your LeftDrawer widget here

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({Key? key}) : super(key: key);

  @override
  _ShopFormPageState createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  int _price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add Product Form'),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      // Add the previously created drawer here
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Product Name",
                    labelText: "Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.tryParse(value ?? "0") ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Amount must be a number!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value ?? "0") ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Price must be a number!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Product successfully saved'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    Text('Amount: $_amount'),
                                    Text('Description: $_description'),
                                    Text('Price: $_price'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```
2. Implement the the left drawer 

``` dart
import 'package:flutter/material.dart';
import 'package:assignment_flutter/menu.dart';
// Import the ShopFormPage page here
import 'package:assignment_flutter/form.dart'; // Replace with the correct import path

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              children: [
                Text(
                  'Shopping List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Write all your shopping needs here!",
                  style: TextStyle(
                    // textAlign: TextAlign.center,
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home Page'),
            // Redirect to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: Text('Add Product'),
            // Redirect to ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

```

3. Implementation of menu.dart
```dart
import 'package:flutter/material.dart';
import 'package:assignment_flutter/form.dart';
import 'package:assignment_flutter/widgets/left_drawer.dart';

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("View Products", Icons.checklist),
    ShopItem("Add Product", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'InventLaris',
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Scrolling wrapper widget
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding for the page
          child: Column(
            // Widget to display children vertically
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Text widget to display text with center alignment and appropriate style
                child: Text(
                  'InventLaris', // Text indicating the shop name
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container for our cards.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iteration for each item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.teal,
      child: InkWell(
        // Responsive touch area
        onTap: () {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Product") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShopFormPage()));
          }
        },
        child: Container(
          // Container to hold Icon and Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

4. Implementation of main.dart 
``` dart
import 'package:flutter/material.dart';
import 'package:assignment_flutter/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InventLaris',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```