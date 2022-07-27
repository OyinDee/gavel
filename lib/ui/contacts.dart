import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
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
                        'CONTACT US',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
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
                width: MediaQuery.of(context).size.width / 1.1,
                height: 280,
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                color: Color(0XFF3E1F92),
                  // color: Colors.white,
                  
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.call, color:Colors.white),
                      Text(
                        '+2348102347835',
                        style:  TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 30,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.mail_rounded, color:Colors.white),
                      Text(
                        'contactgavel@gmail.com',
                        style:  TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 3,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.facebook, color:Colors.white),
                      Text(
                        '_gavel',
                        style:  TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 3,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                     FaIcon(FontAwesomeIcons.twitter, color:Colors.white),
                      Text(
                        'gavel_justiceforall',
                        style:  TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),
                      const SizedBox(width: 10,),

                ]),
              ),)
          ],
        ),
      ),
    );
  }
}
