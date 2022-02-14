import 'package:flutter/material.dart';
import 'package:live_coaching/login.dart';
import 'package:live_coaching/routes/string.dart';
import 'package:live_coaching/sections.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  TextEditingController nameController = TextEditingController();
  String? name;
  String? email;
  getsharedName() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
    });
  }

  @override
  void initState() {
    getsharedName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: _width / 1.3,
      child: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 230,
                  decoration: const BoxDecoration(
                      color: const Color.fromRGBO(146, 35, 27, 1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     top: 35,
                        // ),
                        // child: CircleAvatar(
                        //     radius: 63,

                        //       //
                        //       child: CircleAvatar(
                        //         radius: 60.0,
                        //         child: Padding(
                        //             padding: const EdgeInsets.only(top: 70),
                        //             child: Container(
                        //               margin: const EdgeInsets.only(left: 90),
                        //               height: 35,
                        //               width: 35,
                        //               decoration: BoxDecoration(
                        //                   borderRadius:
                        //                       BorderRadius.circular(200),
                        //                   color: Colors.black),
                        //               child: Center(
                        //                 child: IconButton(
                        //                   icon: const Icon(
                        //                     Icons.add_a_photo_outlined,
                        //                     size: 20,
                        //                     color: Colors.white,
                        //                   ),
                        //                   onPressed: () {
                        //                     // this.getImage(ImageSource.camera);
                        //                   },
                        //                 ),
                        //               ),
                        //             )),
                        //       )),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                        ),
                        Text(
                          '$email',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    height: 50,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(220, 220, 220, 1)),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.home,
                            size: 25,
                            color: Color.fromRGBO(146, 35, 27, 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 35),
                            child: Text(
                              'الصفحة الرئيسية',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(146, 35, 27, 1)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 25,
                              color: Color.fromRGBO(146, 35, 27, 1),
                            ),
                          )
                        ],
                      ),
                      onPressed: () => {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Secotions.routeName,
                            (Route<dynamic> route) => false)
                        // Navigator.of(context)
                        //     .pushReplacement(MaterialPageRoute(builder: (_) {
                        //   return Secotions();
                        // }))
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    height: 50,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(220, 220, 220, 1)),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.logout_outlined,
                            size: 25,
                            color: Color.fromRGBO(146, 35, 27, 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 35),
                            child: Text(
                              'تسجيل الخروج',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(146, 35, 27, 1)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 25,
                              color: Color.fromRGBO(146, 35, 27, 1),
                            ),
                          )
                        ],
                      ),
                      onPressed: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.clear();

                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Login.routeName, (Route<dynamic> route) => false);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
