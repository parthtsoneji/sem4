import 'package:flutter/material.dart';

class OnlinePage extends StatefulWidget {
  const OnlinePage({Key? key}) : super(key: key);

  @override
  State<OnlinePage> createState() => _OnlinePageState();
}

class _OnlinePageState extends State<OnlinePage> {

  List<Account> acc = [
    Account(
        person: 'images/images.png',
        name: "Lissane",
        desc: "Student",
        num: "Class 1 - 13",
        icons: Icons.sort_by_alpha),
    Account(
        person: 'images/thumb.png',
        name: "Lorem lpsum",
        desc: "Coroline",
        num: "Class 1 - 13",
        icons: Icons.ac_unit_sharp),
    Account(
        person: "images/melo.png",
        name: "Julia",
        desc: "There are many variations",
        num: "Class 1 - 13",
        icons: Icons.energy_savings_leaf),
    Account(
        person: "images/person.png",
        name: "fmila",
        desc: "Forogline",
        num: "Class 1 - 13",
        icons: Icons.energy_savings_leaf_rounded)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: ListView.builder(
                itemCount: acc.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      elevation: 0.3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5, top: 15),
                                    child: Container(
                                      width: 50,height: 50,
                                      foregroundDecoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.pinkAccent.withOpacity(0.3),
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(image: AssetImage(acc[index].person),
                                        fit: BoxFit.fill)
                                      ),
                                    )
                                ),

                                const SizedBox(width: 30),

                                //Headline Name
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(acc[index].name,style: const TextStyle(
                                      fontSize: 14,fontWeight: FontWeight.bold,
                                      color: Colors.black),),

                                      const SizedBox(height: 7),

                                      // Check icon & Descriptions
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.check_circle_outline,color: Colors.black,size: 18),
                                          const SizedBox(width: 3),
                                          SizedBox(
                                              width: 150,
                                              child: Text(acc[index].desc,style: const TextStyle(color: Colors.black45,fontSize: 13.5),overflow: TextOverflow.fade,))
                                        ],
                                      ),
                                      const SizedBox(height: 7),

                                      //Number Class
                                      Text(acc[index].num,style: const TextStyle(color: Colors.black,fontSize: 13),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:10,right: 10),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(acc[index].icons,color: Colors.grey,size: 20,)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
              ),
            )
          ],
        ),
      )
    );
  }
}

class Account {
  String person;
  String name;
  String desc;
  String num;
  IconData icons;
  Account({required this.person,required this.name,required this.desc,required this.num,required this.icons});
}
