import 'package:application1/global/app_urls.dart';
import 'package:application1/homepage.dart';
import 'package:application1/src/views/carousal.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RestaurantDetailsScreenWidget extends StatefulWidget {
  const RestaurantDetailsScreenWidget({super.key});

  @override
  State<RestaurantDetailsScreenWidget> createState() =>
      _RestaurantDetailsScreenWidgetState();
}

class _RestaurantDetailsScreenWidgetState
    extends State<RestaurantDetailsScreenWidget> {

        int _offerCurrent = 0;

 final CarouselController _offerController = CarouselController();
       final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  Widget build(BuildContext context) {



     final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Text(' h h ',style: TextStyle(color: Colors.orange),)
            ))
        .toList();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xffE4E5EB),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            child: Column(children: [
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_backspace_outlined,
                      color: Colors.black,
                      size: 34,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DashboardScreenWidget();
                        },
                      ));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
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
                                children: [
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
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.56,
                              child: Text(
                                'A2B - Adayar Ananda Bhavan',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 2),
                                        child: Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text('4.4 (10K+ ratings)',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  Text(' .  ₹300 for two',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'South Indian, North Indian',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(thickness: 0.5, color: Colors.grey.shade400),
                          SizedBox(
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
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  height: 48,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
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
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 48,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Fairlands Salem',
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
                          SizedBox(
                            height: 10,
                          ),
                          Divider(thickness: 0.5, color: Colors.grey.shade400),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(Icons.directions_bike),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              // height: 48,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '0-12kms',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              //  height: 48,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('|'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
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
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('Rs 190'),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                        color: Color(0xffef6e46),
                                        width: 1.0,
                                      )),
                                  child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 1, 6, 1),
                                      child: Text('LITE',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffef6e46),
                                          )))),
                              Text(
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
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _offerController,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _offerCurrent = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _offerController.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_offerCurrent == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 20,
        ),
        ]),
      ),
    );
  }
}
