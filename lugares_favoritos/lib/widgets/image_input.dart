import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _imagen;
  void tomarFoto() async {
    final img = ImagePicker();
    final imagen =
        await img.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (imagen == null) return;
    setState(() {
    _imagen = File(imagen.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text("Tomar foto"),
      onPressed: tomarFoto,
    );
    if (_imagen != null)
      content = GestureDetector(
        onTap: tomarFoto,
        child: Image.file(
          _imagen!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );

    
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 2, color: Theme.of(context).primaryColor.withOpacity(0.8)),
      ),
      height: 250,
      alignment: Alignment.center,
      width: double.infinity,
      child: content,
    );
  }
}
