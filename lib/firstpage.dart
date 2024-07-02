import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Flipkart'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Top Offers'),
            Tab(text: 'Grocery'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TopOffersTab(),
          GroceryTab(),
        ],
      ),
    );
  }
}

class TopOffersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchBar(),
        CategoryIcons(),
        BannerAd(),
        OffersGrid(),
      ],
    );
  }
}

class GroceryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Grocery Page Content'),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for Products, Brands and More',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

class CategoryIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CategoryIcon(icon: Icons.local_offer, label: 'Top Offers'),
          CategoryIcon(icon: Icons.monetization_on, label: 'SuperCoin'),
          CategoryIcon(icon: Icons.store, label: 'Stores'),
          CategoryIcon(icon: Icons.feed, label: 'Feed'),
          CategoryIcon(icon: Icons.gamepad, label: 'Games'),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class BannerAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey[200],
        height: 150,
        child: Center(
            child:
                Text('Motorola Edge 30\nTriple Rear Cam 5000mh\nFROM ₹25,789')),
      ),
    );
  }
}

class OffersGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          OfferCard(label: 'Gadgets & Appl... From ₹15,999/M'),
          OfferCard(label: 'Offers on Mobile\nExplore All'),
          OfferCard(label: "Women's Hygine\nUp to 30% Off"),
         
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String label;

  OfferCard({required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(label, textAlign: TextAlign.center),
      ),
    );
  }
}
