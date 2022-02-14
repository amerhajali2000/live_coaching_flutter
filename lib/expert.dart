import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class Expert extends StatefulWidget {
  const Expert({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ExpertState();
  }
}

class ExpertState extends State<Expert> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text('خبراء التغذية'),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(146, 35, 27, 1),
            ),
            body: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (ctx, index) {
                  return Container(
                    height: 200,
                    margin: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 20.0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            'aaaaaa',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            drawer: const DrawerScreen()));
  }
}
