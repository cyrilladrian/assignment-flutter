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