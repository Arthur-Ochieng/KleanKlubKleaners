import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({ Key? key }) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Klean Klub"),
      ),
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label:'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
        ],
      ),
      body: getBodyWidget(),
    );
  }
  getBodyWidget(){
    return (_currentIndex == 0)? BoxPage(): Container();
  }
}


class BoxPage extends StatelessWidget {
  BoxPage({ Key? key }) : super(key: key);

var services = [
  "Home Cleaning Services"
  "Office Cleaning Services"
  "Industrial and Equipment Cleaning"
  "Carpet Cleaning Services"
  "Sofa Cleaning Services"
  "Deep Cleaning Services"
];

var images = [
  "assets/broom.png"
  "assets/house.png"
  "assets/offices.png"
  "assets/vacuum.png"
];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/KK.png", height: 50, width: 50,),
              const Padding(
                padding: EdgeInsets.all(20), 
                child: Text("Carpet Cleaning Services", 
                  textAlign: TextAlign.center,
                  style: TextStyle( fontSize: 16, height: 1.2, fontWeight: FontWeight.bold,),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}