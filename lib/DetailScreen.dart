import 'package:flutter/material.dart';
import 'package:masterminds/MainScreen.dart';
import 'package:masterminds/PersonPage.dart';


class DetailPage extends StatefulWidget {
  final List<Person> data;
  final int index;
   const DetailPage({Key? key,required this.data, required this.index,}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DetailPage> createState() => _DetailPageState(index);
}

class _DetailPageState extends State<DetailPage> {
final int index;

  _DetailPageState(this.index);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        //Page Padding
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          //Scrolling Details
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                child: Column(children: [
                  // Person Image
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 60,height: 60,
                      foregroundDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pinkAccent.withOpacity(0.3),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(widget.data[index].image),
                              fit: BoxFit.fill)
                      ),
                    )
                  ),
                  // Person Name
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.data[index].name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Icon more Details
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle_outline,
                          color: Colors.black, size: 15),
                      const SizedBox(width: 3),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Text(widget.data[index].desc,
                              style: const TextStyle(
                                  color: Colors.black45, fontSize: 13),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis))
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(widget.data[index].icons,size: 20),
                          const SizedBox(height: 8),
                          const Text("English",style: TextStyle(fontSize: 12),)
                        ],
                      ),
                      Container(
                        width: 1,
                        height: MediaQuery.of(context).size.height / 12,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      const Text("Online & \n Person",style: TextStyle(fontSize: 12)),
                      Container(
                        width: 1,
                        height: MediaQuery.of(context).size.height / 12,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      Column(
                        children: [
                          Text(widget.data[index].num,style: const TextStyle(fontSize: 12),),
                          const SizedBox(height: 8),
                          const Text("English",style: TextStyle(fontSize: 12),)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Person Description
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Text(widget.data[index].desc,
                          style: const TextStyle(color: Colors.black, fontSize: 15),
                          maxLines: 50,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis)),
                  const SizedBox(height: 30),

                  //Person Project and Icon
                  Column(
                    children: [
                      const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Subproject",
                            style: TextStyle(fontSize: 15, color: Colors.black45),
                          )),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          children: [
                            Icon(widget.data[index].icons),
                            const SizedBox(height: 8),
                            const Text("English")
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
            ),
              ),
              GestureDetector(
                onTap: () {
                  MainPage.controller.add(false);
                },
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.cancel_outlined, size: 40),
                ),
              ),
          ]),
        ),
      ),

      //floating button for contact more
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        extendedPadding: EdgeInsets.all(MediaQuery.of(context).size.width / 4),
        onPressed: () {},
        label: const Text("Contact Tour ->"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
