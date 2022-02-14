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
      backgroundColor: Colors.blueAccent,
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
  const BoxPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: Column(
            
          ),
        );
      },
    );
  }
}