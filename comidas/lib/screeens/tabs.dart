import 'package:comidas/Data/dummy_data.dart';
import 'package:comidas/modelos/comida.dart';
import 'package:comidas/screeens/categorias.dart';
import 'package:comidas/screeens/comidas.dart';
import 'package:comidas/screeens/filtros.dart';
import 'package:comidas/widgets/MenuW.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Comida> _fav = [];
  Map<Filtros, bool> filtrosValores = {
    Filtros.glutenFree: false,
    Filtros.lactoseFree: false,
    Filtros.vegan: false,
    Filtros.vegetarian: false,
  };

  List<Comida> comidas = dummyComidas;

  void _favStatus(Comida comida) {
    final isExisting = _fav.contains(comida);
    setState(() {
      if (isExisting)
        _fav.remove(comida);
      else
        _fav.add(comida);
    });
  }

  void _selectPage(int indx) {
    setState(() {
      _selectedPageIndex = indx;
    });
  }

  void _selectComidas() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => ComidasScreen(
        title: "Comidas",
        comidas: comidas,
        onFav: _favStatus,
      ),
    ));
  }

  Future<void> _selectFiltros() async {
    Navigator.of(context).pop();
    filtrosValores =
        (await Navigator.of(context).push<Map<Filtros, bool>>(MaterialPageRoute(
            builder: (ctx) => FiltrosScreen(
                  valores: filtrosValores,
                ))))!;
    setState(() {
      comidas = dummyComidas.where( (i)
    {
      if (filtrosValores[Filtros.glutenFree]! && !i.isGlutenFree)
        return false;
      if (filtrosValores[Filtros.lactoseFree]! && !i.isLactoseFree)
        return false;
      if (filtrosValores[Filtros.vegan]! && !i.isVegan)
        return false;
      if (filtrosValores[Filtros.vegetarian]! && !i.isVegetarian)
        return false;
      return true;
    }
    ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriasScreen(
      onFav: _favStatus,
      comidas: comidas,
    );

    if (_selectedPageIndex == 1)
      activePage = ComidasScreen(
        title: "Favorites",
        comidas: _fav,
        onFav: _favStatus,
      );

    return Scaffold(
      drawer: MenuW(
        onSelectComida: _selectComidas,
        onSelectFiltros: _selectFiltros,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
    );
  }
}
