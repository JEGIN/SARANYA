import 'package:application1/src/views/dashboard/home_screen.dart';

import '../../../global/app_urls.dart';
import '../login_screen.dart';

class DashboardScreenWidget extends StatefulWidget {
  const DashboardScreenWidget({super.key});

  @override
  State<DashboardScreenWidget> createState() =>
      _DashboardScreenWidgetState();
}

class _DashboardScreenWidgetState
    extends State<DashboardScreenWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    CarouselWithIndicatorDemo(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.blueGrey,
    )
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
        title: const Text('DashBoard Screen'),
        
        centerTitle: true,
      ),
      
     body:Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
      Padding(
          padding:  EdgeInsets.all(10),
          
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              
            ),
            
          ),),

      Expanded(child:  Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      ),
      ],),
     
   
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black45, size: 24),
            activeIcon: Icon(Icons.home, color: Colors.amberAccent, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.black45, size: 24),
            activeIcon:
                Icon(Icons.business, color: Colors.amberAccent, size: 30),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.black45, size: 24),
            activeIcon: Icon(Icons.school, color: Colors.amberAccent, size: 30),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black45, size: 24),
            activeIcon:
                Icon(Icons.settings, color: Colors.amberAccent, size: 30),
            label: 'Settings',
          ),
        ],
       
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
