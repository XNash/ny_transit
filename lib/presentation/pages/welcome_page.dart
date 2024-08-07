import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // child: const ColoredBox(
            //   color: Color(0xff44a1ea),
            // ),
            child: Image.asset("assets/images/8.jpg"),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "NyTransit",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffe0dbf5),
                      fontSize: 26),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 13,
                      width: 13,
                      child: CircularProgressIndicator(
                        color: Color(0xffe0dbf5),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Loading",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffe0dbf5),
                          fontSize: 13),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
