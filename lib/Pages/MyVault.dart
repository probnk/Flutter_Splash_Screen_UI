import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyVault extends StatefulWidget {
  const MyVault({Key? key}) : super(key: key);

  @override
  State<MyVault> createState() => _MyVaultState();
}

class _MyVaultState extends State<MyVault> {
  final _controller = PageController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _handleSignOut(BuildContext context) async {
    try{
      await _googleSignIn.signOut();
      await _auth.signOut();
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: SpeedDial(
        overlayColor: Colors.black.withOpacity(.2),
        animatedIcon: AnimatedIcons.add_event,
        direction: SpeedDialDirection.down,
        backgroundColor: Colors.blue.shade900,
        children: [
          SpeedDialChild(
            child:Icon(Icons.facebook,color: Colors.white,),
            label: 'Facebook',
            backgroundColor: Colors.blue,
            onTap: () {}
          ),
          SpeedDialChild(
              child:Icon(Icons.apple),
              label: 'Apple',
              backgroundColor: Colors.white,
              onTap: () {}
          ),
          SpeedDialChild(
              child:Icon(Icons.g_mobiledata,color:Color.fromRGBO(15, 157, 88, .8)),
              label: 'G-Mail',
              backgroundColor: Colors.white,
              onTap: () {}
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.orange,
          color: Color(0xFF224d6d),
          items: [
            IconButton(
              onPressed:() {

              },
              icon: Icon(Icons.home,
              size: 32),
              color: Colors.white,
            ),
            IconButton(
              onPressed:() {

              },
              icon: Icon(Icons.currency_bitcoin,
                  size: 32),
              color: Colors.white,
            ),
            IconButton(
              onPressed:() {

              },
              icon: Icon(Icons.card_travel,
                  size: 32),
              color: Colors.white,
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "My",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      " Vault",
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 100),
                  child: IconButton(
                    onPressed: () {
                      _handleSignOut(context);
                       FirebaseAuth.instance.signOut();
                    },
                    icon:Icon(Icons.logout,size: 25,color: Colors.black,)
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 330,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/p.png"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.purple.withAlpha(200),
                              BlendMode.modulate)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Balance",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Container(
                                  height: 50,
                                  child: Image.asset("assets/Visa2.png"),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "1234 5678 9101",
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 60,
                                  child: Image.asset("assets/chip.png"),
                                ),
                                Container(
                                  child: Text(
                                    "13/24",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 330,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/abstract.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.orange, BlendMode.modulate)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Balance",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Container(
                                  height: 50,
                                  child: Image.asset("assets/visa1.png"),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "1234 5678 9101",
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 60,
                                  child: Image.asset("assets/chip.png"),
                                ),
                                Container(
                                  child: Text(
                                    "13/24",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 330,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/q.jfif"),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Balance",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Container(
                                  height: 50,
                                  child: Image.asset("assets/c.png"),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "1234 5678 9101",
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 60,
                                  child: Image.asset("assets/chip.png"),
                                ),
                                Container(
                                  child: Text(
                                    "13/24",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 130.0),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: Image.asset("assets/pay.png"),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: Image.asset("assets/receive.png"),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: Image.asset("assets/bill.png"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 15, right: 25),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Text(
                      "Pay",
                      style: TextStyle(fontSize: 18),
                    )),
                    Container(
                        child: Text(
                      "Receive",
                      style: TextStyle(fontSize: 18),
                    )),
                    Container(
                        child: Text(
                      "Bill",
                      style: TextStyle(fontSize: 18),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF224d6d),
                      Colors.blue.shade900.withOpacity(.4)
                    ]),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF224d6d),
                          spreadRadius: 4,
                          blurRadius: 2,
                          offset: Offset(3, 3)),
                      BoxShadow(
                          color: Colors.grey.shade500,
                          spreadRadius: 3,
                          blurRadius: 15,
                          offset: Offset(-3, -3))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/statistic.png",
                          height: 60, width: 80),
                      Column(
                        children: [
                          Text(
                            "Statistics",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {

                            },
                            icon: Icon(
                              Icons.analytics,
                              size: 24.0,
                            ),
                            label: Text('Analyze Data'),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/send.png",
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF224d6d),
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color(0xFF224d6d),
                      Colors.blue.shade900.withOpacity(.4)
                    ]),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF224d6d),
                          spreadRadius: 4,
                          blurRadius: 2,
                          offset: Offset(3, 3)),
                      BoxShadow(
                          color: Colors.grey.shade500,
                          spreadRadius: 3,
                          blurRadius: 15,
                          offset: Offset(-3, -3))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/transaction.png",
                          height: 70, width: 70),
                      Column(
                        children: [
                          Text(
                            "Money Transaction",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.credit_card,
                              size: 24.0,
                            ),
                            label: Text('Payment Method'),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/send.png",
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}