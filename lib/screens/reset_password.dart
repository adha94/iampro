// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key, required String title}) : super(key: key);

  @override
  ResetPasswordPageState createState() => ResetPasswordPageState();
}

class ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController? emailTextController;
  final formKey = GlobalKey<FormState>();
  //final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    emailTextController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0000FF),
        automaticallyImplyLeading: true,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          'Reset Password',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 250,
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
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Container(
                width: double.infinity,
                height: 350,
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Text(
                        'Please reset your password.',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Proxima Nova',
                          color: Color(0xFF235CC3),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Text(
                        'Exciting features await you',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Proxima Nova',
                        ),
                      ),
                    ),
                    Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 10, 10, 10),
                            child: TextFormField(
                              controller: emailTextController,
                              obscureText: false,
                              decoration: const InputDecoration(
                                labelText: 'E-mail',
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
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
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          //const Spacer(),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 10, 10, 10),
                            child: ElevatedButton(
                              onPressed: () => resetPassword,
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(250, 40)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.blueAccent),
                              ),
                              child: const Text('RESET PASSWORD',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Text(
                        'iAMPRO Technologies Sdn. Bhd.',
                        style: TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Color(0xFF091249),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      const snackBar = SnackBar(content: Text('Password reset email sent!'));
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextController!.text);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
      Navigator.of(context).pop();
    }
  }
}
