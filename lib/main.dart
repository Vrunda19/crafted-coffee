import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Customization',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.brown[50],
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
          bodyText1: TextStyle(
            fontSize: 18.0,
            color: Colors.brown[600],
          ),
        ),
      ),
      home: CoffeeCustomizationPage(),
    );
  }
}

class CoffeeCustomizationPage extends StatefulWidget {
  @override
  _CoffeeCustomizationPageState createState() =>
      _CoffeeCustomizationPageState();
}

class _CoffeeCustomizationPageState extends State<CoffeeCustomizationPage> {
  String _coffeeType = 'Espresso';
  String _milkType = 'Whole Milk';
  String _sweetener = 'Sugar';
  String _flavoring = 'Vanilla';
  String _size = 'Medium';
  bool _whippedCream = false;
  bool _chocolateDrizzle = false;
  bool _cinnamon = false;

  final Map<String, String> _coffeeImages = {
    'Americano': 'assets/americano.jpg',
    'Latte': 'assets/latte.jpg',
    'Espresso': 'assets/espresso.jpg',
    'Cappuccino': 'assets/cappuccino.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.local_cafe, color: Colors.white),
            SizedBox(width: 8.0),
            Text('Customize Your Coffee'),
          ],
        ),
        backgroundColor: Colors.brown[400],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/coffee_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Content on top of the background
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSegmentedControl(
                  icon: Icons.coffee,
                  title: 'Coffee Type',
                  value: _coffeeType,
                  items: [
                    'Espresso',
                    'Latte',
                    'Cappuccino',
                    'Americano',
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _coffeeType = value!;
                    });
                  },
                ),
                _buildSegmentedControl(
                  icon: Icons.local_drink,
                  title: 'Milk Type',
                  value: _milkType,
                  items: [
                    'Whole Milk',
                    'Skim Milk',
                    'Almond Milk',
                    'Oat Milk',
                    'Coconut Milk',
                    'Soy Milk',
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _milkType = value!;
                    });
                  },
                ),
                _buildSegmentedControl(
                  icon: Icons.spa,
                  title: 'Sweetener',
                  value: _sweetener,
                  items: [
                    'Sugar',
                    'Honey',
                    'Stevia',
                    'None',
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _sweetener = value!;
                    });
                  },
                ),
                _buildSegmentedControl(
                  icon: Icons.local_cafe,
                  title: 'Flavoring',
                  value: _flavoring,
                  items: [
                    'Vanilla',
                    'Caramel',
                    'Hazelnut',
                    'None',
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _flavoring = value!;
                    });
                  },
                ),
                _buildSegmentedControl(
                  icon: Icons.format_size,
                  title: 'Size',
                  value: _size,
                  items: [
                    'Small',
                    'Medium',
                    'Large',
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _size = value!;
                    });
                  },
                ),
                _buildBlobButton(
                  icon: Icons.cloud,
                  title: 'Whipped Cream',
                  value: _whippedCream,
                  onChanged: (bool value) {
                    setState(() {
                      _whippedCream = value;
                    });
                  },
                ),
                _buildBlobButton(
                  icon: Icons.water,
                  title: 'Chocolate Drizzle',
                  value: _chocolateDrizzle,
                  onChanged: (bool value) {
                    setState(() {
                      _chocolateDrizzle = value;
                    });
                  },
                ),
                _buildBlobButton(
                  icon: Icons.spa,
                  title: 'Cinnamon',
                  value: _cinnamon,
                  onChanged: (bool value) {
                    setState(() {
                      _cinnamon = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: AnimatedButton(
                    onPressed: _showOrderSummary,
                    child: Text(
                      'Create Your Coffee',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentedControl({
    required IconData icon,
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.brown[600]),
              SizedBox(width: 8.0),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          SizedBox(height: 6),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.brown[200],
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(30.0),
                right: Radius.circular(30.0),
              ),
              border: Border.all(
                color: Colors.brown[600]!,
                width: 2.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(30.0),
                right: Radius.circular(30.0),
              ),
              child: CupertinoSlidingSegmentedControl<String?>(
                backgroundColor: Color.fromARGB(255, 182, 156, 146),
                thumbColor: Color.fromARGB(255, 126, 84, 69),
                groupValue: value,
                onValueChanged: onChanged,
                children: Map.fromIterable(
                  items,
                  key: (item) => item,
                  value: (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      item,
                      style: TextStyle(color: Colors.brown[800]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlobButton({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.brown[600]),
            SizedBox(width: 8.0),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                onChanged(!value);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: value ? Colors.brown[300] : Colors.brown[100],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOrderSummary() {
    final String coffeeImage = _coffeeImages[_coffeeType]!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 16,
          backgroundColor: Colors.brown[50],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.brown[300]!,
                      width: 3.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      coffeeImage, // Display the selected coffee image
                      height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(Icons.coffee, color: Colors.brown[600]),
                    SizedBox(width: 8.0),
                    Text(
                      'Coffee Type: $_coffeeType',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.brown[800],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.local_drink, color: Colors.brown[600]),
                    SizedBox(width: 8.0),
                    Text(
                      'Milk Type: $_milkType',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.brown[800],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.spa, color: Colors.brown[600]),
                    SizedBox(width: 8.0),
                    Text(
                      'Sweetener: $_sweetener',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.brown[800],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.local_cafe, color: Colors.brown[600]),
                    SizedBox(width: 8.0),
                    Text(
                      'Flavoring: $_flavoring',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.brown[800],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.format_size, color: Colors.brown[600]),
                    SizedBox(width: 8.0),
                    Text(
                      'Size: $_size',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.brown[800],
                      ),
                    ),
                  ],
                ),
                if (_whippedCream)
                  Row(
                    children: [
                      Icon(Icons.cloud, color: Colors.brown[600]),
                      SizedBox(width: 8.0),
                      Text(
                        'Add-on: Whipped Cream',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.brown[800],
                        ),
                      ),
                    ],
                  ),
                if (_chocolateDrizzle)
                  Row(
                    children: [
                      Icon(Icons.water, color: Colors.brown[600]),
                      SizedBox(width: 8.0),
                      Text(
                        'Add-on: Chocolate Drizzle',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.brown[800],
                        ),
                      ),
                    ],
                  ),
                if (_cinnamon)
                  Row(
                    children: [
                      Icon(Icons.spa, color: Colors.brown[600]),
                      SizedBox(width: 8.0),
                      Text(
                        'Add-on: Cinnamon',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.brown[800],
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.brown[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: Colors.brown[600]!,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.brown[800],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  AnimatedButton({required this.onPressed, required this.child});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 176, 133, 31),
                  Color.fromARGB(255, 233, 182, 127)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 196, 149, 83).withOpacity(0.6),
                  offset: Offset(12, 12),
                  blurRadius: 24,
                ),
              ],
            ),
            child: Center(
              child: widget.child,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
