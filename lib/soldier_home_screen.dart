import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pubg_map/constants.dart';

class SoldierHomeScreen extends StatefulWidget {
  const SoldierHomeScreen({Key? key}) : super(key: key);

  @override
  State<SoldierHomeScreen> createState() => _SoldierHomeScreenState();
}

class _SoldierHomeScreenState extends State<SoldierHomeScreen> {
  final _formKey = GlobalKey<FormState>();
  var joiningCodeController = TextEditingController();
  var nameController = TextEditingController();
  @override
  void dispose() {
EasyLoading.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/giphy.gif"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Text(
                  "Want to join the Game?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Enter the joining code down below",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    validator: (val) => (!val!.isNotEmpty)
                        ? "Please Enter Your Joining Code"
                        : null,
                    controller: joiningCodeController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Paste your joining code here",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Enter your ingame name below",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: nameController,
                    validator: (val) =>
                        (!val!.isNotEmpty) ? "Please Enter Your Name" : null,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Enter your name here",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                GestureDetector(
                  onTap: () async {
                    if (validateAndSave()) {
                    //   EasyLoading.show(status: "Loading..");
                    //    bool a = await getDoc(joiningCodeController.text);
                    //   if (a == true) {
                    //     int count = -999;
                    //     var ids = await FirebaseFirestore.instance
                    //         .collection("gameCodes")
                    //         .doc(joiningCodeController.text)
                    //         .get();
                    //
                    //     count = ids["playerJoined"];
                    //     if (count != -999) {
                    //       print("Hello2");
                    //       await FirebaseFirestore.instance
                    //           .collection("gameCodes")
                    //           .doc(joiningCodeController.text)
                    //           .update({
                    //         'playerJoined': count + 1,
                    //       });
                    //       print("Hello2");
                    //       // await FirebaseFirestore.instance
                    //       //     .collection("players")
                    //       //     .doc(joiningCodeController.text)
                    //       //     .set({
                    //       //   'player${count+1}': nameController.text,
                    //       // });
                    //     }
                    //     print(count);
                    //     EasyLoading.showSuccess("Game Joined Successfully!");
                        Navigator.pushNamed(context, soldierMapScreenRoute);
                      // } else {
                      //   EasyLoading.showError("Invalid Joining Code!");
                      //   print("Doc don't exist");
                      // }
                    }
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Join",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getDoc(docId) async {
    bool i = false;
    var a = await FirebaseFirestore.instance
        .collection('gameCodes')
        .doc(docId)
        .get();
    print(a);
    if (a.exists) {
      print('Exists');
      i = true;
    }
    if (!a.exists) {
      print('Not exists');
      i = false;
    }
    return i;
  }
}
