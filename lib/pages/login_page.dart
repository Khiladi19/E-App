import 'package:eapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.cardColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            // image direction
            children: [
              Image.asset(
                "assets/images/login1.png",
                fit: BoxFit.cover,
              ), // image path

              const SizedBox(
                height: 20,
              ),

              Text(
                "welcome $name",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enterusername", labelText: "username"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The username is empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true, //hidden a text or password
                      decoration: const InputDecoration(
                          hintText: "Enterpassword", labelText: "password"),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The psassword is empty";
                        } else if (value.length < 6) {
                          return "Password length  shoud be 6 chracter";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Material(
                      // ignore: deprecated_member_use
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changeButton ? 60 : 150,
                          height: 40,
                          alignment: Alignment.center,
                          child: changeButton
                              ? const Icon(Icons.done, color: Colors.white)
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
