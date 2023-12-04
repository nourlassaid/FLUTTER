import 'package:flutter/material.dart';
import 'drawer_page.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with AutomaticKeepAliveClientMixin {
  int _currentBottomBarIndex = 0;
  bool _showBottomBar = false;

  final _tabs = [
    Center(child: Text('Bottom Tab 3')),
    Center(child: Text('Bottom Tab 2')),
  ];

  @override
  bool get wantKeepAlive => true;

  Widget _changeUpperTab(int upperTabIdx) {
    if (_showBottomBar) {
      return Scaffold(
        body: _tabs[_currentBottomBarIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentBottomBarIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.yellow,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentBottomBarIndex = index;
            });
          },
        ),
      );
    } else {
      List<String> options = ['Option 1', 'Option 2', 'Option 3'];
      if (upperTabIdx == 0) {
        return ListWheelScrollView(
          itemExtent: 200,
          children: List.generate(
            5,
            (index) => Card(
              child: Image.network(
                'https://example.com/image_$index.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      } else if (upperTabIdx == 1) {
        return CategoriesListView(onOptionsButtonPressed: _handleOptionsButton, options: options);
      } else if (upperTabIdx == 2) {
        return _buildCommentCaFonctionneTab();
      } else {
        return Center(child: Text('Tab ' + upperTabIdx.toString()));
      }
    }
  }

  Widget _buildCommentCaFonctionneTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comment cela fonctionne',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 16),
          Text(
            'Bienvenue dans la section "Comment cela fonctionne" de notre application.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            '1. Comment fonctionne le crowdfunding?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            '   Le crowdfunding, ou financement participatif, est un moyen de collecter des fonds auprès d\'un grand nombre de personnes pour financer un projet.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            '2. Qu\'est-ce que le financement participatif?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            '   Le financement participatif est une méthode de collecte de fonds où un grand nombre de personnes contribuent financièrement à un projet ou à une cause.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            '3. Comment fonctionne la collecte de fonds en équipe?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            '   La collecte de fonds en équipe permet à un groupe de personnes de collaborer pour atteindre un objectif financier commun.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add logic to start a new crowdfunding campaign
                  print('Démarrer une cagnotte button clicked');
                },
                child: Text('Démarrer une cagnotte'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add logic to handle the connect button
                  print('Se connecter button clicked');
                },
                child: Text('Se connecter'),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              // Add logic to navigate to the "How Crowdfunding Works" page
              print('How Crowdfunding Works link clicked');
            },
            child: Text('Comment fonctionne le crowdfunding?'),
          ),
          TextButton(
            onPressed: () {
              // Add logic to navigate to the "What is Crowdfunding?" page
              print('What is Crowdfunding? link clicked');
            },
            child: Text('Qu\'est-ce que le financement participatif?'),
          ),
          TextButton(
            onPressed: () {
              // Add logic to navigate to the "Team Fundraising" page
              print('Team Fundraising link clicked');
            },
            child: Text('Comment fonctionne la collecte de fonds en équipe?'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       appBar: AppBar(
          title: Text(
            'Crowdfunding Cagnotte',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 128, 11, 11),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  'Welcome',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Catégories',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Comment cela fonctionne',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          actions: [
              IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _navigateToSearchPage(context);
              },
            ),
            
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print('Notification icon clicked');
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            _changeUpperTab(0),
            _changeUpperTab(1),
            _changeUpperTab(2),
          ],
        ),
        drawer: DrawerPage(),
      ),
    );
  }

  void _handleOptionsButton() {
    print('Options button clicked');
  }
}

void _navigateToSearchPage(BuildContext context) {
}

class CategoriesListView extends StatelessWidget {
  final VoidCallback? onOptionsButtonPressed;
  final List<String> options;

  CategoriesListView({this.onOptionsButtonPressed, required this.options});

  @override
  Widget build(BuildContext context) {
    List<CategoryItem> categories = [
      CategoryItem('Sante ', 'assets/img/sante.png'),
      CategoryItem('Animaux', 'assets/img/animaux.png'),
      CategoryItem('associations', 'assets/img/associations.png'),
      CategoryItem('idee de projet', 'assets/img/idee.png'),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              PopupMenuButton<String>(
                onSelected: (String value) {
                  if (value == 'options') {
                    onOptionsButtonPressed?.call();
                  }
                },
                itemBuilder: (BuildContext context) {
                  return options.map((String option) {
                    return PopupMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList();
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(categories[index].name),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(categories[index].imagePath),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryItem {
  final String name;
  final String imagePath;

  CategoryItem(this.name, this.imagePath);
}
