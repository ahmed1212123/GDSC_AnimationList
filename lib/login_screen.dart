import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gdsc_login/animation_map.dart';
import 'package:gdsc_login/register_screen.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  var formKey = GlobalKey<FormState>();

  void changePasswordVisibility() {
    setState(() {
      isPassword = !isPassword;
      suffix = isPassword
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: formKey,
      child: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(flip: true),
            child: Container(
              height: height / 3,
              width: double.infinity,
              color: Colors.purple,
              child: Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 55,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your text";
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          SizedBox(
            height: height / 55,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isPassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your Password";
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    changePasswordVisibility();
                  },
                  icon: Icon(suffix),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 55,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: height / 13,
              child: MaterialButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Navigator.pushReplacement(
                    //     context, MaterialPageRoute(builder: (context)=> AnimatedListSample()));
                  }
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                color: Colors.purple,
              )),
          SizedBox(
            height: height / 55,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: height / 13,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                shape: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.purple,
                )),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 15.0, color: Colors.purple),
                ),
                // color: Colors.blue,
              )),
          SizedBox(
            height: height / 55,
          ),
        ],
      ),
    )));
  }
}
