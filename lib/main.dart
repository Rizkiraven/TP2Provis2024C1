import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> practitioners = [
    {
      'name': 'dr. John Doe',
      'profession': 'General Practitioner',
      'experience': '5 years',
      'rating': 4.5,
      'image': 'profile_pic1.jpg',
    },
    {
      'name': 'dr. Sisca Amartha',
      'profession': 'General Practitioner',
      'experience': '5 years',
      'rating': 5.0,
      'image': 'profile_pic2.jpg',
    },
    {
      'name': 'dr. Saeful Baskori',
      'profession': 'General Practitioner',
      'experience': '7 years',
      'rating': 5.0,
      'image': 'profile_pic3.jpg',
    },
    {
      'name': 'dr. Alamsyah',
      'profession': 'General Practitioner',
      'experience': '3 years',
      'rating': 4.7,
      'image': 'profile_pic4.jpg',
    },
    {
      'name': 'dr. Rizky Pratama',
      'profession': 'General Practitioner',
      'experience': '6 years',
      'rating': 4.9,
      'image': 'profile_pic5.jpg',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'General Practitioner',
          style: TextStyle(
            color: Colors.indigo, fontWeight:FontWeight.bold // Warna teks biru tua
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: practitioners.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(practitioners[index]['image']),
              ),
              title: Text(practitioners[index]['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(practitioners[index]['profession']),
                  Text('Experience: ${practitioners[index]['experience']}'),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.yellow),
                      Text('${practitioners[index]['rating']}'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.calendar_today),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.notifications),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}