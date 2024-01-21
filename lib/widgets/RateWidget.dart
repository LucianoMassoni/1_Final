import 'package:flutter/material.dart';


class RateWidget extends StatelessWidget {
  final double rate;

  const RateWidget({super.key, required this.rate});
  
  Color _getColorForRate(double rate) {
  rate /= 10;

  const double bajoRate = 0.4;
  const double altoRate = 0.6;

  // El lerp hace como una fusion de los colores.
  if (rate <= bajoRate) {
    return Color.lerp(const Color.fromARGB(255, 240, 16, 0), const Color.fromARGB(255, 255, 94, 0), rate / bajoRate)!;
  } else if (rate <= altoRate) {
    return Color.lerp(const Color.fromARGB(255, 255, 94, 0), const Color.fromARGB(255, 255, 238, 0), (rate - bajoRate) / (altoRate - bajoRate))!;
  } else {
    return Color.lerp(const Color.fromARGB(255, 255, 238, 0), const Color.fromARGB(255, 0, 255, 21), (rate - altoRate) / (1 - altoRate))!;
  }
}

  @override
  Widget build(BuildContext context) {
    Color color =_getColorForRate(rate);
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
        value: rate/10,
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation(color),
      ),
      Text(
        rate.toStringAsFixed(1),
        style: const TextStyle(
          color: Colors.white
        ),
      )
      ],
    );
  }
}