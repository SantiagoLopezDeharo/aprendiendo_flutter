import "package:comidas/Data/dummy_data.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final comidasProvider = Provider(
  (ref)
  {
    return dummyComidas;
  }
);