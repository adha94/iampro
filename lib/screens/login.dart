// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/entrypoint/entry_point_admin.dart';
import 'package:iampro_client/entrypoint/entry_point_client.dart';
import 'package:iampro_client/entrypoint/entry_point_engineer.dart';
import 'package:iampro_client/entrypoint/entry_point_manager.dart';
import 'package:iampro_client/screens/reset_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required String title}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  bool? passwordVisibility = true;
  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return SafeArea(
              child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 189,
                        decoration: const BoxDecoration(
                            //color: Color(0xFF0000FF),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Color(0xFF002A7B),
                              Color(0xFF0054F6),
                            ])),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/iAMPRO_Logo_White_(1).png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10, 10, 10, 10),
                        child: Container(
                          width: double.infinity,
                          height: 431,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 10,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Text(
                                  'Welcome!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Proxima Nova',
                                    color: Color(0xFF235CC3),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Text(
                                  'Exciting features await you',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Proxima Nova',
                                  ),
                                ),
                              ),
                              Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 10, 10, 10),
                                      child: TextFormField(
                                        controller: emailTextController,
                                        obscureText: false,
                                        decoration: const InputDecoration(
                                          labelText: 'E-mail',
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          prefixIcon: Icon(
                                            Icons.email,
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Proxima Nova',
                                          color: Color(0xFF091249),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.start,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 10, 10, 10),
                                      child: TextFormField(
                                        controller: passwordTextController,
                                        obscureText: passwordVisibility!,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          contentPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 10, 10),
                                          prefixIcon: const Icon(
                                            Icons.vpn_key,
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordVisibility =
                                                  !passwordVisibility!,
                                            ),
                                            child: Icon(
                                              passwordVisibility!
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                              color: const Color(0xFF757575),
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Proxima Nova',
                                          color: Color(0xFF235CC3),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.start,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 10, 10, 8),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          signIn(emailTextController!.text,
                                              passwordTextController!.text);
                                        },
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                  const Size(250, 40)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blue),
                                          shadowColor:
                                              MaterialStateProperty.all(
                                                  Colors.blueAccent),
                                        ),
                                        child: const Text('LOGIN',
                                            style: TextStyle(
                                                fontFamily: 'Proxima Nova',
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Text(
                                  'By logging in, you have agreed to our terms and conditions.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Color(0xFF091249),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 4),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ResetPasswordPage(
                                                title: 'Reset Password'),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Proxima Nova',
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Column(
                            children: [
                              Text(
                                'V2.26.1',
                                style: TextStyle(
                                  fontFamily: 'Proxima Nova',
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                ),
                              ),
                              const Text(
                                'iAMPRO Technologies Sdn. Bhd.',
                                style: TextStyle(
                                  fontFamily: 'Proxima Nova',
                                  color: Color(0xFF091249),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future signIn(String emailClient, String passwordClient) async {
    if (formKey.currentState!.validate()) {
      final user = await _auth.signInWithEmailAndPassword(
          email: emailClient, password: passwordClient);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userID", user.user!.uid);
      checkUserType(user.user!.uid);
    }
  }

  Future checkUserType(String uid) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (documentSnapshot['user_type'] == 'Client') {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const EntryPoint()));
    } else if (documentSnapshot['user_type'] == 'Manager') {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const EntryPointManager()));
    } else if (documentSnapshot['user_type'] == 'Engineer') {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const EntryPointEngineer()));
    } else if (documentSnapshot['user_type'] == 'Admin') {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const EntryPointAdmin()));
    }
  }
}
