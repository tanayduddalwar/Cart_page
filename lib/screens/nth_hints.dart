import 'package:flutter/material.dart';

class OceanThemedPage extends StatefulWidget {
  @override
  _OceanThemedPageState createState() => _OceanThemedPageState();
}

class _OceanThemedPageState extends State<OceanThemedPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ocean Themed Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/credenz24.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: 10, // Example item count
          itemBuilder: (BuildContext context, int index) {
            return AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, _animation.value * 50),
                  child: FadeTransition(
                    opacity: _animation,
                    child: child,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12.0),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.beach_access, color: Colors.white),
                    ),
                    title: Text(
                      'Item $index',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Text(
                      'Description of Item $index',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        // Handle favorite button press
                      },
                    ),
                    onTap: () {
                      // Handle tap on the list tile
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OceanThemedPage(),
  ));
}
