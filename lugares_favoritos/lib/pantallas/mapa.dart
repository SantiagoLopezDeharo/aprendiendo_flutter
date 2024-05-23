import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? selectedLocation;

  void _onTap(LatLng latlng) {
    setState(() {
      selectedLocation = latlng;
    });
  }

  void seleccionar()
  {
    Navigator.of(context).pop(selectedLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Location'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center:
                    LatLng(-34.8711, -56.1644), // San Francisco coordinates
                zoom: 12.0,
                onTap: (tapPosition, latlng) => _onTap(latlng),
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
              ],
            ),
          ),
          if (selectedLocation != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Ubicacion seleccionada: \nLatitude: ${selectedLocation!.latitude}, \nLongitude: ${selectedLocation!.longitude}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: seleccionar,
                    child: const Text("Seleccionar"),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
