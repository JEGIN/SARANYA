import 'package:application1/global/app_urls.dart';
import 'package:application1/homepage.dart';
import 'package:application1/src/views/carousal.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RestaurantDetailsScreenWidget extends StatefulWidget {
  const RestaurantDetailsScreenWidget({super.key});

  @override
  State<RestaurantDetailsScreenWidget> createState() =>
      _RestaurantDetailsScreenWidgetState();
}

class _RestaurantDetailsScreenWidgetState
    extends State<RestaurantDetailsScreenWidget> {
  @override
  Widget build(BuildContext context) {
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
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
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
                          )
                        ],
                      )),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
