import 'package:flutter/material.dart';
import 'package:masterminds/MainScreen.dart';

class InPersonPage extends StatefulWidget {
  const InPersonPage({Key? key}) : super(key: key);
  static List<Person>? dataList;
  static int? index;

  @override
  State<InPersonPage> createState() => _InPersonPageState();
}

class _InPersonPageState extends State<InPersonPage> {

  // In Person data
  List<Person> inper = [
    Person(
        image: 'images/thumb.png',
        name: "Benjamin",
        desc:
            'Lorem Lpsum is simply dummy text of the printing and typesetting industry.',
        num: 'Class 1 - 13',
        icons: Icons.sort_by_alpha),
    Person(
        image: 'images/melo.png',
        name: "Sebastian",
        desc:
            'Lorem Lpsum has been the industries standard dummy text ever sub the and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Lpsum 1500s, when an unknown printer took a galley of the variiable is fpound in a scropion formate list of vacncy is the largest economy to democrate that the formate for all ther aspect in a ration for all the leave of the concert the value of the senter of a depend the rotation in bgmi formatye there specify the object of knowlege formate in a particular formate that iun a ways that form apply',
        num: 'Class 1 - 13',
        icons: Icons.add_circle)
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
      children: [
        // ListView Builder
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: inper.length,
              itemBuilder: (context,index) {
                InPersonPage.dataList  = inper;

                //return to Account Page
                return GestureDetector(
                  onTap: () {
                    InPersonPage.index = index;
                    setState(() {
                      MainPage.controller.add(true);
                    });
                  },

                  // Listview Design
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    elevation: 0.3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),

                    //Row for image and column text
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //circle Avtar image
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 15),
                                child: Container(
                                  width: 50,height: 50,
                                  foregroundDecoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.pinkAccent.withOpacity(0.3),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: AssetImage(inper[index].image),
                                          fit: BoxFit.fill)))),
                                   const SizedBox(width: 30),

                              //Headline Name
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      inper[index].name,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),

                                    const SizedBox(height: 7),

                                    // Check icon & Descriptions
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.check_circle_outline,
                                            color: Colors.black, size: 18),
                                        const SizedBox(width: 3),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width/2.5,
                                            child: Text(inper[index].desc,
                                                style: const TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 13.5),
                                                maxLines: 10,textAlign: TextAlign.justify,
                                                overflow: TextOverflow.ellipsis))
                                      ],
                                    ),

                                    const SizedBox(height: 7),

                                    // Number class
                                    Text(
                                      inper[index].num,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,right: 10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                inper[index].icons,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    ));
  }
}

// model
class Person {
  String image;
  String name;
  String desc;
  String num;
  IconData icons;

  Person(
      {required this.image,
      required this.name,
      required this.desc,
      required this.num,
      required this.icons});
}
