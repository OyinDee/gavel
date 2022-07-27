import 'package:flutter/material.dart';
import 'package:gavel/Auth/auth.dart';
import 'package:gavel/model/model.dart';
import 'dart:async';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  dynamic token;
  dynamic value;
  dynamic posts = [];
  bool isSender = false;
  String? email;
  getPost() async {
    var newResult = await Auth().getPost();
    posts.clear();
    for (var i = 0; i < newResult.length; i++) {
      posts.add(Post.fromMap(newResult[i]));
    }
  }

  final ScrollController _scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

 

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    token = ModalRoute.of(context)!.settings.arguments;
    nameless() async {
      var user = await Auth().retrieveUser(token['token']);
      email = user.email;
      return user;
    }

    getPost();

    return Scaffold(
        body: SafeArea(
          child: SizedBox(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1.3,
              child: FutureBuilder(
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/'));
                              },
                              icon: const Icon(Icons.logout)),
                          Center(
                            child: Text(
                                '${snapshot.data.fname.toString()} ${snapshot.data.lname.toString()}'),
                          ),
                          posts == null
                              ? const Center(child: RefreshProgressIndicator())
                              : Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    controller: _scrollController,
                                    itemCount: posts.length,
                                    itemBuilder: (context, index) {
                                      // posts.forEach((element) {
                                      //   if (element.email ==
                                      //       snapshot.data.email) {
                                      //     setState(() {
                                      //       isSender = true;
                                      //     });
                                      //   }
                                      // });
                                      return Card(
                                        child: ListTile(
                                          tileColor: isSender
                                              ? Colors.blue
                                              : Colors.grey[200],
                                          title: Text(posts[index].title),
                                          subtitle: Text(posts[index].body),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ],
                      );
                    }
                  },
                  future: nameless()),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Post'),
                    content: SizedBox(
                      height: 200,
                      width: 250,
                      child: Column(
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: const InputDecoration(
                              labelText: 'Title',
                            ),
                          ),
                          TextField(
                            controller: textController,
                            decoration: const InputDecoration(
                              labelText: 'Body',
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      OutlinedButton(
                        child: const Text('Post'),
                        onPressed: () async {
                          if (titleController.text.isNotEmpty &&
                              textController.text.isNotEmpty) {
                            var expect = await Auth().makePost(email,
                                titleController.text, textController.text);
                            textController.clear();
                            titleController.clear();

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('${expect['message']}'),
                            ));
                            Navigator.pop(context);
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please fill all the fields'),
                            ));
                          }
                        },
                      ),
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ));
  }
}
