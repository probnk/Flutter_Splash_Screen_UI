import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice1/Pages/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var obscuretext = true;
  String? _uid;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }
  // Future signup() async {
  //   if(_confirmPassword()) {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: email.text.trim(),
  //         password: password.text.trim(),
  //     );
  //
  //     addUserDetails(
  //         firstName.text.trim(),
  //         lastName.text.trim(),
  //         email.text.trim(),
  //         confirmPassword.text.trim()
  //     );
  //   }
  // }
  //
  // Future addUserDetails(String First,String Second,String Email,String Password) async {
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'First Name':First,
  //     'Last Name' : Second,
  //     'Email' : Email,
  //     'Password' : Password
  //   });
  // }
  //
  // bool _confirmPassword() {
  //   if(password.text.trim()==confirmPassword.text.trim()){
  //     return true;
  //   } else{
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/login.jfif",),
              fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0,left: 110),
                  child: Text("SIGNUP",style: TextStyle(
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
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                  child: TextField(
                    controller: firstName,
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
                          Icons.man,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      hintText: 'Enter Your First Name',
                      labelText: 'First Name',
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
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                  child: TextField(
                    controller: lastName,
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
                          Icons.man,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      hintText: 'Enter Your Last Name',
                      labelText: 'Last Name',
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
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
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
                          Icons.mail_rounded,
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
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                  child: TextField(
                    controller: password,
                    cursorColor: Colors.white,
                    obscureText: obscuretext,
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          obscuretext
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.blue.shade900,
                          // color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
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
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                  child: TextField(
                    controller: confirmPassword,
                    cursorColor: Colors.white,
                    obscureText: obscuretext,
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          obscuretext
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.blue.shade900,
                          // color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            obscuretext = !obscuretext;
                          });
                        },
                      ),
                      hintText: 'Confirm your Password',
                      labelText: 'Confirm Password',
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyLogin()));
                      },
                          child: Text("Signin",style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue.shade900
                          ),
                          )
                      ),
                      TextButton(
                          onPressed: (){
                            signup();
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
          ],
        ),
      ),
    );
  }
  Future signup() async {
    showDialog(context: context, builder: (context){
      return Center(
        child: SpinKitWave(
          color: Colors.blue.shade900,
          size: 50,
        ),
      );
    });
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text
      );
      _uid = userCredential.user!.uid;
      Fluttertoast.showToast(msg: 'Signup Succesfully',backgroundColor: Colors.grey);

    }catch(e){
      print(e);
    }
    CollectionReference _reference = FirebaseFirestore.instance.collection('Users');
    _reference
        .doc(_uid)
        .set({
      'Email':email.text,
      'Name':firstName.text + " " + lastName.text,
      'Password':password.text
    });
    Navigator.of(context).pop();
  }
}
