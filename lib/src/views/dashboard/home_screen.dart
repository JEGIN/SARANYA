// import 'dart:html';

import 'dart:math';

import 'package:application1/src/views/gradient_text.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
    {
      'menu_image':
          'https://t4.ftcdn.net/jpg/04/79/98/13/360_F_479981398_SoHMuDID5KW1giunWjNwlg1QSS3R5n0F.jpg',
      'item_name': 'Pongal',
    },
    {
      'menu_image':
          'https://t3.ftcdn.net/jpg/05/00/04/18/360_F_500041894_FIwsCmxDUhLayLRXYAIzpaDSAWaZ3IZe.jpg',
      'item_name': 'Poori',
    },
    {
      'menu_image':
          'https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Madhuli_Ajay/Aloo_Bonda_Deep_fried_snack_made_with_potato_filling_and_gram_flour_batter.jpg',
      'item_name': 'Bonda',
    },
    {
      'menu_image':
          'https://news.cgtn.com/news/7a556a4e30637a6333566d54/img/f62f5544-c38a-4df5-96dd-847d4eb2df1b.jpg',
      'item_name': 'Tea/Coffee',
    },
    {
      'menu_image':
          'https://i0.wp.com/gomathirecipes.com/wp-content/uploads/2021/09/parotta.jpg?fit=1077%2C720&ssl=1',
      'item_name': 'Parotha',
    },
    {
      'menu_image':
          'https://www.munatycooking.com/wp-content/uploads/2023/12/Chapati-4.jpg',
      'item_name': 'Chappathi',
    },
  ];
  List juiceitemList = [
    {
      'juice_image':
          'https://media.istockphoto.com/id/155376375/photo/fruit-juice.jpg?s=612x612&w=0&k=20&c=DHpot0a67oN-8lSW0CMI7Y4vLM-TlMBBqA7c5kCfrNo=',
      'juice_name': 'Fresh Juice',
    },
    {
      'juice_image':
          'https://t3.ftcdn.net/jpg/06/34/02/58/360_F_634025829_mZccrHVPE7m9Hbp4umMLorWheaADH39i.jpg',
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
    {
      'juice_image':
          'https://t3.ftcdn.net/jpg/06/34/02/58/360_F_634025829_mZccrHVPE7m9Hbp4umMLorWheaADH39i.jpg',
      'juice_name': 'Falooda',
    },
    {
      'juice_image':
          'https://media.istockphoto.com/id/155376375/photo/fruit-juice.jpg?s=612x612&w=0&k=20&c=DHpot0a67oN-8lSW0CMI7Y4vLM-TlMBBqA7c5kCfrNo=',
      'juice_name': 'Fresh Juice',
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
  List carvingList = [
    {
      'carving_Image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/gfqtawdksujwzmglof8k',
      'carving_Item': 'FIT AND ',
      'carving_Name': 'HEALTHY',
    },
    {
      'carving_Image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/gfqtawdksujwzmglof8k',
      'carving_Item': 'REFRESHING',
      'carving_Name': 'DRINKS',
    },
    {
      'carving_Image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/gfqtawdksujwzmglof8k',
      'carving_Item': 'FIT AND ',
      'carving_Name': 'HEALTHY',
    },
    {
      'carving_Image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/gfqtawdksujwzmglof8k',
      'carving_Item': 'FIT AND ',
      'carving_Name': 'HEALTHY',
    },
     {
      'carving_Image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/gfqtawdksujwzmglof8k',
      'carving_Item': 'FIT AND ',
      'carving_Name': 'HEALTHY',
    },
    {
      'carving_Image':
          'https://media-assets.swiggy.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/gfqtawdksujwzmglof8k',
      'carving_Item': 'REFRESHING',
      'carving_Name': 'DRINKS',
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
          height: 180,
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
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: const [
                Text(
                  'CRAVING SOMETHING SPECIAL?',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height:  MediaQuery.of(context).size.height*0.12,
          width: MediaQuery.of(context).size.width,
          child:
          Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: carvingList.length,
            itemBuilder: (BuildContext ctx, int index) {
              return carvingListWidget(carvingList[index]);
            },
          ),),
        ),

           const SizedBox(
          height: 30,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: const [
                Text(
                  '151 RESTAURANTS TO EXPLORE',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ],
            )),
             SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            
            itemCount: menuCardList.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: restaurantListWidget(menuCardList[index]),
              );
            },
          ),
        ),

        const SizedBox(
          height: 100,
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
                  boxShadow: const [
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
                                      children: const [
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
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              image: DecorationImage(
                  image: NetworkImage(
                    data['menu_image'] ?? '',
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
                    data['item_name'] ?? '',
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
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              image: DecorationImage(
                  image: NetworkImage(
                    data['juice_image'] ?? '',
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
                    data['juice_name'] ?? '',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ))
        ]));
  }

  Widget carvingListWidget(data) {
    return
    
    Padding(padding: EdgeInsets.symmetric(horizontal: 5),
    child: Container(
        // height: 100,
        // width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    image: DecorationImage(
                        image: NetworkImage(
                        data['carving_Image'] ?? '',),
                        fit: BoxFit.fill),
                  ),
                ),
                RichText(
                    textAlign: TextAlign.left,
                    text:  TextSpan(
                        text: data['carving_Item'],
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45),
                        children: [
                          TextSpan(text: '\n'),
                          TextSpan(
                              text: data['carving_Name'],
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black))
                        ]))
              ],
            ))));
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

   Widget restaurantListWidget(data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      
      child:
      GestureDetector(
        onTap:() {
          //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  GradientText(gradient: LinearGradient(colors: [Colors.red, Colors.blue]), text: 'Hello Gradient!', textStyle: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),)));
     
        },
     child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Column(children: [
              Container(
                height: 180,
                width: 140,
                // color: Colors.amberAccent,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: const [
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                           
                            Padding(
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
                                      children: const [
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
            ]),
        const SizedBox(
          width: 20,
        ),
        
        Container(
          // height: 30,
          width: 240,
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
                    fontSize: 20,
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
                          fontWeight: FontWeight.w900,
                          color: Colors.black54)),
                            SizedBox(
                    width: 6,
                  ),
                  Text("15-20 min",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                ],
              ),
                SizedBox(
                height: 6,
              ),
              const Text("Briyani,Chinese",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38)),
                        SizedBox(
                height: 6,
              ),
                       const Text("New busstand road,5 KM",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38)),
                      SizedBox(height: 6,),
                     Row( 
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize:MainAxisSize.max,
                       crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
                    children:[
                      Container(
                        
                height: 70,
                width: 240,
              
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xfffffcfe),
                        Color(0xfffeeff2),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
            
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:[
                    Padding(padding:EdgeInsets.all(10.0),
                   child: RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                            text: "Extra 15% OFF ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffef6e46)),
                               
                            children: [
                              TextSpan(text: '\n',),
                              TextSpan(
                                  text: "And Free Delivery",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffef6e46)))
                            ]))),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                        )
                                      ),
                                      child:Padding(padding: EdgeInsetsDirectional.fromSTEB(6, 1, 6, 1),
                                      child:Text('LITE',style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffef6e46),
                                      ))
                                    ))
                                
                                // Padding(
                                //     padding: EdgeInsets.all(10.0),
                                //     child: RichText(
                                //         textAlign: TextAlign.left,
                                //         text: const TextSpan(
                                //             text: "O",
                                //             style: TextStyle(
                                              
                                //                 fontSize: 18,
                                //                 fontWeight: FontWeight.w900,
                                //                 color: Colors.white),
                                //             children: [
                                             
                                //               TextSpan(
                                //                   text: "ne",
                                //                   style: TextStyle(
                                //                       fontSize: 18,
                                //                       fontWeight:
                                //                           FontWeight.w900,
                                //                       color: Colors.white))
                                //             ]))),
                    ] ),
                    SizedBox(width: 5,)
                            
                    ]),
          )])]))],
          ),)
    );
    
    
  }
}
