import 'package:flutter/material.dart';
import 'package:masterminds/MainScreen.dart';
import 'package:masterminds/OnlinePerson.dart';
import 'package:masterminds/PersonPage.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}
class _AccountPageState extends State<AccountPage> {
  final int  tabbarindex = 1;
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      initialIndex: tabbarindex,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                // Background image
                Image(image: const AssetImage('images/mainmoon.png'),
                    fit: BoxFit.cover,height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width),

                // Heading Text
                Positioned(
                    top: MediaQuery.of(context).size.height / 3.8,
                    left: MediaQuery.of(context).size.width / 25,
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Tutoring",style: TextStyle(fontSize: 30,color: Colors.white),),
                        SizedBox(height: 2),
                        Text("Find tutorial from the best Providers",style: TextStyle(fontSize: 18,color: Colors.white),),
                      ],
                    )),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TabBar(
                    onTap: (value){
                      MainPage.controller == false ? AccountPage(key: tabbarindex as Key?,) : AccountPage();
                    },
                    labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          child: Row(
                            children: const [
                              Icon(Icons.video_camera_front_rounded,size: 20),
                              SizedBox(width: 2),
                              Text("Online",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: const [
                              Icon(Icons.person,size: 20),
                              SizedBox(width: 2),
                              Text("In Person",style: TextStyle(fontSize: 13.31,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ]),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 3.5),
                const Padding(
                  padding: EdgeInsets.only(right: 10,top: 10),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.filter_alt_rounded,color: Colors.grey,size: 25)),
                )
              ],
            ),
            const Expanded(child: TabBarView(children: [
              OnlinePage(),
              InPersonPage(),
            ]))
          ],
        ),
      ),
    );
  }
}

class Items {

  String text;
  IconData icon;

  Items({required this.text,required this.icon});
}
