import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
          backgroundColor: Colors.red.shade800,
          cardColor: Colors.white,
          accentColor: Colors.red,
          primaryColorDark: Colors.red.shade900,
        ).copyWith(
          brightness: Brightness.dark,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<int> _items = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      _items.add(_counter);
    });
  }

  bool _isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  Widget _buildImageWidget(int number) {
    if (_isPrime(number)) {
      return Image.asset('assets/images/ananas.png');
    } else if (number % 2 == 0) {
      return Image.asset('assets/images/poire.png');
    } else {
      return Image.asset('assets/images/pomme.png');
    }
  }

  String _getNumberType(int number) {
    if (_isPrime(number)) {
      return 'Nombre premier';
    } else if (number % 2 == 0) {
      return 'Nombre pair';
    } else {
      return 'Nombre impair';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900.withAlpha(400),
        title: Text(
          '$_counter (${_getNumberType(_counter)})',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _items[index];
          Color backgroundColor = item % 2 == 0 ? Colors.cyan : Colors.indigo;

          return Container(
            color: backgroundColor,
            child: ListTile(
              leading: _buildImageWidget(item),
              title: Text(
                'Item $item',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.red.shade900.withAlpha(400),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
