import 'package:comidas/modelos/comida.dart';
import 'package:comidas/screeens/categorias.dart';
import 'package:comidas/screeens/comidas.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget
{
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen>
{
  int _selectedPageIndex = 0;
  final List<Comida> _fav = [];

  void _favStatus(Comida comida)
  {
    final isExisting = _fav.contains(comida);
    setState(() {
      if (isExisting)
      _fav.remove(comida);
    
    else
      _fav.add(comida);
    });
  }

  void _selectPage(int indx)
  {
    setState(() {
      _selectedPageIndex = indx;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriasScreen(onFav: _favStatus,);

    if(_selectedPageIndex == 1)
      activePage = ComidasScreen(title: "Favorites", comidas: _fav, onFav: _favStatus,);
    
    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
    );
  }
}