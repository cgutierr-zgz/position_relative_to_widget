import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hey there!'),
        ),
        body: const MyCoolButton(),
      ),
    );
  }
}

class MyCoolButton extends StatelessWidget {
  const MyCoolButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      // RELATIVE TO THE WIDGET
      onTapDown: (details) {
        late String quadrant;
        final renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        if (details.globalPosition.dx <
            position.dx + renderBox.size.width / 2) {
          // left side
          if (details.globalPosition.dy <
              position.dy + renderBox.size.height / 2) {
            // top left
            quadrant = 'top left ╔';
          } else {
            // bottom left
            quadrant = 'bottom left ╚';
          }
        } else {
          // right side
          if (details.globalPosition.dy <
              position.dy + renderBox.size.height / 2) {
            // top right
            quadrant = 'top right ╗';
          } else {
            // bottom right
            quadrant = 'bottom right ╝';
          }
        }
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text('You tapped the quadrant: $quadrant')),
          );
      },

      // RELATIVE TO THE WHOLE SCREEN
      /*
      onTapDown: (details) {
        late String quadrant;
        if (details.globalPosition.dx < size.width / 2) {
          // left side
          if (details.globalPosition.dy < size.height / 2) {
            // top left
            quadrant = 'top left ╔';
          } else {
            // bottom left
            quadrant = 'bottom left ╚';
          }
        } else {
          // right side
          if (details.globalPosition.dy < size.height / 2) {
            // top right
            quadrant = 'top right ╗';
          } else {
            // bottom right
            quadrant = 'bottom right ╝';
          }
        }

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text('You tapped the quadrant: $quadrant')),
          );
      },
      */
      child: Container(
        color: Colors.grey.shade400,
        height: size.height * 0.5,
        width: size.width * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              Expanded(child: MyCoolRow()),
              Expanded(child: MyCoolRow()),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCoolRow extends StatelessWidget {
  const MyCoolRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
        ),
      ],
    );
  }
}
