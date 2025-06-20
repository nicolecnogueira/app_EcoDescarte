import 'package:eco_descarte/Pages/map_page.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 108, 202, 183); // Verde-azulado claro do cabeçalho
const Color secondaryColor = Color.fromARGB(255, 73, 66, 92); // Roxo escuro do título "EcoDescarte"
const Color accentColor = Color.fromARGB(255, 123, 169, 128);   // Verde escuro dos ícones

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoDescarte',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define a paleta de cores principal do app
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,

        // Configuração da AppBar padrão para todo o app
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white, // Cor do título e ícones na AppBar
          elevation: 2,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        // Configuração da BottomNavigationBar padrão
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: secondaryColor, // Cor do ícone selecionado
          unselectedItemColor: Colors.white70, // Cor dos ícones não selecionados
          backgroundColor: primaryColor,
        ),
        
        // Define a cor de destaque para elementos como o FloatingActionButton
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor).copyWith(
          secondary: accentColor,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

// Este Widget gerencia o Scaffold principal (AppBar, Body, NavBar)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Índice da tela atualmente selecionada

  // Lista de widgets que representam o corpo de cada página na NavBar
  static const List<Widget> _widgetOptions = <Widget>[
    MapPage(), // Tela 0: Localização do ponto de coleta 
    MapPage(),    // Tela 1: Dicas sobre descarte correto 
  ];

  static const List<String> _widgetTitles = <String>[
    'Encontrar Ponto de Coleta',
    'Dicas de Descarte',
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
        title: Text("EcoDescarte"),
      ),
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            activeIcon: Icon(Icons.lightbulb),
            label: 'Dicas',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}