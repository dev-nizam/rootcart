import 'package:flutter/material.dart';
import 'package:rootcart/home/home.dart';
import 'package:rootcart/user/signup.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Container(
                      height: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "asset/Login logo/logo-removebg-preview.png",
                            ),
                          )),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  // ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: EmailController,
                      validator: (value) {
                        // Check if this field is empty
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        // using regular expression
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }

                        // the email is valid
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.email_outlined),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      obscureText: false,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (value.length < 6) {
                          return 'Too short';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 300),
                    child: TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password',
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        // if(passwordController.text.length >= 6 || MobileNumberController.text.length >= 10 ){
                        //   print('===============================================Not validate');
                        //
                        // }else{
                        // final loginProvider = Provider.of<LoginProvider>(
                        //     context,
                        //     listen: false);
                        // loginProvider.userLogin(
                        //     context,
                        //     passwordController.text,
                        //     EmailController.text);
                         Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Nibuyhome()));
                        // }

                        // print(MobileNomberController.text);
                        // print(passwordController.text);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const SignUp(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}