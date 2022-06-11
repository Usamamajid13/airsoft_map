import 'package:flutter/material.dart';

import 'constants.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({Key? key}) : super(key: key);

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "whom are you playing as?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    selected = 0;
                    setState(() {});
                  },
                  child: Container(
                    height: 200,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: selected == 0 ? Colors.orange : Colors.grey,
                          width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/admin.png",
                          scale: 5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Admin",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selected = 1;
                    setState(() {});
                  },
                  child: Container(
                    height: 200,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: selected == 1 ? Colors.orange : Colors.grey,
                          width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/soldier.png",
                          scale: 5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Soldier",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if(selected == 1)
                    {
                    Navigator.pushNamed(context, soldierHomeScreen);
                    }
                  else{
                    Navigator.pushNamed(context, adminHomeScreenRoute);
                  }
                },
                child: Container(
                  width: 115,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Next",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
