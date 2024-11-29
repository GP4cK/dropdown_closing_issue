import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var showDropdown = true;
  @override
  Widget build(BuildContext context) {
    final Widget child;
    if (showDropdown) {
      child = Navigator(
        onGenerateRoute: (_) {
          return MaterialPageRoute(
            builder: (_) => Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownSearch.multiSelection(
                  items: (filter, loadProps) => ['Option 1', 'Option 2'],
                  enabled: true,
                ),
              ),
            ),
          );
        },
      );
    } else {
      child = const Placeholder();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () => setState(() => showDropdown = !showDropdown),
          child: const Text('Click me'),
        ),
        Expanded(child: child),
      ],
    );
  }
}
