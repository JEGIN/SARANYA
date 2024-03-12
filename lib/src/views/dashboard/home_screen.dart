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
  List fooditemList = [
    {
      'menu_image':
          'https://i2.wp.com/www.happyandharried.com/wp-content/uploads/2018/04/IMG_2115.jpg',
      'item_name': 'Dosa',
    },
    {
      'menu_image':
          'https://t4.ftcdn.net/jpg/04/26/94/99/360_F_426949957_iFC4zrETHm1lFMiLpsVXeAhFQe6vCNAk.jpg',
      'item_name': 'Idli',
    },
    //      {
    //   'menu_image': 'https://images.herzindagi.info/image/2024/Jan/pongal-recipes.jpg',
    //  'itemname':'Pongal',
    //  },
    {
      'menu_image': 'https://t3.ftcdn.net/jpg/05/00/04/18/360_F_500041894_FIwsCmxDUhLayLRXYAIzpaDSAWaZ3IZe.jpg',
      'itemname': 'Pongal',
    },

    {
      'menu_image':
          'https://t3.ftcdn.net/jpg/05/00/04/18/360_F_500041894_FIwsCmxDUhLayLRXYAIzpaDSAWaZ3IZe.jpg',
      'item_name': 'Poori',
    },
  ];
  List juiceitemList = [
    {
      'juice_image':
          'data:image/jpeg;base64,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',
      'juice_name': 'Fresh Juice',
    },
    {
      'juice_image':
          'data:image/jpeg;base64,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',
      'juice_name': 'Falooda',
    },
    {
      'juice_image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Ice_cream_with_whipped_cream%2C_chocolate_syrup%2C_and_a_wafer_%28cropped%29.jpg/640px-Ice_cream_with_whipped_cream%2C_chocolate_syrup%2C_and_a_wafer_%28cropped%29.jpg',
      'juice_name': 'IceCream'
    },
    {
      'juice_image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt9xJrsmyTx8J9GtY-gDUOK_-ilar5qmq7MA&usqp=CAU',
      'juice_name': 'Waffles'
    },
    {
      'juice_image':
          'https://assets.limetray.com/assets/image_manager/uploads/8180/omsweets-ss-slide-2.jpg',
      'juice_name': 'Sweets'
    },
    {
      'juice_image':
          'https://joyfoodsunshine.com/wp-content/uploads/2020/08/best-chocolate-cake-recipe-from-scratch-8.jpg',
      'juice_name': 'Cakes',
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
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: menuCardList.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: menuCardListWidget(menuCardList[index]),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
          width: 20,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: const [
                Text(
                  'Hi, Whats on your Mind?',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ],
            )),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: fooditemList.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: foodItemListWidget(fooditemList[index]),
              );
            },
          ),
        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: juiceitemList.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: juiceItemListWidget(juiceitemList[index]),
              );
            },
          ),
        ),
      ],
    )));
  }

  Widget menuCardListWidget(data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(children: [
              Container(
                height: 180,
                width: 140,
                // color: Colors.amberAccent,
                decoration: BoxDecoration(
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
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                  text: TextSpan(
                                      text: data['offer'],
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
                children: [
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
      ]),
    );
  }

  Widget foodItemListWidget(data) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.5),
        child: Column(children: [
          Container(
            height: 100,
            width: 100,
            // color: Colors.amberAccent,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              image: DecorationImage(
                  image: NetworkImage(
                    data['menu_image'],
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              // height: 30,
              width: 130,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: [
                  Text(
                    data['item_name'],
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ))
        ]));
  }

  Widget juiceItemListWidget(data) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.5),
        child: Column(children: [
          Container(
            height: 100,
            width: 100,
            // color: Colors.amberAccent,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              image: DecorationImage(
                  image: NetworkImage(
                    data['juice_image'],
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              // height: 30,
              width: 130,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: [
                  Text(
                    data['juice_name'],
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ))
        ]));
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
