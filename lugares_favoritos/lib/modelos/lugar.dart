
import 'dart:io';

import 'package:uuid/uuid.dart';

final uuid = Uuid();

class LugarUbicacion
{
  const LugarUbicacion({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;
}

class Lugar
{
  Lugar( {required this.title, required this.imagen, required this.ubicacion, String ? id}) : id = id ?? uuid.v4();

  final String id;
  final String title;
  final File imagen;
  final LugarUbicacion ubicacion;
}