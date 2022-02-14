import 'package:flutter/material.dart';
import 'package:live_coaching/models/auth_user.dart';
import 'package:live_coaching/routes/string.dart';
import 'package:live_coaching/sections.dart';
import 'package:live_coaching/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static final String routeName = login;
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Loginstate();
  }
}

sharedUser(token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('token', token);
}

infoUser(email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('email', email);
}

class Loginstate extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(146, 35, 27, 1),
            body: Form(
              key: formkey,
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(70),
                          child: Center(
                            child: Column(
                              children: const [
                                Text(
                                  'الدخول',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Text(
                                    'مرحبا بك في التدريب المباشر',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80),
                              topRight: Radius.circular(80))),
                      child: SingleChildScrollView(
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  controller: emailController,
                                  validator: (_msg) {
                                    RegExp regexp = new RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                    if (_msg!.isEmpty) {
                                      return _msg = "البريد الألكتروني مطلوب";
                                    } else if (!regexp.hasMatch(_msg)) {
                                      return _msg = "الأيميل غير صالح";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                            width: 5.0,
                                            color: Color.fromRGBO(
                                                146, 35, 27, 1))),
                                    labelText: '    أدخل البريد الالكتروني   ',
                                    labelStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(146, 35, 27, 1),
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Color.fromRGBO(146, 35, 27, 1),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 25,
                                ),
                                child: TextFormField(
                                  validator: (val) => val!.isEmpty
                                      ? 'كلمة المرور مطلوبة'
                                      : null,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide:
                                              const BorderSide(width: 5.0)),
                                      labelText: '     أدخل كلمة المرور',
                                      labelStyle: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(146, 35, 27, 1),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            pass = !pass;
                                          });
                                        },
                                        icon: Icon(pass
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        color: Color.fromRGBO(146, 35, 27, 1),
                                      )),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: pass,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        Sign_Up.routeName,
                                      );
                                    },
                                    child: const Text(
                                      ' انشاء حساب',
                                      style: TextStyle(
                                          color: Color.fromRGBO(146, 35, 27, 1),
                                          fontSize: 16),
                                    )),
                              ),
                              InkWell(
                                  child: SizedBox(
                                    height: 70,
                                    width: 160,
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(top: 15),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            146, 35, 27, 1),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Text(
                                        'دخول',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    final form = formkey.currentState;
                                    if (form!.validate()) {
                                      form.save();
                                      print(emailController);
                                      print(passwordController);
                                      infoUser(emailController.text);
                                      Authserveruser()
                                          .loginUser(
                                              emailController.text.trim(),
                                              passwordController.text.trim())
                                          .then((val) {
                                        if (val.data['secssus']) {
                                          sharedUser(val.data['token']);
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (_) {
                                            return Secotions();
                                          }));
                                        } else {
                                          print('falsseeeeeeeeeeee');
                                        }
                                      });
                                    } else {
                                      print(
                                          'problemmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
