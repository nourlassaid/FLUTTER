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

  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

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
      if (upperTabIdx == 0) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200, // Adjust the height as needed
                child: Image.asset('assets/img/logo.png',
              
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Le Crowdfunding, c’est quoi ?',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Le crowdfunding est un mécanisme qui a pour objectif de collecter les apports financiers d’un grand nombre de particuliers au moyen d’une plateforme Internet. L’objectif de cette collecte est, sur GlobeDreamers, le financement de projets sur des voyages engagés.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '« Longue est la route par le précepte, courte et facile par l’exemple. »\n\nSénèque',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Mais GlobeDreamers ce n’est pas qu’un simple outil de financement participatif, c’est aussi un outil de sponsoring, de parrainage médiatique et associatif. Et enfin, c’est l’écosystème le plus complet pour réunir tous les éléments et partenaires nécessaires pour créer, financer et raconter son voyage engagé.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Add logic for creating a project
                      },
                      child: Text('Créé ton projet !'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Add logic for determining the cagnotte
                      },
                      child: Text('Détermine ta cagnotte !'),
                    ),
                  ],
                ),
              ),
            ],
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
          // Ajoutez ici le reste du contenu de votre onglet "Comment cela fonctionne"
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
          backgroundColor: Color.fromARGB(255, 226, 113, 7),
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

  void _navigateToSearchPage(BuildContext context) {
    // Ajoutez ici la logique de navigation vers la page de recherche
  }
}

class CategoriesListView extends StatelessWidget {
  final VoidCallback? onOptionsButtonPressed;
  final List<String> options;

  CategoriesListView({this.onOptionsButtonPressed, required this.options});

  @override
  Widget build(BuildContext context) {
    List<CategoryItem> categories = [
      CategoryItem('Santé', 'assets/img/sante.png', 'Des frais médicaux ? Créez une cagnotte ! Lancez une cagnotte et réglez de suite vos dépenses de santé.'),
      CategoryItem('Education', 'assets/img/education.png', 'Des études à financer ? Créez une cagnotte !Lancez une cagnotte pour régler rapidement des frais de scolarité.'),
      CategoryItem('Associations', 'assets/img/associations.png', 'Changez les choses grâce à une collecte de fonds au profit dune association à but non lucratif.'),
      CategoryItem('Idée de Projet', 'assets/img/idee.png', 'Description pour les idées de projet'),
      CategoryItem('Animaux', 'assets/img/animaux.png', 'Découvrez les cagnottes dédiées aux animaux Faites un don ou lancez une cagnotte pour aider un proche.'),
    ];

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categories[index].name),
          subtitle: Text(categories[index].description),
          leading: CircleAvatar(
            backgroundImage: AssetImage(categories[index].imagePath),
          ),
          onTap: () {
            // Ajoutez ici la logique lorsque l'utilisateur clique sur une catégorie
          },
        );
      },
    );
  }
}

class CategoryItem {
  final String name;
  final String imagePath;
  final String description;

  CategoryItem(this.name, this.imagePath, this.description);
}
