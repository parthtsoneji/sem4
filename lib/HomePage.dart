import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    
    //Name and icon List
    List<Count> data = [
      Count("Mathematik", Icons.account_balance_rounded),
      Count("Physik", Icons.add_alert_sharp),
      Count("Deutsch", Icons.connected_tv_outlined),
      Count("Chemie", Icons.ac_unit_sharp),
      Count("Sachunterite", Icons.account_tree_sharp),
      Count("Biologie", Icons.energy_savings_leaf_rounded),
      Count(
        "Englisch",
        Icons.military_tech,
      ),
      Count("+10 More"),
    ];
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // gridview biulder
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.3,
                      bottom: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.width / 16,
                      left: MediaQuery.of(context).size.width / 16),
                  child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2,
                        crossAxisCount: 2,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 5),
                    itemBuilder: (context, index) {

                      return GestureDetector(
                           onTap: () {
                            setState(() {
                              index == 7
                                  ?
                              // Bottom Sheet
                              showBottomSheet(
                                // useRootNavigator: true,
                                  context: context,
                                  constraints: BoxConstraints.loose(Size(double.infinity, MediaQuery.of(context).size.height / 1.8)),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10.0)),
                                  ),
                                  builder: (BuildContext context) {
                                    return  _subjectSheet(data);
                                  }) : const HomePage();
                            });
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 0.3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            child: Row(
                              children: [
                                
                                // Contdition for 7th index name & icon replcae
                                index == 7
                                    ? Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width / 50),
                                      child: const Text(" "),)
                                    : Padding(
                                      padding: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width / 50),
                                    child: Icon(data[index].icon,
                                        color: Colors.grey, size: 26)),
                                index == 7
                                    ? const Text("+10 More", style: TextStyle(
                                        fontSize: 15,fontWeight: FontWeight.bold))
                                    : Padding(
                                        padding: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width / 29),
                                  child: Text(data[index].title,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ));
                    },
                  )),

              // Background image
              Image(
                image: const AssetImage('images/mainmoon.png'),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
              ),

              // Heading Text
              Positioned(
                  top: MediaQuery.of(context).size.height / 4,
                  left: MediaQuery.of(context).size.width / 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Learning Material",
                          style: TextStyle(fontSize: 29, color: Colors.white)),
                      SizedBox(height: 2),
                      Text("Search For Learning Material",
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ],
                  )),
              //  Person button
              Positioned(
                left: MediaQuery.of(context).size.width / 1.28,
                top: MediaQuery.of(context).size.height / 60,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(blurRadius: 15.0, color: Colors.white)
                      ]),
                  child: const Icon(
                      Icons.person, size: 25, color: Colors.white),
                ),
              ),

              // Search TextField
              Positioned(
                width: MediaQuery.of(context).size.width / 1.15,
                top: MediaQuery.of(context).size.height / 2.8,
                height: MediaQuery.of(context).size.height / 15,
                left: MediaQuery.of(context).size.width / 16,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search for terms like "Geometry"',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black45,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.white))),
                ),
              ),
            ],
          ),

        ));
  }

  // Model Bottom sheet
  Widget _subjectSheet(List<Count> data){
    return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,top: MediaQuery.of(context).size.height / 70),
            child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Learning Material",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    Text("Which subject are you looking for?",style: TextStyle(fontSize: 13,color: Colors.grey)),
                  ],
                )),
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
            child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 45,
                    left: MediaQuery.of(context).size.width / 45),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: 700,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2.1,
                          crossAxisCount: 2,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 6),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0.1,
                          color: Colors.white,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    index == 7
                                        ? Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 50),
                                      child: const Text(""),)
                                        : Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context).size.width / 50),
                                        child: Icon(data[index].icon,
                                            color: Colors.grey, size: 26)),
                                    index == 7
                                        ? Row(
                                          children: [
                                            const Icon(Icons.hourglass_top,size: 26,color: Colors.grey,),
                                            SizedBox(width: MediaQuery.of(context).size.width / 40),
                                            const Text("Franzosisch", style: TextStyle(
                                                fontSize: 15,fontWeight: FontWeight.bold)),],)
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context).size.width / 29),
                                            child: Text(data[index].title,
                                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ]),
                        );}
                  ),
                )),
          ),
        ],
      );
  }
}

//For grid
class Count {
  Count(this.title, [this.icon]);

  IconData? icon;
  String title;
}
