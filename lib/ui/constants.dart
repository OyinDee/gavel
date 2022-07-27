import 'package:flutter/material.dart';

// List<String> images = [];
List<Widget> widgets = [
  stackwidget(
      'https://images.pexels.com/photos/6077326/pexels-photo-6077326.jpeg?auto=compress&cs=tinysrgb&w=600',
      'BEST LAW AGENCY',
      'Our Fighting Is For',
      'Your Justice',
      'Get Appointment'),
  stackwidget(
      'https://images.pexels.com/photos/5668781/pexels-photo-5668781.jpeg?auto=compress&cs=tinysrgb&w=600',
      'RESULTS YOU DESERVE',
      'We Prepared To',
      'Oppose For You',
      'Call us now'),
];

Stack stackwidget(String link, String a, String b, String c, String d) {
  return Stack(
    children: [
      SizedBox(
          height: 250,
          width: double.infinity,
          child: Image.network(
            link,
            color: Colors.white.withOpacity(0.8),
            colorBlendMode: BlendMode.modulate,
          )),
      Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                a,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                b,
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                c,
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
            ],
          )),
      Positioned(
        bottom: 70,
        left: 0,
        right: 0,
        child: buttonss(d),
      ),
    ],
  );
}

buttonss(String text) {
  return Center(
    child: GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFFA78A5A),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 20,
        width: 150,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        )),
      ),
    ),
  );
}

ListTile menus(BuildContext context, String title, String routeName) {
  return ListTile(
    title: Text(title),
    onTap: () {
      if (routeName == '/') {
        Navigator.pop(context);
      } else if (routeName == '/about') {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/about');
      } else if (routeName == '/contact') {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/contact');
      }
    },
  );
}

Column registerfield(
  dynamic fname,
  dynamic lname,
  dynamic email,
  dynamic password,
  dynamic phoneNumber,
) {
  return Column(
    children: [
      inputField(fname, 'First Name'),
      inputField(lname, 'Last Name'),
      inputField(email, 'Email'),
      inputField(password, 'Password'),
      inputField(phoneNumber, 'Phone Number'),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

TextField inputField(dynamic controller, String title) {
  return TextField(
    controller: controller,
    obscureText: title == 'Password' ? true : false,
    decoration: InputDecoration(
      labelText: title,
    ),
  );
}

Column loginfield(
  dynamic email,
  dynamic password,
) {
  return Column(
    children: [
      inputField(email, 'Email'),
      inputField(password, 'Password'),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

TextField inputtField(dynamic controller, String title) {
  return TextField(
    controller: controller,
    obscureText: title == 'password' ? true : false,
    decoration: InputDecoration(
      labelText: title,
    ),
  );
}

