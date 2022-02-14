import 'package:flutter/material.dart';
import 'package:live_coaching/login.dart';
import 'package:live_coaching/models/auth_user.dart';
import 'package:live_coaching/routes/string.dart';
import 'package:live_coaching/sections.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign_Up extends StatefulWidget {
  static final String routeName = register;
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Sign_Upstate();
  }
}

class Sign_Upstate extends State<Sign_Up> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  bool pass = true;

  sharedUser(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
  }

  infoUser(name, email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', name);

    await prefs.setString('email', email);
  }

  @override
  Widget build(BuildContext context) {
    // double? _width = MediaQuery.of(context).size.width;
    // double? _height = MediaQuery.of(context).size.height;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(146, 35, 27, 1),
            body: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(80),
                        child: Center(
                          child: Column(
                            children: const [
                              Text(
                                'تسجيل',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80))),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: formkey,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 16, bottom: 17),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty
                                        ? 'اسم المستخدم مطلوب'
                                        : null,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      focusColor:
                                          Color.fromRGBO(146, 35, 27, 1),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                            width: 5.0,
                                          )),
                                      labelText: ' اسم المستخدم',
                                      labelStyle: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(146, 35, 27, 1),
                                      ),
                                      suffixIcon: const Icon(
                                        Icons.account_circle_outlined,
                                        color: Color.fromRGBO(146, 35, 27, 1),
                                      ),
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                                Container(
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
                                      focusColor:
                                          Color.fromRGBO(146, 35, 27, 1),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                              width: 5.0,
                                              color: Color.fromRGBO(
                                                  146, 35, 27, 1))),
                                      labelText: 'البريد الألكتروني',
                                      labelStyle: TextStyle(
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
                                  padding: const EdgeInsets.only(top: 17),
                                  child: TextFormField(
                                    controller: phoneController,
                                    validator: (val) => val!.isEmpty
                                        ? 'رقم الهاتف مطلوب'
                                        : null,
                                    decoration: InputDecoration(
                                      focusColor:
                                          Color.fromRGBO(146, 35, 27, 1),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                              width: 5.0,
                                              color: Color.fromRGBO(
                                                  146, 35, 27, 1))),
                                      labelText: 'رقم الهاتف',
                                      labelStyle: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(146, 35, 27, 1),
                                      ),
                                      suffixIcon: const Icon(
                                        Icons.phone_android_outlined,
                                        color: Color.fromRGBO(146, 35, 27, 1),
                                      ),
                                    ),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty
                                        ? 'كلمة المرور مطلوبة'
                                        : null,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        focusColor:
                                            Color.fromRGBO(146, 35, 27, 1),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: const BorderSide(
                                              width: 5.0,
                                            )),
                                        labelText: 'كلمة المرور',
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          Login.routeName,
                                        );
                                      },
                                      child: const Text(
                                        ' تسجيل دخول',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(146, 35, 27, 1),
                                            fontSize: 16),
                                      )),
                                ),
                                InkWell(
                                  child: SizedBox(
                                    height: 70,
                                    width: 200,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            146, 35, 27, 1),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'تسجيل',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    final form = formkey.currentState;
                                    if (form!.validate()) {
                                      form.save();
                                      print(nameController);

                                      print(emailController);
                                      print(phoneController);
                                      print(passwordController);
                                    } else {
                                      print(
                                          'problemmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
                                    }
                                    infoUser(nameController.text,
                                        emailController.text);
                                    Authserveruser()
                                        .registerUser(
                                            nameController.text,
                                            emailController.text,
                                            phoneController.text,
                                            passwordController.text)
                                        .then((val) async {
                                      if (val.data['secssus']) {
                                        sharedUser(val.data['token']);

                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(builder: (_) {
                                          return Secotions();
                                        }));
                                      } else {
                                        print(val.data['msg']);
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
