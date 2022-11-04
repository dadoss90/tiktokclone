
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:web_ffi/web_ffi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ODC Tiktok',
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          // BottomNavigationBarItem(
          //   icon: Image.asset(
          //     'assets/images/Add.png',
          //   height: 25,
          //    ),
          //   label: 'Ajouter',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_outlined),
            label: 'Boite de reception',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF141518),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}


class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final List<Map> tiktokItems = [
    {
      "video": "Assets/videos/tiktok.mp4",
    },
    {
      "video": "Assets/videos/tiktok2.mp4",
    },
     {
      "video": "Assets/videos/tiktok3.mp4",
    },
     {
      "video": "Assets/videos/tiktok.mp4",
    },
     {
      "video": "Assets/videos/tiktok2.mp4",
    },
     {
      "video": "Assets/videos/tiktok3.mp4",
    },
  ];
  @override
  Widget build(BuildContext context) {
  return CarouselSlider(
  options: CarouselOptions(
    height: double.infinity,
    scrollDirection: Axis.vertical,
    viewportFraction: 1.0,
    ),
  items: tiktokItems.map((item) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          color: const Color(0xFF141518),
          child: Stack(
            children:  [
              Videowidget(videoUrl: item['video']),
            const  postContent()
            ],
        ),
        );
      },
    );
  }).toList(),
);
  }
  }


class Videowidget extends StatefulWidget{
  Videowidget({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override 
  _VideowidgetState createState() => _VideowidgetState(this.videoUrl);
}

class _VideowidgetState extends State<Videowidget> {
  late VideoPlayerController _controller;
 final String videoUrl;
 _VideowidgetState(this.videoUrl);

 @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        // _controller.play();
        setState(() {});
      });
  }
  @override 
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}


class postContent extends StatelessWidget {
  const postContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Container(
        height: 100, 
        // color: Colors.blue,
        child: Row(
          children: const [
            Text(
              'Suivi', 
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 20),
            Text(
              'Pour Toi', 
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.w600),
            ),
          ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red.withOpacity(0.5),
                    ),
                ),
                Container(
                  width: 80,
                   color: Colors.green,
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [ 
                      Container(
                        height: 80, 
                        color: Colors.blue,
                        ), Container(
                        height: 80, 
                        color: Colors.teal,
                        ), Container(
                        height: 80, 
                        color: Colors.yellow,
                        ), Container(
                        height: 80, 
                        color: Colors.orange,
                        ),
                      Container(
                        height: 80, 
                        color: Colors.purple,
                        ),
                    ]),
                   )
              ],),
          ),
        ),
    ],);
  }
}