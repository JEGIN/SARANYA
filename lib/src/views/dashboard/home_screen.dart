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
      body: Column(children: [
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
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
              children: [
                const Text(
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
              children: [
                const Text(
                  'TOP RATED NEAR YOU',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ],
            )),

            Column(
              children: [
                Container(
                  height: 200,
                  width: 150, 
                  color: Colors.amberAccent,
                ),
                Container(
                  // height: 30,
                  width: 150, 
                  color: Colors.transparent,
                  child: Column(children: [
                    Text("Salem RR Briyani",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),), 
                     Text("15-20 min",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black54)),
                      Text("Briyani,Chinese",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.black38))
                  ],),
                )



              ],
            )
      ]),
    );
  }

  Widget offerWidget(data) {
    return Container(
      // height: 70,
      // width: 150,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        gradient:
            LinearGradient(
              
              colors: 
             data['offers'] == 'Min ₹ 100 off'
                          ?  [const Color(0xfffcebf3), const Color(0xfffdf8fc)]
                          : data['offers'] == 'Pocket Hero'
                              ?  [const Color(0xfff1eafe), const Color(0xfffafafb)]
                              : data['offers'] == 'Flash Sale'
                                  ? [Color.fromARGB(255, 230, 216, 213), Color.fromARGB(255, 240, 197, 188)
                            ]
                                  : data['offers'] == 'All offers'
                                      ? [const Color(0xffebf8f4), const Color(0xfffafdfc)]
                                      : [const Color(0xfffcebf3), const Color(0xfffdf8fc)])
            
            ),
      
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
                  style:  TextStyle(
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
