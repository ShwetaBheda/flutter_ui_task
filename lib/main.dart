import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AutoScrollPageView(),
    );
  }
}

class AutoScrollPageView extends StatefulWidget {
  const AutoScrollPageView({super.key});

  @override
  _AutoScrollPageViewState createState() => _AutoScrollPageViewState();
}

class _AutoScrollPageViewState extends State<AutoScrollPageView> {
  final PageController _pageController = PageController();
  final List<String> imageList = [
    'https://t4.ftcdn.net/jpg/02/40/63/55/360_F_240635575_EJifwRAbKsVTDnA3QE0bCsWG5TLhUNEZ.jpg',
    'https://t3.ftcdn.net/jpg/00/86/56/12/360_F_86561234_8HJdzg2iBlPap18K38mbyetKfdw1oNrm.jpg',
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      int nextPage = _pageController.page!.toInt() + 1;
      if (nextPage == imageList.length) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color purpleColor = const Color.fromARGB(255, 226, 219, 246);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card & Wallets"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 0, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: purpleColor,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: _pageController,
                                  itemCount: imageList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromARGB(
                                            255, 198, 183, 241),
                                      ),
                                      child: Image.network(
                                        imageList[index],
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                                Positioned(
                                  bottom: 10.0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Container(
                                      height: 5,
                                      child: SmoothPageIndicator(
                                        controller: _pageController,
                                        count: imageList.length,
                                        effect: const ExpandingDotsEffect(
                                          dotHeight: 4,
                                          dotWidth: 10,
                                          spacing: 8,
                                          activeDotColor: Colors.white,
                                          dotColor: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 50),
                          child: const Row(
                            children: [
                              Text(
                                "Card status : ",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Inactive",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.white),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: purpleColor,
                            ),
                            child: const Text(
                              "Guide",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 39, 0, 148)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: const Border(
                      bottom: BorderSide(
                          width: 1, color: Color.fromARGB(255, 198, 183, 241)),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Activate your Lifeline Card",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const Text(
                      "₹ 3499/- Life Time",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const Text(
                      "₹ 9999/Year",
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    const Text(
                      "Offer Ends Soon!",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      color: const Color.fromARGB(255, 29, 0, 109),
                      child: const Text(
                        "Activate Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    const Text(
                      "Our Features",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        commanGreyText(text: "Udhar Limit: ", amout: "₹ 74425"),
                        const SizedBox(width: 14),
                        commanGreyText(
                            text: "CP EMI Limit: ", amout: "₹ 74425"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commanGreyBox(
                            text: "Udhar",
                            icon: const Icon(
                              Icons.notes,
                              size: 60,
                              color: Colors.grey,
                            )),
                        commanGreyBox(
                            text: "CP EMI",
                            icon: const Icon(
                              Icons.notes,
                              size: 60,
                              color: Colors.grey,
                            )),
                        commanGreyBox(
                          text: "Businness Funds",
                          icon: const Icon(
                            Icons.notes,
                            color: Colors.grey,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Wallet",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              walletWidgets(),
              const SizedBox(height: 10),
              walletWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget commanGreyText({required String text, required String amout}) {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border.all(width: 1, color: Colors.grey.shade300),
    ),
    child: Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Text(
          amout,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    ),
  );
}

Widget commanGreyBox({required String text, required Widget icon}) {
  return Column(
    children: [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
            border: Border.all(width: 1, color: Colors.grey.shade300),
          ),
          child: icon),
      const SizedBox(
        height: 5,
      ),
      Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    ],
  );
}

Widget walletWidgets() {
  return Container(
    padding: const EdgeInsets.only(left: 10, top: 10, bottom: 0),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 29, 0, 109),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            walletColumnText(
              title: 'Lifeline Card Wallet',
              desc: 'Upcomming EMI/Udhar',
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: walletColumnText(
                title: '4356',
                desc: '4356',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Withdraw",
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 29, 0, 109),
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Transfer",
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 29, 0, 109),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0), color: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color.fromARGB(255, 226, 219, 246),
                ),
                child: const Text(
                  "More",
                  style: TextStyle(color: Color.fromARGB(255, 39, 0, 148)),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget walletColumnText({required String title, required String desc}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Text(
        desc,
        style: const TextStyle(fontSize: 12, color: Colors.black),
      ),
    ],
  );
}
