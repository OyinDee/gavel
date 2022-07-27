import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child:Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    tooltip: 'Back',
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Row(
                  children: const [
                    Center(
                      child: Text(
                        'ABOUT US',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 130,),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 2,),
            const Divider(
              color: Color(0XFF0C1395),
              thickness: 2,
              indent: 50,
              endIndent: 50,
            ),
            const SizedBox(height: 20,),
             Card(
              elevation: 10,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 1.4,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                color:const Color(0XFF0C1395).withOpacity(0.8),
                  // color: Colors.white,
                  
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:const[
                  SizedBox(height: 10,),
                  Text(
                    'OUR MISSION',
                    style:  TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(22, 0, 20, 0),
                    child: Text(
                      'To promote peaceful and inclusive societies for sustainable development, provide access to justice for all and build effective, accountable and inclusive institutions at all levels.',
                      softWrap: true,
                      style:  TextStyle(
                        wordSpacing: 1,
                        fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      color: Colors.white,

                      ),
                    ),
                  ),
                   SizedBox(height: 10,),
                  Text(
                    'OUR VISION',
                    style:  TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(22, 0, 20, 0),
                    child: Text(
                      'To ensure public access to information and protect fundamental freedoms, prevent violence and combat terrorism and crime and ensure equal access to justice for all.',
                      softWrap: true,
                      style:  TextStyle(
                        wordSpacing: 1,
                        fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      color: Colors.white,

                      ),
                    ),
                  ),
                   SizedBox(height: 10,),
                  Text(
                    'OUR GOAL',
                    style:  TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(22, 0, 20, 0),
                    child: Text(
                      ' To connect potential clients with lawyers without going through stress. We aim to provide a platform where people can air their grievances and get heard.',
                      softWrap: true,
                      style:  TextStyle(
                        wordSpacing: 1,
                        fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      color: Colors.white,

                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                ]),
              ),)

          ],
        ) ,)
      
       );
  }
}
