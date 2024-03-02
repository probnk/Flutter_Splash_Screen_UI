import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_auth/email_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice1/Pages/MySignup.dart';
import 'package:practice1/Pages/MyVault.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController otp = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    otp.dispose();
    super.dispose();
  }

  var obscuretext = true;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");

  void sendOTP() async {
    var res = await emailAuth.sendOtp(recipientMail: email.text);
    if(res){
      Fluttertoast.showToast(msg: 'OTP Send');
    }
    else{
      Fluttertoast.showToast(msg: 'OTP not Send');
    }
  }

  void verifyOTP() {
    var res = emailAuth.validateOtp(
      recipientMail: email.text,
      userOtp: otp.text,
    );
    if (res) {
      Fluttertoast.showToast(msg: 'OTP Verified');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyVault()),
      );
    } else {
      Fluttertoast.showToast(msg: 'OTP not Verified');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyLogin()),
      );
    }
  }

  Future _handleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null)
        return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
    }
    catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/login.jfif",),
              fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0,left: 110),
                    child: Text("LOGIN",style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 45,
                        color: Colors.blue.shade900
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      controller: email,
                      cursorColor: Colors.white,
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {},
                          icon: Icon(
                              Icons.mail_lock,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        hintText: 'Enter Your Email',
                        labelText: 'Email',
                        hintStyle: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 18
                        ),
                        labelStyle: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 18,
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade900,
                                width: 3
                            ),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25) ,
                          borderSide: BorderSide(
                              color: Colors.blue.shade900,
                              width:3
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                    child: TextField(
                      controller: password,
                      cursorColor: Colors.white,
                      obscureText:obscuretext,
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                                obscuretext
                                ? Icons.visibility_off
                                : Icons.visibility,
                                color: Colors.blue.shade900,
                          ),
                          onPressed: () {
                            setState(() {
                              obscuretext = !obscuretext;
                            });
                          },
                        ),
                        hintText: 'Enter Your Password',
                        labelText: 'Password',
                        hintStyle: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 18
                        ),
                        labelStyle: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 18,
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade900,
                                width: 3                              ),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25) ,
                          borderSide: BorderSide(
                              color: Colors.blue.shade900,
                              width:3
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                    child: TextField(
                      controller: otp,
                      cursorColor: Colors.white,
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: (){
                            sendOTP();
                         },
                          icon: Icon(Icons.verified_outlined,color: Colors.blue.shade900,),
                        ),
                        hintText: 'Enter Your OTP',
                        labelText: 'OTP',
                        hintStyle: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 18
                        ),
                        labelStyle: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 18,
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade900,
                                width: 3                              ),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25) ,
                          borderSide: BorderSide(
                              color: Colors.blue.shade900,
                              width:3
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:12,right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context)=>Signup()));
                          },
                            child: Text("Signup",style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue.shade900
                            ),
                            )
                        ),
                        TextButton(
                            onPressed: (){
                              verifyOTP();
                              signin();
                        },
                            child:Icon(Icons.arrow_right_alt_outlined,
                              size: 40,
                              color: Colors.blue.shade900,
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Text("-----------------OR-----------------",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue.shade900
                    ),
                ),
              ),
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.white,
                        elevation: 7,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        )
                    ),
                    onPressed: (){
                      _handleSignIn(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/google.png",height: 25,width: 25,),
                        Text("   Google",style: TextStyle(
                            fontSize: 20,
                            color:Colors.black
                        ),
                        )
                      ],
                    )
                ),

              ),

              SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 8,

                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        )
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 30,),
                        Text("     Facebook",style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                        )
                      ],
                    )
                ),

              )

            ],
          ),
        ),
      ),
    );
  }
  Future signin() async {
      showDialog(context: context, builder: (context){
        return Center(
          child: SpinKitWave(
            color: Colors.blue.shade900,
            size: 50,
          ),
        );
      });
    try{
      FirebaseAuth _auth = await FirebaseAuth.instance;
      await _auth.signInWithEmailAndPassword(
          email: email.text,
          password: password.text
      );

    }
    catch(e){
        Fluttertoast.showToast(msg: e.toString());
    }
      Navigator.of(context).pop();
  }
}