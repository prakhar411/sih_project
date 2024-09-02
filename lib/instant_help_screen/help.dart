import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih/auth/dialogue/dialogue.dart';
import 'package:sih/core/themes/app_pallete.dart';

class BorderedIconTextWidget extends StatelessWidget {
  // final Future<void> Function() onPressed;

  // ignore: use_key_in_widget_constructors
  const BorderedIconTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.bolt,
              color: Pallete.gradient2,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DialogueBox()),
              );
            },
          ),
          const Text('Instant Help'),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
