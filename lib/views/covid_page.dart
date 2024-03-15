// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:ninja_api/models/covid.dart';
// import 'package:ninja_api/views/model_views/model_views.dart';

// class CovidPage extends StatelessWidget {
//   const CovidPage({super.key, required this.country});
//   final String country;
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     ModelView modelView = ModelView();

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: FutureBuilder<Covid>(
//                   future: modelView.fetchCovidData(country),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(
//                         child: SpinKitCircle(
//                           color: Color.fromARGB(255, 121, 3, 13),
//                           size: 50,
//                         ),
//                       );
//                     }

//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: ListView.builder(
//                           itemCount: snapshot.data!.cases.length,
//                           itemBuilder: (context, index) {
//                             return InkWell(
//                               onTap: () {},
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                       height: height * .18,
//                                       padding: const EdgeInsets.only(left: 15),
//                                       child: Column(
//                                         children: [
//                                           Text(
//                                             snapshot.data!.country,
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 15,
//                                                 color: Colors.black54),
//                                             maxLines: 3,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

// CustomScrollView(
//   slivers: [
//     //app bar
//     const SliverAppBar(
//       elevation: 0,
//       pinned: true,
//       centerTitle: true,
//       expandedHeight: 300.0,
//       title: Text("covid page"),
//     ),
//     //list view
//     SliverList(
//       delegate: SliverChildListDelegate(
//         [
//           Container(
//             height: 200,
//             child: FutureBuilder<Covid>(
//               future: modelView.fetchCovidData(country),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: SpinKitCircle(
//                       color: Color.fromARGB(255, 121, 3, 13),
//                       size: 50,
//                     ),
//                   );
//                 }
//                 return ListView.builder(
//                   itemCount: snapshot.data!.cases.length,
//                   itemBuilder: (context, index) {
//                     final data = snapshot.data!;
//                     return Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                       ),
//                       height: 200,
//                       width: MediaQuery.of(context).size.width,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [Text(data.country)],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     )

// Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                 ),
//                 height: 200,
//                 width: MediaQuery.of(context).size.width,
//               ),
// floatingActionButton: CircleAvatar(
//   backgroundColor: Color.fromARGB(255, 226, 68, 102),
//   child: GestureDetector(
//     onTap: () {},
//     child: Icon(
//       Icons.remove_red_eye,
//       color: Colors.white,
//     ),
//   ),
// ),
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class CovidPage extends StatefulWidget {
  const CovidPage({super.key, required this.country});
  final String country;

  @override
  // ignore: library_private_types_in_public_api
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  Future<List<dynamic>> fetchCategorieNewsApi(String country) async {
    final response = await http.get(
      Uri.parse('https://api.api-ninjas.com/v1/covid19?country=canada'),
      headers: {'X-Api-Key': 'Qn8MyOnWPV041NejReU1tg==75jFbJD0SPKpXFjY'},
    );

    // ignore: prefer_typing_uninitialized_variables
    var body;
    if (response.statusCode == 200) {
      body = jsonDecode(response.body);
    }
    // covidList.add(Covid.fromJson(body));
    return body;
  }

  int date = 1;
  int month = 1;
  int year = 0;
  int dateDebut = 22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        //app bar
        const SliverAppBar(
          elevation: 0,
          pinned: true,
          centerTitle: true,
          expandedHeight: 200.0,
          title: Text("covid page"),
        ),
        //list view
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: FutureBuilder<List<dynamic>>(
                  future: fetchCategorieNewsApi("country"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: const SpinKitCircle(
                          color: Color.fromARGB(255, 121, 3, 13),
                          size: 50,
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        if (date <= 31) {
                          date += index;
                        }
                        if (month <= 12) {
                          month += index;
                        }
                        if (year <= 4) {
                          year += index;
                        }
                        if (dateDebut <= 31) {
                          dateDebut += 1;
                        }
                        String dateDebutToString = dateDebut.toString();
                        String dateToString = date.toString();
                        String monthToString = month.toString();
                        String yearToString = year.toString();

                        String formatDate =
                            date < 10 ? '0$dateToString' : dateToString;
                        String formatMoth =
                            date < 10 ? '0$monthToString' : monthToString;
                        final data = snapshot.data![index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [Text(data['cases'][index].toString())],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

//  Center(
//         child: FutureBuilder<List<dynamic>>(
//           future: fetchCategorieNewsApi('canada'),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               // Handle and display data
//               final data = snapshot.data;
//               return Text(data![0].toString());
//             }
//           },
//         ),
//       ),