import 'package:flutter/material.dart';
import 'package:ninja_api/repository/covid_repository.dart';
import 'package:ninja_api/views/covid_page.dart';
import 'package:ninja_api/views/dns_page.dart';
import 'package:ninja_api/views/model_views/model_views.dart';
import 'package:ninja_api/views/telephone_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    Icon bottomIcon(
        {required IconData? iconName,
        double size = 20,
        required Color? color}) {
      Icon icon;

      icon = Icon(
        iconName,
        size: size,
        color: color,
      );

      return icon;
    }

    Text label(String labelText) {
      Text text;
      text = Text(
        labelText,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      );
      return text;
    }

    // for making our design responsive

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ninja api"),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: MaterialStateProperty.all(
            const IconThemeData(
              color: Colors.white,
            ),
          ),
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white)),
        ),
        child: NavigationBar(
          onDestinationSelected: (value) => setState(() {
            index = value;
          }),
          animationDuration: const Duration(seconds: 2),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          backgroundColor: Colors.black,
          selectedIndex: index,
          destinations: const [
            NavigationDestination(
              label: "DNS",
              icon: Icon(Icons.group),
            ),
            NavigationDestination(
              label: "COVID",
              icon: Icon(Icons.group),
            ),
            NavigationDestination(
              label: "TELEPHONE",
              icon: Icon(Icons.group),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height / 2 - 100,
            child: Positioned(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1581263518256-ba4a28ed5517?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNlYXJjaHxlbnwwfHwwfHx8MA%3D%3D"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Entrer vos informations",
                  style: TextStyle(
                    color: Color.fromRGBO(
                      49,
                      39,
                      79,
                      1,
                    ),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(
                          196,
                          135,
                          198,
                          1,
                        ),
                        blurRadius: 20,
                        offset: Offset(
                          0,
                          10,
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Entre votre text ici",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(
                        49,
                        39,
                        79,
                        1,
                      )),
                  child: GestureDetector(
                    onTap: () async {
                      // ModelView().fetchCovidData('country');
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => index == 0
                      //         ? CovidPage(country: controller.text.trim())
                      //         : index == 1
                      //             ? CovidPage(country: controller.text.trim())
                      //             : const TelephonePage(),
                      //   ),
                      // );
                    },
                    child: Center(
                      child: Text(
                        "Valider",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
