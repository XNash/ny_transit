import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ny_transit/data/providers/user/user_provider.dart';
import 'package:ny_transit/presentation/pages/home_page.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numCtrl = TextEditingController();
    final passwdCtrl = TextEditingController();

    final userData = ref.watch(userDataProvider);

    return Scaffold(
        body: userData.when(
            data: (userData) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Connexion",
                              style: TextStyle(
                                  color: Color(0xff29a3be),
                                  fontSize: 25,
                                  fontFamily: "Baloo"),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            IntlPhoneField(
                              controller: numCtrl,
                              showCountryFlag: true,
                              decoration: InputDecoration(
                                label: const Text(
                                  "Numéro de téléphone",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff7f8da3),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                filled: true,
                                fillColor: const Color(0xfff2f9fb),
                              ),
                              disableLengthCheck: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwdCtrl,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide.none),
                                fillColor: const Color(0xfff2f9fb),
                                filled: true,
                                label: const Text(
                                  "Mot de passe",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff7f8da3),
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Color(0xff42aec6),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                child: Text(
                                  "Mot de passe oublié",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                for (var user in userData) {
                                  if (user.phoneNumber ==
                                          numCtrl.text.padLeft(10, '0') &&
                                      user.password ==
                                          md5
                                              .convert(
                                                  utf8.encode(passwdCtrl.text))
                                              .toString()) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const HomePage()));
                                  }
                                }
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
                                    "Se connecter",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "Ou",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                //TODO: Continue with Google
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Signing with Google...",
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: const Color(0xffe7e9ed),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 18,
                                        child: Image.asset(
                                            "assets/icons/google.png")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Continuer avec Google",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                //TODO: Continue with Facebook
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Signing with Facebook...",
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: const Color(0xffe7e9ed),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.facebook_rounded,
                                      color: Color(0xff233dff),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Continuer avec Facebook",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            error: (error, s) => const Center(
                  child: Text("Error while retrieving data online"),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
