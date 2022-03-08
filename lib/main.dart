import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nike Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homeLayout(),
    );
  }
}

class homeLayout extends StatelessWidget {
  String dropdownValue;
  final List<dynamic> items = [
    [
      'Nike',
      'Kobe 5 Protro X Undefeated',
      '10,500',
      'Hall of Fame',
      'https://static.nike.com/a/images/t_prod_ss/w_960,c_limit,f_auto/a20b1222-b0cd-47c9-a7a7-e57bcdc6676f/kobe-5-protro-x-undefeated-hall-of-fame-release-date.jpg',
      5,
      'Featured'
    ],
    [
      'Nike',
      'LeBron 8',
      '10,400',
      'Space Jam',
      'https://static.nike.com/a/images/t_prod_ss/w_960,c_limit,f_auto/2681397e-d9f2-4eb4-ab2b-6f3a69d86c35/lebron-8-space-jam-release-date.jpg',
      4,
      'Best Seller'
    ],
    [
      'Converse',
      'Chuck Taylor Allstar',
      '7000',
      'Off-White',
      'https://old.shoeengine.com/wp-content/uploads/2018/10/01-converse-chuck-taylor-all-star-off-white-163862c-00.jpg',
      3,
      'New Arrival'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize;
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        toolbarHeight: screenSize.height * .1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: screenSize.width * .1,
            ),
            Text(
              'Business Name Here',
              style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.plusCircle,
                    size: 25,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height * .1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Products',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.yellow,
                            ),
                            child: Center(
                              child: Text("2"),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          DropdownButton(
                            onChanged: (dropdownValue) {},
                            underline: Container(
                              height: 0,
                              width: 0,
                            ),
                            elevation: 16,
                            value: dropdownValue,
                            hint: Text('FILTERS'),
                            icon: FaIcon(FontAwesomeIcons.angleDown),
                            items: <String>[
                              'Featured',
                              'New Arrival',
                              'Best Seller'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height * .72,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(top: 20.0),
                    elevation: 3,
                    color: Color(0xFFF5F5F5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  items[index][6],
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: items[index][6] == 'New Arrival'
                                          ? Colors.orange
                                          : items[index][6] == 'Best Seller'
                                              ? Colors.blue
                                              : Colors.black),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: NetworkImage(
                                  items[index][4],
                                ),
                                width: 200,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      items[index][0],
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              items[index][1],
                                              style: TextStyle(
                                                  fontFamily: 'Poppins'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          for (int i = 0;
                                              i < items[index][5];
                                              i++)
                                            FaIcon(
                                              FontAwesomeIcons.solidStar,
                                              size: 16,
                                              color: Colors.yellow,
                                            ),
                                          for (int i = 0;
                                              i < 5 - items[index][5];
                                              i++)
                                            FaIcon(
                                              FontAwesomeIcons.star,
                                              size: 16,
                                            ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Php " + items[index][2],
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
