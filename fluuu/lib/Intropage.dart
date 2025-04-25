import 'package:flutter/material.dart';
import 'package:fluuu/About_page.dart';
import 'package:fluuu/saved_data.dart';
import 'first_page.dart'; // Importez le fichier de la première page
import 'second_page.dart'; // Importez le fichier de la deuxième page
import 'package:google_nav_bar/google_nav_bar.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  _IntropageState createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  int _selectedIndex = 0; // Index par défaut sélectionné

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index; // Mettre à jour l'index sélectionné
    });

    // Naviguer vers la page associée si l'onglet "Saved" est sélectionné
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SavedData()),
      ).then((_) {
        // Réinitialiser l'index lorsque vous revenez à Intropage
        setState(() {
          _selectedIndex = 0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _selectedIndex = 0;
        });
        return true; // Permettre le retour
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Ouvre le tiroir
                },
                icon: Icon(Icons.menu_outlined),
              );
            },
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset(
                  'lib/images/logo-no-background1.png',
                  color: Colors.white,
                ),
              ),
              // Liste des éléments du tiroir
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text('Home', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Action lors du clic sur "Home"
                  Navigator.pop(context); // Ferme le tiroir
                },
              ),
              ListTile(
                leading: Icon(Icons.description, color: Colors.white),
                title: Text('About Us', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Action lors du clic sur "Saved"
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
            ), // Ajustez cette valeur pour le décalage vertical
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Column(
                  children: [
                    Image.asset(
                      'lib/images/logo-no-background1.png',
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 10,
                    ), // Espacement entre l'image et le texte
                    // Premier Container
                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstNotePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'Take a textual Note',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ), // Espacement entre les deux conteneurs
                    // Deuxième Container
                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VoiceNotePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'Take a Vocal Note',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.grey[300],
          child: GNav(
            tabActiveBorder: Border.all(color: Colors.white),
            tabBackgroundColor: Colors.grey.shade100,
            activeColor: Colors.grey.shade700,
            mainAxisAlignment: MainAxisAlignment.center,
            selectedIndex: _selectedIndex,
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.save_outlined, text: 'Saved'),
            ],
            onTabChange: _onTabChange,
          ),
        ),
      ),
    );
  }
}
