import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
void main() {
  runApp(MyApp());
}
//Jewel Irish Nohay
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apartment Application',
      theme: ThemeData(
        primaryColor: Colors.green[800],
        hintColor: Colors.green[800],
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print("SplashScreen initState");
    Timer(Duration(seconds: 6), _navigateToHome);
  }

  void _navigateToHome() {
    print("Navigating to MyHomePage");
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MyHomePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo.gif'),
              fit: BoxFit.contain,
            ),
          ),
          
        ),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Apartment Finder', style: TextStyle(color: Colors.black)),
            ],
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2196F3), Color(0xFF4CAF50)], 
                end: Alignment.bottomRight,
              ),
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.map), text: 'Street Directory'),
              Tab(icon: Icon(Icons.details), text: 'Apartment Details'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomePage(),
            StreetDirectoryTab(),
            ApartmentDetailsTab(),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.5,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Container(
            color: Colors.white.withOpacity(0),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Apartment Finder!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/animation.gif'),
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Golden Country Homes in Alangilan, Batangas City, is ideally situated near the Batangas State University - Alangilan Campus. This primarily residential subdivision is popular among students due to its close proximity to the university. The area offers a variety of dormitories, boarding houses, and apartments, catering to different budgets and needs. These accommodations provide a safe and convenient living environment for students, making it easier for them to commute to and from their classes.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


//Aira Mae S. Maranan
// Data Model Classes
class Street {
  final String name;
  final String description;
  final List<Apartment> apartments;


  Street({
    required this.name,
    required this.description,
    required this.apartments,
  });
}


class Apartment {
  final String name;
  final String contact;
  final String availability;


  Apartment({
    required this.name,
    required this.contact,
    required this.availability,
  });
}


class StreetDirectoryTab extends StatelessWidget {
  final List<Street> streets = [
    Street(
      name: 'Mercury Street',
      description: 'Golden Country Homes Alangilan Batangas City',
      apartments: [
        Apartment(
            name: 'Jona Alcande',
            contact: '0956-321-6538',
            availability: '2 girls and 1 boy'),
        Apartment(
            name: 'Clemen Cabrera',
            contact: '0923-543-1678',
            availability: '3 girls and 4 boys'),
        Apartment(
            name: 'Ana Reyes',
            contact: '0976-347-5601',
            availability: '4 girls and 4 boys'),
      ],
    ),
    Street(
      name: 'Venus Street',
      description: 'Golden Country Homes Alangilan Batangas City',
      apartments: [
        Apartment(
            name: 'Veronica Mendez',
            contact: '0954-123-7890',
            availability: '5 girls'),
        Apartment(
            name: 'Clarissa Pilapil',
            contact: '0980-540-4267',
            availability: '2 girls and 1 boy'),
        Apartment(
            name: 'Trisha Tolentino',
            contact: '0915-054-3458',
            availability: '1 girl and 3 boys'),
      ],
    ),
    Street(
      name: 'Earth Street',
      description: 'Golden Country Homes Alangilan Batangas City',
      apartments: [
        Apartment(
            name: 'Lani Contez',
            contact: '0976-234-5432',
            availability: '3 girls and 2 boys'),
        Apartment(
            name: 'Vhea Gardo',
            contact: '0954-603-8294',
            availability: '1 girl'),
        Apartment(
            name: 'Grace Hansen',
            contact: '0946-501-4682',
            availability: '3 girls and 3 boys'),
      ],
    ),
    Street(
      name: 'Mars Street',
      description: 'Golden Country Homes Alangilan Batangas City',
      apartments: [
        Apartment(
            name: 'Joseph Pedel',
            contact: '0962-543-9678',
            availability: '4 girls '),
        Apartment(
            name: 'Danice Chua',
            contact: '0923-530-6301',
            availability: '2 girls and 3 boys'),
        Apartment(
            name: 'Bea Cambao',
            contact: '0967-350-1567',
            availability: ' 4 boys'),
      ],
    ),
    Street(
      name: 'Jupiter Street',
      description: 'Golden Country Homes Alangilan Batangas City',
      apartments: [
        Apartment(
            name: 'Ryan Cayabyab',
            contact: '0976-477-2485',
            availability: '2 girls and 1 boy'),
        Apartment(
            name: 'Vhon Danilo',
            contact: '0913-704-8243',
            availability: '5 girls and 3 boys'),
        Apartment(
            name: 'Tisoy Fedli',
            contact: '0940-561-6055',
            availability: '1 girl and 2 boys'),
      ],
    ),
    Street(
      name: 'Saturn Street',
      description: 'Golden Country Homes Alangilan Batangas City',
      apartments: [
        Apartment(
            name: 'Leni Salazar',
            contact: '0976-477-2485',
            availability: '5 girls'),
        Apartment(
            name: 'Yhane Quezo',
            contact: '0970-580-342',
            availability: '3 girls'),
        Apartment(
            name: 'Danilo Zances',
            contact: '0980-101-3365',
            availability: '4 boys'),
      ],
    ),
    Street(
      name: 'Uranus Street',
      description: 'Golden Country Homes Alangilan Batangas City',
      apartments: [
        Apartment(
            name: 'Cleya Clanos',
            contact: '0943-564-7351',
            availability: '2 girls and 1 boy'),
        Apartment(
            name: 'Cleavel Monsan',
            contact: '0962-256-9884',
            availability: '6 girls and 1 boy'),
        Apartment(
            name: 'Cleya lanos',
            contact: '0943-564-7351',
            availability: '3 boys'),
      ],
    ),
    Street(
      name: 'Neptune Street',
      description: 'Golden Country Homes Alangilan Batangas City',
      apartments: [
        Apartment(
            name: 'Hannah Manalastas',
            contact: '0952-613-7325',
            availability: '3 girls and 2 boy'),
        Apartment(
            name: 'Ahanna Smith',
            contact: '0955-780-2399',
            availability: '6 boys'),
      ],
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Street Directory'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: streets.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                streets[index].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(streets[index].description),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StreetDetailPage(street: streets[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


class StreetDetailPage extends StatelessWidget {
  final Street street;


  StreetDetailPage({required this.street});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(street.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: street.apartments.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Apartment Available',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.grey[600]),
                        SizedBox(width: 8),
                        Text(
                          street.apartments[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.grey[600]),
                        SizedBox(width: 8),
                        Text(
                          'Contact: ${street.apartments[index].contact}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.home, color: Colors.grey[600]),
                        SizedBox(width: 8),
                        Text(
                          'Availability: ${street.apartments[index].availability}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


//Yasmin Galak
class ApartmentDetailsTab extends StatefulWidget {
  @override
  _ApartmentDetailsTabState createState() => _ApartmentDetailsTabState();
}


class _ApartmentDetailsTabState extends State<ApartmentDetailsTab> {
  final List<Map<String, dynamic>> apartments = [
    {
      'image': 'assets/picture1.webp',
      'details': 'Mars Street: 2 bed, 1 bath, 1200 sqft, \$3500/month',
      'owner': 'Joseph Pedel',
      'contact': '0962-543-9678',
      'beds': 2,
      'baths': 1,
      'sqft': 1200,
      'rent': 3500,
    },
    {
      'image': 'assets/picture2.jpg',
      'details': 'Mars Street: 5 bed, 1 bath, 1500 sqft, \$3500/month',
      'owner': 'Danice Chua',
      'contact': '0923-530-6301',
      'beds': 5,
      'baths': 1,
      'sqft': 1500,
      'rent': 3500,
    },
    {
      'image': 'assets/picture3.jpg',
      'details': 'Mars Street: 4 bed, 2 bath, 2500 sqft, \$4000/month',
      'owner': 'Bea Cambao',
      'contact': '0967-530-1567',
      'beds': 4,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture4.jpg',
      'details': 'Jupiter street: 3 bed, 1 bath, 1200 sqft, \$2500/month',
      'owner': 'Ryan Cayabyab',
      'contact': '0976-477-2485',
      'beds': 3,
      'baths': 1,
      'sqft': 1200,
      'rent': 2500,
    },
    {
      'image': 'assets/picture5.jpg',
      'details': 'Jupiter Street: 8 bed, 2 bath, 3500 sqft, \$6500/month',
      'owner': 'Vhon Danilo',
      'beds': 8,
      'baths': 2,
      'sqft': 3500,
      'rent': 6500,
    },
    {
      'image': 'assets/picture6.jpg',
      'details': 'Jupiter Street: 5 bed, 2 bath, 2500 sqft, \$4000/month',
      'owner': 'Tisoy Fedli',
      'contact': '0940-561-6055',
      'beds': 5,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture7.jpg',
      'details': 'Saturn Street: 6 bed, 1 bath, 1200 sqft, \$3500/month',
      'owner': 'Leni Salazar',
      'contact': '0976-477-2485',
      'beds': 6,
      'baths': 1,
      'sqft': 1200,
      'rent': 3500,
    },
    {
      'image': 'assets/picture8.jpg',
      'details': 'Saturn Street: 4 bed, 1 bath, 1500 sqft, \$3500/month',
      'owner': 'Yhane Quezo',
      'contact': '0970-580-342',
      'beds': 4,
      'baths': 1,
      'sqft': 1500,
      'rent': 3500,
    },
    {
      'image': 'assets/picture9.jpg',
      'details': 'Saturn Street: 5 bed, 2 bath, 2500 sqft, \$4000/month',
      'owner': 'Danilo Zances',
      'contact': '0980-101-3365',
      'beds': 5,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture10.jpg',
      'details': 'Uranus Street: 3 bed, 1 bath, 1200 sqft, \$2500/month',
      'owner': 'Cleya Clanos',
      'contact': '0943-564-7351',
      'beds': 3,
      'baths': 1,
      'sqft': 1200,
      'rent': 2500,
    },
    {
      'image': 'assets/picture11.jpg',
      'details': 'Uranus Street: 8 bed, 2 bath, 1500 sqft, \$3500/month',
      'owner': 'Cleave; Monsan',
      'contact': '0962-256-9884',
      'beds': 8,
      'baths': 2,
      'sqft': 1500,
      'rent': 3500,
    },
    {
      'image': 'assets/picture12.jpg',
      'details': 'Uranus Street: 5 bed, 2 bath, 2500 sqft, \$4000/month',
      'owner': 'Cleya Lanos',
      'contact': '0943-564-7351',
      'beds': 5,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture13.webp',
      'details': 'Neptune Street: 6 bed, 2 bath, 1200 sqft, \$2500/month',
      'owner': 'Hannah Manalastas',
      'contact': '0952-613-7325',
      'beds': 6,
      'baths': 2,
      'sqft': 1200,
      'rent': 2500,
    },
    {
      'image': 'assets/picture14.jpg',
      'details': 'Neptune Street: 6 bed, 1 bath, 1500 sqft, \$3500/month',
      'owner': 'Ahanna Smith',
      'contact': '0955-780-2399',
      'beds': 6,
      'baths': 1,
      'sqft': 1500,
      'rent': 3500,
    },
    {
      'image': 'assets/picture15.jpg',
      'details': 'Mercury Street: 5 bed, 2 bath, 2500 sqft, \$4000/month',
      'owner': 'Jona Alcande',
      'contact': '0956-321-6538',
      'beds': 5,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture16.jpg',
      'details': 'Mercury Street: 8 bed, 2 bath, 2500 sqft, \$4000/month',
      'owner': 'Clemen Cabrera',
      'contact': '0923-543-1678',
      'beds': 8,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture17.jpg',
      'details': 'Mercury Street: 10 bed, 2 bath, 4500 sqft, \$7000/month',
      'owner': 'Ana Reyes',
      'contact': '0976-347-5601',
      'beds': 5,
      'baths': 2,
      'sqft': 4500,
      'rent': 7000,
    },
    {
      'image': 'assets/picture18.jpg',
      'details': 'Venus Street: 5 bed, 1 bath, 2500 sqft, \$4000/month',
      'owner': 'Veronica Mendez',
      'contact': '0954-123-7890',
      'beds': 5,
      'baths': 1,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture19.jpg',
      'details': 'Venus Street: 5 bed, 2 bath, 2500 sqft, \$4000/month',
      'owner': 'Clarissa Pilapil',
      'contact': '0980-540-4267',
      'beds': 5,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture20.jpg',
      'details': 'Venus Street: 5 bed, 2 bath, 2500 sqft, \$4000/month',
      'owner': 'Trisha Tolentino',
      'contact': '0915-054-3458',
      'beds': 5,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture21.jpg',
      'details': 'Earth Street: 5 bed, 2 bath, 2500 sqft, \$4000/month',
      'owner': 'Lani Cortez',
      'contact': '0976-234-5432',
      'beds': 5,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture22.jpg',
      'details': 'Earth Street: 5 bed, 1 bath, 2500 sqft, \$4000/month',
      'owner': 'Vhea Gardo',
      'contact': '0954-603-8294',
      'beds': 6,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
    {
      'image': 'assets/picture23.jpg',
      'details': 'Earth Street: 8 bed, 2 bath, 2500 sqft, \$4000/month',
      'owner': 'Grace Hansen',
      'contact': '0946-501-4682',
      'beds': 8,
      'baths': 2,
      'sqft': 2500,
      'rent': 4000,
    },
  ];


  List<Map<String, dynamic>> filteredApartments = [];
  TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    filteredApartments = apartments;
    super.initState();
  }


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  void filterApartments(String query) {
    List<Map<String, dynamic>> _searchList = [];
    _searchList.addAll(apartments);


    if (query.isNotEmpty) {
      List<Map<String, dynamic>> _searchResult = [];
      _searchList.forEach((item) {
        if (item['details'].toLowerCase().contains(query.toLowerCase()) ||
            item['owner'].toLowerCase().contains(query.toLowerCase())) {
          _searchResult.add(item);
        }
      });
      setState(() {
        filteredApartments = _searchResult;
      });
      return;
    } else {
      setState(() {
        filteredApartments = apartments;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              filterApartments(value);
            },
            decoration: InputDecoration(
              labelText: 'Search Streets and Owners',
              hintText: 'Enter a keyword',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: filteredApartments.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ApartmentDetailScreen(
                        apartment: filteredApartments[index],
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          filteredApartments[index]['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredApartments[index]['details'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.king_bed, color: Colors.white, size: 12),
                                  SizedBox(width: 5),
                                  Text(
                                    '${filteredApartments[index]['beds']} Beds',
                                    style: TextStyle(color: Colors.white, fontSize: 10),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.bathtub, color: Colors.white, size: 12),
                                  SizedBox(width: 5),
                                  Text(
                                    '${filteredApartments[index]['baths']} Bath',
                                    style: TextStyle(color: Colors.white, fontSize: 10),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.square_foot, color: Colors.white, size: 12),
                                  SizedBox(width: 5),
                                  Text(
                                    '${filteredApartments[index]['sqft']} sqft',
                                    style: TextStyle(color: Colors.white, fontSize: 10),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                '\$${filteredApartments[index]['rent']}/month',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


class ApartmentDetailScreen extends StatelessWidget {
  final Map<String, dynamic> apartment;


  ApartmentDetailScreen({required this.apartment});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apartment Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(apartment['image'], width: double.infinity, height: 200, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                apartment['details'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Owner: ${apartment['owner']}', style: TextStyle(fontSize: 16)),
              Text('Contact: ${apartment['contact']}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.king_bed),
                  SizedBox(width: 5),
                  Text('${apartment['beds']} Beds'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.bathtub),
                  SizedBox(width: 5),
                  Text('${apartment['baths']} Baths'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.square_foot),
                  SizedBox(width: 5),
                  Text('${apartment['sqft']} sqft'),
                ],
              ),
              SizedBox(height: 10),
              Text(
                '\$${apartment['rent']}/month',
                style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
