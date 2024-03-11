import 'dart:html';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../global/app_urls.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  TextEditingController searchController = TextEditingController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List offerList = [
    {
      'offers': 'Min ₹ 100 off',
      'deals': 'Flat deals',
    },
    {
      'offers': 'Pocket Hero',
      'deals': '60% off + Cashback',
    },
    {
      'offers': 'Flash Sale',
      'deals': 'Free delivery',
    },
    {
      'offers': 'All offers',
      'deals': '60% off and more',
    },
  ];
  List menuCardList = [
    {
      'image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/gfqtawdksujwzmglof8k',
      'hotel_name': 'Salem RR Briyani',
      'rating': '4.2',
      'offer': '60% off',
    },
    {
      'image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/chnluyrhpzw3se2kutsv',
      'hotel_name': 'Mangalam Biryani',
      'rating': '3.2',
      'offer': '30% off',
    },
    {
      'image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/al94ixpykjk1jtoemjtv',
      'hotel_name': 'KFC Biryani',
      'rating': '3.9',
      'offer': '40% off',
    },
    {
      'image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/gfqtawdksujwzmglof8k',
      'hotel_name': 'Lakshmi Hotel',
      'rating': '4.4',
      'offer': '20% off',
    },
    {
      'image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/chnluyrhpzw3se2kutsv',
      'hotel_name': 'Mohal Biryani',
      'rating': '4.8',
      'offer': '50% off',
    },
    {
      'image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/al94ixpykjk1jtoemjtv',
      'hotel_name': 'Kalyan Biryani',
      'rating': '2.8',
      'offer': '80% off',
    }
  ];
  List imageList = [
    'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/gfqtawdksujwzmglof8k',
    'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/al94ixpykjk1jtoemjtv',
    'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/chnluyrhpzw3se2kutsv',
  ];
  List deliveryList = [
    {
      'delivery': 'One Free Delivery',
      'offerpercent': '60% off upto 120',
    },
    {
      'delivery': 'One Free Delivery',
      'offerpercent': '50% off upto 100',
    },
    {
      'delivery': 'One Free Delivery',
      'offerpercent': '30% off upto 50',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
        // appBar: AppBar(title: Text('Carousel with indicator controller demo')),
        body: SingleChildScrollView(
            child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search',
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
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
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: const [
                Text(
                  'BEST OFFERS FOR YOU',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemCount: offerList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return offerWidget(offerList[index]);
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: const [
                Text(
                  'TOP RATED NEAR YOU',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
     child:   ListView.builder(
          shrinkWrap: true,
          physics:ScrollPhysics(),
          scrollDirection: Axis.horizontal,
        
          itemCount: menuCardList.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: menuCardListWidget(menuCardList[index]),
            );
          },
        ),),
         const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: const [
                Text(
                  'Hi, Whats on your Mind',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ],
            )),
              SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
     child:   ListView.builder(
          shrinkWrap: true,
          physics:ScrollPhysics(),
          scrollDirection: Axis.horizontal,
        
          itemCount: menuCardList.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: menuCardListWidget(menuCardList[index]),
            );
          },
        ),),
      ],
    )));
    
  }

  Widget menuCardListWidget(data) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 20),
    //   child: Container(
    //     height: 180,
    //     width: 140,
    //     decoration: BoxDecoration(
    //       borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey,
    //           offset: const Offset(0.0, 1.0),
    //           blurRadius: 6.0,
    //         ),
    //       ],
    //       image: DecorationImage(
    //         image: NetworkImage(imageUrl),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(top: 6),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                 height: 30,
    //                 width: 100,
    //                 decoration: const BoxDecoration(
    //                   gradient: LinearGradient(
    //                     colors: [
    //                       Color(0xffef6e46),
    //                       Color(0xffd54964),
    //                     ],
    //                     begin: Alignment.centerLeft,
    //                     end: Alignment.centerRight,
    //                   ),
    //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                 ),
    //                 child: Center(
    //                   child: RichText(
    //                     textAlign: TextAlign.left,
    //                     text: const TextSpan(
    //                       text: "One ",
    //                       style: TextStyle(
    //                         fontSize: 10,
    //                         fontWeight: FontWeight.w900,
    //                         color: Colors.white,
    //                       ),
    //                       children: [
    //                         TextSpan(
    //                           text: " Free Delivery",
    //                           style: TextStyle(
    //                             fontSize: 10,
    //                             fontWeight: FontWeight.normal,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               const Padding(
    //                 padding: EdgeInsets.only(right: 6),
    //                 child: Icon(
    //                   Icons.favorite_border_outlined,
    //                   color: Colors.red,
    //                   size: 20,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(right: 20, bottom: 10),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               RichText(
    //                 textAlign: TextAlign.left,
    //                 text: const TextSpan(
    //                   text: "60% Off",
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.w900,
    //                     color: Colors.white,
    //                   ),
    //                   children: [
    //                     TextSpan(
    //                       text: '\n',
    //                     ),
    //                     TextSpan(
    //                       text: "UPTO 120",
    //                       style: TextStyle(
    //                         fontSize: 10,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           width: 130,
    //           color: Colors.transparent,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const Text(
    //                 "Salem RR Briyani",
    //                 style: TextStyle(
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //               ),
    //               Row(
    //                 children: const [
    //                   Padding(
    //                     padding: EdgeInsets.only(right: 0),
    //                     child: Icon(
    //                       Icons.star_rate_rounded,
    //                       color: Colors.green,
    //                       size: 20,
    //                     ),
    //                   ),
    //                   Text(
    //                     " 4.4, ",
    //                     style: TextStyle(
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.black54,
    //                     ),
    //                   ),
    //                   Text(
    //                     "15-20 min",
    //                     style: TextStyle(
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.black54,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               const Text(
    //                 "Briyani,Chinese",
    //                 style: TextStyle(
    //                   fontSize: 10,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black38,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return 
    Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
    child:Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(children: [
            Container(
              height: 180,
              width: 140,
              // color: Colors.amberAccent,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                    image: NetworkImage(
                    data['image'],
                    ),
                    fit: BoxFit.cover),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 100,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffef6e46),
                                    Color(0xffd54964),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Center(
                                child: RichText(
                                    textAlign: TextAlign.left,
                                    text: const TextSpan(
                                        text: "One ",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white),
                                        children: [
                                          TextSpan(
                                              text: " Free Delivery",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white))
                                        ]))),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.red,
                                weight: 20,
                                size: 20,
                              )),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                textAlign: TextAlign.left,
                                text:  TextSpan(
                                    text: data ['offer'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                    children: [
                                      TextSpan(
                                        text: '\n',
                                      ),
                                      TextSpan(
                                          text: "UPTO 120",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))
                                    ])),
                          ]))
                ],
              ),
            ),
          ])),
      const SizedBox(
        height: 20,
      ),
      Container(
        // height: 30,
        width: 130,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: [
             Text(
             data['hotel_name'],
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Row(
              children:  [
                Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Icon(
                      Icons.star_rate_rounded,
                      color: Colors.green,
                      weight: 20,
                      size: 20,
                    )),
                Text(data['rating'],
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
                Text("15-20 min",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
              ],
            ),
            const Text("Briyani,Chinese",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38))
          ],
        ),
      )
    ]),);
  }


  Widget offerWidget(data) {
    return Container(
      // height: 70,
      // width: 150,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          gradient: LinearGradient(
              colors: data['offers'] == 'Min ₹ 100 off'
                  ? [const Color(0xfffcebf3), const Color(0xfffdf8fc)]
                  : data['offers'] == 'Pocket Hero'
                      ? [const Color(0xfff1eafe), const Color(0xfffafafb)]
                      : data['offers'] == 'Flash Sale'
                          ? [
                              const Color.fromARGB(255, 230, 216, 213),
                              const Color.fromARGB(255, 240, 197, 188)
                            ]
                          : data['offers'] == 'All offers'
                              ? [
                                  const Color(0xffebf8f4),
                                  const Color(0xfffafdfc)
                                ]
                              : [
                                  const Color(0xfffcebf3),
                                  const Color(0xfffdf8fc)
                                ])),

      child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data['offers'].toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: data['offers'] == 'Min ₹ 100 off'
                          ? const Color(0xffd8348b)
                          : data['offers'] == 'Pocket Hero'
                              ? const Color(0xff6647d7)
                              : data['offers'] == 'Flash Sale'
                                  ? const Color(0xfff1684c)
                                  : data['offers'] == 'All offers'
                                      ? const Color(0xff22a273)
                                      : Colors.black)),
              Text(data['deals'],
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: data['offers'] == 'Min ₹ 100 off'
                          ? const Color(0xffd8348b)
                          : data['offers'] == 'Pocket Hero'
                              ? const Color(0xff6647d7)
                              : data['offers'] == 'Flash Sale'
                                  ? const Color(0xfff1684c)
                                  : data['offers'] == 'All offers'
                                      ? const Color(0xff22a273)
                                      : Colors.black))
            ],
          )),
    );
  }
}
