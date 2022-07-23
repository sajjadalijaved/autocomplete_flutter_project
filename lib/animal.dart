import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  String? _selectedAnimal;

  final List<String> _animals = [
    'Alligator',
    'Buffalo',
    'Chicken',
    'Dog',
    'Eagle',
    'Frog',
    'Cat',
    'Ox',
    'Fox',
    'Owl',
    'Cow',
    'Goat',
    'Sheep',
    'Lion',
    'Tiger',
    'Bear',
    'Monkey',
    'Donkey',
    'Camel',
    'Rabit',
    'Duck',
    'Horse',
    'Snake'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Autocomplete<String>(
              fieldViewBuilder: (BuildContext context, textEditingController,
                      focusNode, VoidCallback onFieldSubmitted) =>
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    onSubmitted: (String value) {
                      onFieldSubmitted();
                    },
                    focusNode: focusNode,
                    controller: textEditingController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 5,
                                style: BorderStyle.solid)),
                        hintText: 'Search Animal Here',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
              optionsBuilder: (TextEditingValue value) {
                if (value.text.isEmpty) {
                  return [];
                }

                return _animals.where((animal) =>
                    animal.toLowerCase().contains(value.text.toLowerCase()));
              },
              onSelected: (value) {
                setState(() {
                  _selectedAnimal = value;
                });
              },
            ),
            // const SizedBox(
            //   height: 40,
            // ),
            // Text(_selectedAnimal ?? 'Type something (a, b, c, etc)'),
          ],
        ),
      ),
    );
  }
}
