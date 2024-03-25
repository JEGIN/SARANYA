import 'package:application1/global/app_urls.dart';
import 'package:application1/homepage.dart';
import 'package:application1/src/views/carousal.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RestaurantDetailsScreenWidget extends StatefulWidget {
  RestaurantDetailsScreenWidget({super.key, this.data});
  final data;

  @override
  State<RestaurantDetailsScreenWidget> createState() =>
      _RestaurantDetailsScreenWidgetState();
}

class _RestaurantDetailsScreenWidgetState
    extends State<RestaurantDetailsScreenWidget> {
  int _offerCurrent = 0;
  dynamic name;
  dynamic address;

  final CarouselController _offerController = CarouselController();
  TextEditingController searchController = TextEditingController();

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];
  List foodList = [
    {
      'menu': 'MothiLaddu',
      'price': '₹204.75',
    }
  ];

  @override
  void initState() {
    if (widget.data != null) {
      name = widget.data['hotel_name'];
    } else {
      name = 'Hotel name';
    }

    if (widget.data['address'] != null) {
      address = widget.data['address'];
    } else {
      address = 'Hotel address';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset(
                        'assets/image/swiggy.png',
                        height: 50,
                        width: 50,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Flat ₹ 15 off',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            Text('No code required | Above ₹ 500'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                )),
                          ]),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                            onTap: () =>
                                _offerController.animateToPage(entry.key),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  3, 0, 3, 0),
                              child: Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                        .withOpacity(_offerCurrent == entry.key
                                            ? 0.9
                                            : 0.4)),
                              ),
                            ));
                      }).toList(),
                    ),
                  ],
                ))))
        .toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffE4E5EB),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace_outlined,
            color: Colors.black,
            size: 34,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const DashboardScreenWidget();
              },
            ));
          },
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.43,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xffE4E5EB),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: [
                  //     const SizedBox(
                  //       width: 20,
                  //     ),
                  //     IconButton(
                  //       icon: const Icon(
                  //         Icons.keyboard_backspace_outlined,
                  //         color: Colors.black,
                  //         size: 34,
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(context, MaterialPageRoute(
                  //           builder: (context) {
                  //             return const DashboardScreenWidget();
                  //           },
                  //         ));
                  //       },
                  //     ),
                  //   ],
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 20, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.energy_savings_leaf_rounded,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                      Text('PureVeg',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.share,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.56,
                                  child: Text(
                                    name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green),
                                          child: const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 2),
                                            child: Icon(
                                              Icons.star_rate_rounded,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Text('4.4 (10K+ ratings)',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      const Icon(
                                        Icons.info_outline,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      const Text(' .  ₹300 for two',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'South Indian, North Indian',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Divider(
                                  thickness: 0.5, color: Colors.grey.shade400),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.grey.shade400,
                                        size: 10,
                                      ),
                                      Container(
                                        height: 22,
                                        width: 1,
                                        color: Colors.grey.shade400,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.grey.shade400,
                                        size: 10,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                      height: 48,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: const [
                                          Text(
                                            'Outlet',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '25-30 Mins',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: 48,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            address,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Delivery to Home ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Divider(
                                  thickness: 0.5, color: Colors.grey.shade400),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Icon(Icons.directions_bike),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Text(
                                      '0-12kms',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  //  height: 48,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: const [
                                      Text('|'),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: const [
                                      Text(
                                        'Discounted deliveery on order above',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: const [
                                      Text('Rs 190'),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GradientText(
                                    'One',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    colors: const [
                                      Color(0xffef6e46),
                                      Color(0xffd54964),
                                    ],
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          border: Border.all(
                                            color: const Color(0xffef6e46),
                                            width: 1.0,
                                          )),
                                      child: const Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6, 1, 6, 1),
                                          child: Text('LITE',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffef6e46),
                                              )))),
                                  const Text(
                                    'Extra 15% of above ₹ 500 + Free Delivery',
                                    style: TextStyle(
                                        color: Color(0xffef6e46),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _offerController,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _offerCurrent = index;
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('MENU',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: searchController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Search for dishes',
                      suffixIcon: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 1,
                                height: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.keyboard_voice,
                                color: Colors.orange,
                              ),
                            ],
                          ))),
                ),
              ),
              const SizedBox(height: 10),
              // Padding(padding: EdgeInsets.symmetric(horizontal: 30),
              // child: Container(
              //    height: MediaQuery.of(context).size.height * 0.40,
              //         width: MediaQuery.of(context).size.width,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(20),
              //         ),

              // ),
              // ),
              const SizedBox(
                height: 10,
              ),
              // Padding(padding: EdgeInsets.all(10.0),

              Container(
                // width: MediaQuery.of(context).size.width * 0.5,
                //   height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.energy_savings_leaf_rounded,
                          color: Colors.green,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'PureVeg',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Bestseller',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Divider(thickness: 0.5, color: Colors.grey.shade400),

              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'Top Picks',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_rounded,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: foodList.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Row(
                          children: [
                            Container(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      foodList[index].image,
                                    ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Column(
                              children: [],
                            ),
                          ],
                        );
                      })),

              Row(
                children: [
                  Column(
                    children: [],
                  ),
                  Column(
                    children: [
                      Container(
                          height: 120,
                          width: 200,
                          color: Colors.white,
                          child: Stack(children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.096,
                                width: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'https://agrasweetsbanjara.com/cdn/shop/files/MotichurLaddu.jpg?v=1692964253',
                                      ),
                                      fit: BoxFit.fill),
                                )),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 63, 0, 0),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                      ),
                                      child: Text(
                                        'Veg',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )))
                          ]))
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [],
                  ),
                  Column(
                    children: [
                      Container(
                          height: 120,
                          width: 200,
                          color: Colors.white,
                          child: Stack(children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.096,
                                width: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'https://b.zmtcdn.com/data/pictures/0/19851950/c092df629b531e645795e58c5996778b_o2_featured_v2.jpg',
                                      ),
                                      fit: BoxFit.fill),
                                )),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 63, 0, 0),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                      ),
                                      child: Text(
                                        'Veg',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )))
                          ]))
                    ],
                  )
                ],
              ),

              Container(
                height: 200,
                color: Colors.white,
              )
            ]),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.menu_book,
                color: Colors.white,
              ),
              Text(
                'MENU',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
