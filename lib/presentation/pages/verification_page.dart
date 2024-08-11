import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VerificationPage extends HookConsumerWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int verifCode = 0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Code de vérification",
                    style: TextStyle(
                        color: Color(0xff29a3be),
                        fontSize: 25,
                        fontFamily: "Baloo"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            "Nous avons envoyé un code de vérification sur votre téléphone : ",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "+261 32 924 36",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  VerificationCode(
                    onCompleted: (value) {
                      verifCode = int.parse(value);
                    },
                    onEditing: (value) {},
                    length: 5,
                    fullBorder: true,
                    underlineColor: Colors.transparent,
                    fillColor: Color(0xfff6f4ff),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Vous n'avez pas reçu de code?",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  InkWell(
                    onTap: () {
                      //TODO: Send new code
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Sending code...")));
                    },
                    child: Text(
                      "Ré-envoyer le code?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  InkWell(
                    onTap: () {
                      //TODO: Select another verification method
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Changing verification method...")));
                    },
                    child: Text(
                      "Essayer une autre méthode",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  InkWell(
                    onTap: () {
                      //TODO: Send new code via email
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Sending code via email...")));
                    },
                    child: Text(
                      "Recevoir le code par email",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  //TODO: Validate code
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Verifying code...")));
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color(0xff67bed1),
                  ),
                ),
                child: SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: Text(
                      "Valider",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
