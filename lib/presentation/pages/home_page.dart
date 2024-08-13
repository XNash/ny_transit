import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ny_transit/data/providers/app/app_data_provider.dart';
import 'package:ny_transit/data/providers/vehicule/vehicule_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  void setSelectedModele(String modele) {
    ref.read(appSelectedModeleProvider.notifier).state = modele;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final vehiculeData = ref.watch(vehiculeDataProvider);
    final vehiculeModeles = ref.watch(vehiculeModeleProvider);
    final selectedModele = ref.watch(appSelectedModeleProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                //TODO: Search vehicles
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vehiculeModeles.when(
              data: (vehiculeModeles) => SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vehiculeModeles.length,
                  itemBuilder: (context, i) {
                    if (ref.watch(appSelectedModeleProvider) ==
                        vehiculeModeles[i]) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(vehiculeModeles[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.black),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            side: WidgetStatePropertyAll(
                              BorderSide(
                                color: Colors.black,
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            setSelectedModele(vehiculeModeles[i]);
                          },
                          child: Text(vehiculeModeles[i]),
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            side: WidgetStatePropertyAll(
                              BorderSide(
                                  color: Colors.black,
                                  strokeAlign: BorderSide.strokeAlignOutside),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              error: (e, s) => Container(),
              loading: () => Text("Loading modeles..."),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vehicules favoris",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  vehiculeData.when(
                    data: (vehiculeData) => SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: vehiculeData.length,
                        itemBuilder: (context, i) {
                          final vehicule = vehiculeData[i];
                          return Column(
                            children: [
                              Card(
                                color: Colors.transparent,
                                child: SizedBox(
                                  width: 179,
                                  child: Stack(
                                    children: [
                                      Image.asset("assets/images/img_1.png"),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "SPRINTER",
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "${vehicule.marque} - ${vehicule.modele}",
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [Icon(Icons.location_on_outlined)],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    error: (err, stack) => Text("Error fetching data"),
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vehicules disponibles",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                vehiculeData.when(
                  data: (vehiculeData) => Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 3 +
                        MediaQuery.of(context).size.height / 7,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: vehiculeData.length,
                      itemBuilder: (context, i) {
                        final vehicule = vehiculeData[i];
                        return Card(
                          color: Colors.white,
                          elevation: 0,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            child: Stack(
                              children: [
                                Image.asset("assets/images/img.png"),
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "SPRINTER",
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "${vehicule.marque} - ${vehicule.modele}",
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  error: (err, stack) => Text("Error fetching data"),
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
