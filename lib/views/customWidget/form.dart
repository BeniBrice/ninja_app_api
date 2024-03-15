import 'package:flutter/material.dart';
import 'package:ninja_api/views/customWidget/color.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppColor appColor = AppColor();
    final height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    String name = '';

    return Scaffold(
      backgroundColor: appColor.formBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
            key: scaffoldKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  "Bienvenue sur",
                  style: TextStyle(
                    fontSize: 30,
                    color: appColor.textColor,
                  ),
                ),
                Text(
                  "Ninja api",
                  style: TextStyle(
                    fontSize: 30,
                    color: appColor.textColor,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Entrer vos donnees",
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Entrer les donnees valider";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Entrer votre numero de telephonee",
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty ||
                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                            .hasMatch(value)) {
                      return "Entrer un numero valider";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Entrer votre siter internet",
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty ||
                        !RegExp(r'^[\w-\.]+(\.)+[\w]{2,4}').hasMatch(value)) {
                      return "Entre le nom du site";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue)),
                        onPressed: () {},
                        child: Text("ytete"))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
