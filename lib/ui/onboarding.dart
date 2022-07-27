// ignore_for_file: use_build_context_synchronously, duplicate_import, depend_on_referenced_packages, non_constant_identifier_names

import 'dart:io';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gavel/Auth/auth.dart';
import 'package:gavel/ui/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:geocoding/geocoding.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String? Svalue;
  String? Lvalue;
  List<String> clients = ['Select', 'Lawyers', 'Users'];
  List<Placemark>? placemarks;
  double? Latitude;
  double? Longitude;
  dynamic result;
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void _registerPlatformInstance() {
    if (Platform.isAndroid) {
      GeolocatorAndroid.registerWith();
    } else if (Platform.isIOS) {
      GeolocatorApple.registerWith();
    }
  }

  @override
  void initState() {
    super.initState();
    _registerPlatformInstance();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0XFF0C1395),
                ),
                child: const Center(
                  child: Text('GAVEL',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              menus(context, 'Home', '/'),
              menus(context, 'About', '/about'),
              menus(context, 'Contact', '/contact'),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text(
                    'Terms of Service | Privacy Policy',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(
                    //   height: 60,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: ((context) => IconButton(
                                alignment: Alignment.topLeft,
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                tooltip: 'Menu',
                                icon: const Icon(
                                  Icons.menu,
                                  color: Color(0XFF0C1395),
                                ),
                              )),
                        ),
                        Row(
                          children: [
                            IconButton(
                              alignment: Alignment.topLeft,
                              onPressed: () async {
                                Position position = await _determinePosition();
                                Latitude = position.latitude;
                                Longitude = position.longitude;
                                placemarks = await placemarkFromCoordinates(
                                    Latitude!, Longitude!);
                                var expect = await Auth().makePost('', 'Help',
                                    'My Location is ${placemarks![0].name} ${placemarks![0].street} ${placemarks![0].subAdministrativeArea}  ');

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text('${expect['message']}')));
                                // print(placemarks![0].country);
                              },
                              tooltip: 'Distress',
                              icon: const Icon(
                                Icons.dangerous,
                                color: Color(0XFF0C1395),
                              ),
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Center(
                                              child: Text('Register')),
                                          content: SizedBox(
                                            height: 450,
                                            width: 350,
                                            child: Column(
                                              children: [
                                                registerfield(
                                                    fname,
                                                    lname,
                                                    email,
                                                    password,
                                                    phoneNumber),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text('Select Client'),
                                                    IconButton(
                                                      color: Colors.pink[600],
                                                      onPressed: () {
                                                        toast(
                                                          'Lawyer',
                                                        );
                                                        setState(() {
                                                          Svalue = 'Lawyer';
                                                        });
                                                      },
                                                      icon: const Icon(Icons
                                                          .balance_outlined),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    IconButton(
                                                      color: Colors.blue[600],
                                                      onPressed: () {
                                                        toast(
                                                          'User',
                                                        );
                                                        setState(() {
                                                          Svalue = 'User';
                                                        });
                                                      },
                                                      icon: const Icon(
                                                          Icons.person_outline),
                                                    ),
                                                  ],
                                                ),
                                                Center(
                                                    child: ElevatedButton(
                                                        onPressed: () async {
                                                          if (fname.text.isEmpty ||
                                                              lname.text
                                                                  .isEmpty ||
                                                              email.text
                                                                  .isEmpty ||
                                                              password.text
                                                                  .isEmpty ||
                                                              phoneNumber.text
                                                                  .isEmpty ||
                                                              Svalue == '') {
                                                            toast(
                                                                'Please fill all the fields & Choose a client');
                                                          } else {
                                                            result = await Auth()
                                                                .signUp(
                                                                    fname.text,
                                                                    lname.text,
                                                                    email.text,
                                                                    password
                                                                        .text,
                                                                    phoneNumber
                                                                        .text,
                                                                    Svalue);
                                                            fname.clear();
                                                            lname.clear();
                                                            email.clear();
                                                            password.clear();
                                                            phoneNumber.clear();

                                                            Navigator.pop(
                                                                context);

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text('${result['message']}')));

                                                            result = '';
                                                          }
                                                        },
                                                        child: const Text(
                                                            'Register'))),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(color: Color(0XFF0C1395)),
                                )),
                            const SizedBox(width: 10),
                            OutlinedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Center(
                                              child: Text('Login')),
                                          content: SizedBox(
                                            height: 250,
                                            width: 350,
                                            child: Column(
                                              children: [
                                                loginfield(
                                                  email,
                                                  password,
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text('Select Client'),
                                                    IconButton(
                                                      color: Colors.pink[600],
                                                      onPressed: () {
                                                        toast(
                                                          'Lawyer',
                                                        );
                                                        setState(() {
                                                          Lvalue = 'Lawyer';
                                                        });
                                                      },
                                                      icon: const Icon(Icons
                                                          .balance_outlined),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    IconButton(
                                                      color: Colors.blue[600],
                                                      onPressed: () {
                                                        toast(
                                                          'User',
                                                        );
                                                        setState(() {
                                                          Lvalue = 'User';
                                                        });
                                                      },
                                                      icon: const Icon(
                                                          Icons.person_outline),
                                                    ),
                                                  ],
                                                ),
                                                Center(
                                                    child: ElevatedButton(
                                                        onPressed: () async {
                                                          result = await Auth()
                                                              .signIn(
                                                                  email.text,
                                                                  password.text,
                                                                  Lvalue);
                                                          email.clear();
                                                          password.clear();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      '${result['message']}')));

                                                          validate() {
                                                            Navigator
                                                                .pushReplacementNamed(
                                                                    context,
                                                                    '/dashboard',
                                                                    arguments: {
                                                                  'token': result[
                                                                      'token'],
                                                                });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text('${result['message']}')));
                                                          }

                                                          wrong() {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text('${result['message']}')));
                                                          }

                                                          '${result['message']}' ==
                                                                  'Your login is successful!'
                                                              ? validate()
                                                              : wrong();
                                                        },
                                                        child: const Text(
                                                            'Login'))),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: const Text('Login',
                                    style:
                                        TextStyle(color: Color(0XFF0C1395)))),
                            const SizedBox(width: 10),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                        items: widgets,
                        options: CarouselOptions(
                          height: 300,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                        )),
                    Center(
                        child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: widgets.length,
                    )),

                    const SizedBox(
                      height: 20,
                    ),
                    people(
                      'https://www.free-css.com/assets/files/free-css-templates/preview/page280/justice/assets/img/team-3.jpg',
                      'Mariam Doiley',
                      'Business Law',
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                    ),
                    people(
                      'https://images.pexels.com/photos/936117/pexels-photo-936117.jpeg?auto=compress&cs=tinysrgb&w=600',
                      'Archie Andrews',
                      'Criminal Law',
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                    ),
                    people(
                      'https://images.pexels.com/photos/1367270/pexels-photo-1367270.jpeg?auto=compress&cs=tinysrgb&w=600',
                      'Ashley Greenwood',
                      'Civil Law',
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    ),
                    people(
                      'https://images.pexels.com/photos/2955376/pexels-photo-2955376.jpeg?auto=compress&cs=tinysrgb&w=600',
                      'Jordan Baker',
                      'Family Law',
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                    )
                  ]),
            ),
          ),
        ));
  }

  Card people(link, name, dept, bio) {
    return Card(
      child: SizedBox(
        height: 70,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              link,
            ),
            radius: 25,
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 10),
              Text(
                dept,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          subtitle: Text(
            bio,
            style: const TextStyle(fontSize: 15),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
