import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_coaching/captain.dart';
import 'package:live_coaching/models/auth_sections.dart';
import 'package:live_coaching/routes/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawer.dart';

class Secotions extends StatefulWidget {
  static final String routeName = home;
  @override
  State<StatefulWidget> createState() {
    return SecotionsState();
  }
}

class SecotionsState extends State<Secotions> {
  @override
  void initState() {
    getsharedUserName();
    super.initState();
  }

  getsharedUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    print("tttttttttttttttttttttttttttttttt" + token.toString());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('الأقسام'),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(146, 35, 27, 1),
            ),
            body: Container(
              padding: const EdgeInsets.all(15),
              child: FutureBuilder(
                future: Authsections().section(),
                builder: (ctx, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: GridView.builder(
                          itemCount: snapshot.data["result"].length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: width / 550,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                //height: _height / 6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10.0,
                                        offset: Offset(0.5, 20.0),
                                      ),
                                    ]),
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: Image.network(
                                        "${snapshot.data["result"][index]["image"]}",
                                        fit: BoxFit.contain,
                                      ),
                                      onTap: () => {
                                        Navigator.of(ctx).push(
                                            MaterialPageRoute(builder: (_) {
                                          return Captain(
                                            id: '${snapshot.data["result"][index]["_id"]}',
                                            namecals:
                                                '${snapshot.data["result"][index]["name"]}',
                                          );
                                        }))
                                      },
                                    ),
                                    Text(
                                      "${snapshot.data["result"][index]["name"]}",
                                      style: const TextStyle(
                                          fontSize: 23,
                                          color:
                                              Color.fromRGBO(146, 35, 27, 1)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Error");
                  }
                  return const Center(child: const Text("Loading..."));
                },
              ),
            ),
            drawer: const DrawerScreen()));
  }
}
