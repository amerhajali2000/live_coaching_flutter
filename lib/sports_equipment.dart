import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawer.dart';

class Sports_Equipment extends StatefulWidget {
  final String name;
  final String phone;
  final String email;
  final String image;
  final String dytails;

  const Sports_Equipment(
      {Key? key,
      required this.name,
      required this.phone,
      required this.email,
      required this.image,
      required this.dytails})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Sports_EquipmentState();
  }
}

class Sports_EquipmentState extends State<Sports_Equipment> {
  @override
  Widget build(BuildContext context) {
    // final Uri params = Uri(
    //   scheme: 'mailto',
    //   path: '${widget.email}',
    //   query:
    //       'subject=App Feedback&body=App Version 3.23', //add subject and body here
    // );
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text('${widget.name}'),
              centerTitle: true,
              backgroundColor: const Color.fromRGBO(146, 35, 27, 1),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.network(
                      '${widget.image}',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(146, 35, 27, 1),
                        ),
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.phone),
                          onPressed: () async {
                            await FlutterPhoneDirectCaller.callNumber(
                                '${widget.phone}');
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${widget.phone}",
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(146, 35, 27, 1),
                        ),
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.chat),
                          onPressed: () async {
                            sendMessage('');
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Whatsapp",
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(146, 35, 27, 1),
                        ),
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () async {
                              _sendEmail();
                            },
                            icon: const Icon(Icons.email)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${widget.email}",
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(146, 35, 27, 1),
                        ),
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () async {
                              _launchGooglemeet();
                            },
                            icon: const Icon(Icons.group)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Google Meet",
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  widget.dytails != null
                      ? Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color:
                                          const Color.fromRGBO(146, 35, 27, 1),
                                    ),
                                    child: const Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FittedBox(
                              fit: BoxFit.fill,
                              child: SizedBox(
                                width: 300,
                                height: 150,
                                child: SingleChildScrollView(
                                  child: Text(
                                    "${widget.dytails}",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
            drawer: const DrawerScreen()));
  }

  _sendEmail() {
    print('eeeeeeeeeee');
    final Uri params =
        Uri(scheme: 'mailto', path: '${widget.email}', queryParameters: {
      'subject': 'الموضوع',
      'body': 'اكتب رسالتك هنا',
    }

            //add subject and body here
            );
    launch(params.toString());
  }

  final snackbar = const SnackBar(
    content: Text("Enter valid mobile number"),
    backgroundColor: Colors.red,
  );

  void sendMessage(context) {
    var phone = widget.phone;
    var message = "مرحبا كيف الحال ";
    if (phone.length < 9) {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      _launchURL(phone, message);
    }
  }

  void _launchURL(phone, message) async => await canLaunch(
          'https://api.whatsapp.com/send?phone=962$phone&text=$message')
      ? await launch(
          'https://api.whatsapp.com/send?phone=962$phone&text=$message')
      : throw 'Could not launch WhatsApp';
}

_launchGooglemeet() async {
  const url = "https://meet.google.com/?pli=1";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
