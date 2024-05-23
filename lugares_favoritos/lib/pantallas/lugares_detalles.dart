import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:lugares_favoritos/modelos/lugar.dart';

class LugaresDetallesScreen extends StatelessWidget {
  const LugaresDetallesScreen({super.key, required this.lugar});
  final Lugar lugar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lugar.title),
      ),
      body: Stack(
        children: [
          Image.file(
            lugar.imagen,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90)
                  ),
                  width: double.infinity,
                  height: 150,
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(
                          lugar.ubicacion.latitude, lugar.ubicacion.longitude),
                      zoom: 15.0,
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
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  alignment: Alignment.center,
                  child: Text(
                      textAlign: TextAlign.center,
                      "latitude ${lugar.ubicacion.latitude}, longitud ${lugar.ubicacion.longitude}",
                      style: const TextStyle(backgroundColor: Colors.black, color: Colors.white),
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
