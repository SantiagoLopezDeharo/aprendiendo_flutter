import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:lugares_favoritos/modelos/lugar.dart';
import 'package:lugares_favoritos/pantallas/mapa.dart';

class UbicacionInput extends StatefulWidget {
  const UbicacionInput({super.key, required this.onSleccionUbicacion});

  final Function(LugarUbicacion ubicacion) onSleccionUbicacion;
  @override
  State<UbicacionInput> createState() {
    return _UbicacionInputState();
  }
}

class _UbicacionInputState extends State<UbicacionInput> {
  LugarUbicacion? _ubicacion;
  bool _leyendoUbicacion = false;

  void _ubicacionActual() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _leyendoUbicacion = true;
    });
    locationData = await location.getLocation();
    var lat = locationData.latitude;
    var lon = locationData.longitude;
    if (lat == null || lon == null) return;

    setState(() {
      _ubicacion = LugarUbicacion(
        latitude: lat,
        longitude: lon,
      );
      _leyendoUbicacion = false;
    });

    widget.onSleccionUbicacion(_ubicacion!);
  }

  void _mapa() async {
    LatLng? location = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const MapScreen()));
    if (location == null) return;

    setState(() {
      _ubicacion = LugarUbicacion(
        latitude: location!.latitude,
        longitude: location!.longitude,
      );
    });

    widget.onSleccionUbicacion(_ubicacion!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      "No hay ubicacion todavía",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );

    if (_ubicacion != null) {
      content = FlutterMap(
        options: MapOptions(
          center: LatLng(_ubicacion!.latitude, _ubicacion!.longitude),
          zoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
        ],
      );
    }

    if (_leyendoUbicacion) content = const CircularProgressIndicator();
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: Theme.of(context).primaryColor.withOpacity(0.8)),
          ),
          child: content,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _ubicacionActual,
              label: const Text("Ubicacion actúal"),
              icon: const Icon(Icons.location_on),
            ),
            TextButton.icon(
              onPressed: _mapa,
              label: const Text("Mapa"),
              icon: const Icon(Icons.map),
            )
          ],
        )
      ],
    );
  }
}
