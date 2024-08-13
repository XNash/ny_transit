import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ny_transit/presentation/pages/login_page.dart';

class InscriptionPage extends HookConsumerWidget {
  const InscriptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastnameCtrl = TextEditingController();
    final firstnameCtrl = TextEditingController();
    final phoneNumberCtrl = TextEditingController();
    final passwdCtrl = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Inscription",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Baloo",
                        color: Color(0xff29a3be),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: lastnameCtrl,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: const Color(0xfff2f9fb),
                        label: const Text(
                          "Nom",
                          style:
                              TextStyle(color: Color(0xff7f8da3), fontSize: 14),
                        ),
                        prefixIcon: const Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xff36a8c2),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: firstnameCtrl,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: const Color(0xfff2f9fb),
                        label: const Text(
                          "Prénom",
                          style: TextStyle(
                            color: Color(0xff7f8da3),
                            fontSize: 14,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xff36a8c2),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IntlPhoneField(
                      showCountryFlag: true,
                      controller: phoneNumberCtrl,
                      decoration: InputDecoration(
                        label: const Text(
                          "Numéro de téléphone",
                          style: TextStyle(
                            color: Color(0xff7f8da3),
                            fontSize: 14,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: const Color(0xfff2f9fb),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      disableLengthCheck: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwdCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: const Color(0xfff2f9fb),
                        label: const Text(
                          "Créer un mot de passe",
                          style: TextStyle(
                            color: Color(0xff7f8da3),
                            fontSize: 14,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Color(0xff36a8c2),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //TODO: Inscription submission
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
                            "S'inscrire",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "Ou",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "Vous avez déjà un compte?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
