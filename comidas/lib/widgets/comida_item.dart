import 'package:comidas/modelos/comida.dart';
import 'package:comidas/screeens/comida.dart';
import 'package:comidas/widgets/comida_item_caract.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ComidaItem extends StatelessWidget {
  const ComidaItem({super.key, required this.comida});
  final Comida comida;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => ComidaScreen(comida: comida,),)
            );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(comida.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      comida.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ComidaItemProp(icon: Icons.schedule, label: "${comida.duration} min"),
                        const SizedBox(width: 12,),
                        ComidaItemProp(icon: Icons.work, label: comida.complejidad.name),
                        const SizedBox(width: 12,),
                        ComidaItemProp(icon: Icons.attach_money, label: comida.precio.name),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
