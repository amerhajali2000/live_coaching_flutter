import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_coaching/models/auth_sections.dart';
import 'package:live_coaching/sports_equipment.dart';

import 'drawer.dart';

class Captain extends StatefulWidget {
  final String id;
  final String namecals;
  const Captain({Key? key, required this.id, required this.namecals})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CaptainState();
  }
}

class CaptainState extends State<Captain> {
  List<Color> color = const [
    Color.fromRGBO(125, 162, 243, 1),
    Color.fromRGBO(240, 163, 94, 1),

    // Color.fromRGBO(150, 50, 244, 1),
    Color.fromRGBO(104, 225, 187, 1),
    Color.fromRGBO(125, 162, 243, 1),
    Color.fromRGBO(240, 163, 94, 1),

    // Color.fromRGBO(150, 50, 244, 1),
    Color.fromRGBO(104, 225, 187, 1),
    Color.fromRGBO(125, 162, 243, 1),
    Color.fromRGBO(240, 163, 94, 1),

    Color.fromRGBO(150, 50, 244, 1),
    Color.fromRGBO(104, 225, 187, 1),
    Color.fromRGBO(125, 162, 243, 1),
    Color.fromRGBO(240, 163, 94, 1),

    //Color.fromRGBO(150, 50, 244, 1),
    Color.fromRGBO(104, 225, 187, 1),
  ];

  List<Color> colors = const [
    Color.fromRGBO(240, 163, 94, 1),
    Color.fromRGBO(125, 162, 243, 1),

    // Color.fromRGBO(150, 50, 244, 1),
    Color.fromRGBO(104, 225, 187, 1),
    Color.fromRGBO(125, 162, 243, 1),
    Color.fromRGBO(104, 225, 187, 1),
    Color.fromRGBO(240, 163, 94, 1),
    Color.fromRGBO(104, 225, 187, 1),
    // Color.fromRGBO(150, 50, 244, 1),
    Color.fromRGBO(240, 163, 94, 1),
    Color.fromRGBO(125, 162, 243, 1),

    Color.fromRGBO(104, 225, 187, 1),
    Color.fromRGBO(150, 50, 244, 1),
    Color.fromRGBO(240, 163, 94, 1),
    Color.fromRGBO(125, 162, 243, 1),

    //Color.fromRGBO(150, 50, 244, 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text('${widget.namecals}'),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(146, 35, 27, 1),
          ),
          body: FutureBuilder(
              future: Authsections().getdatacatig('${widget.id}'),
              builder: (ctx, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data['result'].length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Container(
                          height: 125,
                          child: Card(
                            elevation: 7,
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(ctx).push(
                                              MaterialPageRoute(builder: (_) {
                                            return Sports_Equipment(
                                              name:
                                                  '${snapshot.data['result'][index]['name']}',
                                              dytails:
                                                  '${snapshot.data['result'][index]['description']}',
                                              email:
                                                  '${snapshot.data['result'][index]['email']}',
                                              image:
                                                  '${snapshot.data['result'][index]['cv']['url']}',
                                              phone:
                                                  '${snapshot.data['result'][index]['phone']}',
                                            );
                                          }));
                                        },
                                        child: Container(
                                          child: const Center(
                                            child: Text(
                                              'التفاصيل',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromRGBO(
                                                146, 35, 27, 1),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        snapshot.data['result'][index]['name'],
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundColor: const Color.fromRGBO(
                                            146, 35, 27, 1),
                                        child: CircleAvatar(
                                            radius: 38,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                                radius: 36,
                                                backgroundImage: NetworkImage(
                                                    '${snapshot.data['result'][index]['cv']['url']}'))),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("Error");
                }
                return const Center(child: Text("Loading..."));
              }),
          drawer: const DrawerScreen()),
    );
  }
}
