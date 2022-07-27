import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'POST',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 170,),
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
          Center(
              child: Card(
                  child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: 280,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
          ))),
        ],
      ),
    ));
  }
}
