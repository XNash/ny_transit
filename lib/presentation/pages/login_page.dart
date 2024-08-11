import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numCtrl = TextEditingController();
    final passwdCtrl = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 1,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Connexion",
                    style: TextStyle(
                        color: Color(0xff29a3be),
                        fontSize: 25,
                        fontFamily: "Baloo"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  IntlPhoneField(
                    showCountryFlag: true,
                    decoration: InputDecoration(
                      label: Text(
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
                      fillColor: Color(0xfff2f9fb),
                    ),
                    disableLengthCheck: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: numCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none),
                      fillColor: Color(0xfff2f9fb),
                      filled: true,
                      label: Text(
                        "Mot de passe",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff7f8da3),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Color(0xff42aec6),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Text(
                        "Mot de passe oublié",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
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
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: Continue with Google
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
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
                              child: Image.asset("assets/icons/google.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
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
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: Continue with Facebook
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
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
                      child: Row(
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
            flex: 5,
          ),
        ],
      ),
    );
  }
}
