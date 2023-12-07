import 'package:flutter/material.dart';

class Favorites{
  String judul;
  String imagePath;
  String Rating;

  Favorites({
    required this.judul,
    required this.imagePath,
    required this.Rating,
  });
}

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final List <Favorites> ListFavorite =[
    Favorites(judul: 'One Piece', imagePath: 'assets/one_piece.jpg', Rating: '8.45'),
    Favorites(judul: 'Goblin Slayer', imagePath: 'assets/Gs2.png', Rating: '8.50'),
    Favorites(judul: 'SPY X Family', imagePath: 'assets/spy.png', Rating: '8.50'),
  ];
  @override
  Widget build(BuildContext context) {
    var Lebar = MediaQuery.of(context).size.width;
    var Tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: Appbars(),
      body: SingleChildScrollView(
        child: Container(
          width: Lebar,
          height: Tinggi,
          color: Color(0xFF374259),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.fromLTRB(50, 25, 50, 25),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('https://avatars.githubusercontent.com/Kuuhaku456'),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Filipus Adriel Manik',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.yellow,
                ),
              ),
              Text(
                'Creator of CrunchRyoll App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  '19 y.o Stundent from Mulawarman University',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 320,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(2, 2),
                      ),
                    ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          '128',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            color: Color(0xFF374259),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Favorites Anime',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Color(0xFF374259),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          '20.0k',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            color: Color(0xFF374259),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Color(0xFF374259),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          '200',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            color: Color(0xFF374259),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Following',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Color(0xFF374259),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              recommendation_text(),
              SizedBox(height: 10),
              Container(
                width: Lebar,
                height: 270,
                color: Color(0xFF374259),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ListFavorite.length,
                  itemBuilder: (context, index){
                    return Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 250,
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2)),
                            ],
                            image: DecorationImage(
                              image: AssetImage(ListFavorite[index].imagePath),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Container(
                            width: 70,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Color(0xFF331D1D),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                Text(
                                  ListFavorite[index].Rating,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFFE1B486),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 220,
                          left: 20,
                          child: Container(
                            width: 180,
                            height: 35,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFF331D1D),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              ListFavorite[index].judul,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE1B486),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  Padding recommendation_text() {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Favorite Anime',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.yellow,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('Lihat Semua'),
            icon: Icon(Icons.arrow_right_alt_sharp),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF374259), // Warna latar belakang tombol
              onPrimary: Colors.yellow, // Warna teks pada tombol
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Mengatur sudut tombol
              ),
              minimumSize: Size(50, 50),
              elevation: 0.0, // Ukuran minimum tombol
            ),
          ),
        ],
      ),
    );
  }

  AppBar Appbars() {
    return AppBar(
      backgroundColor: Color(0xFF374259),
      leading: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.notifications,
          size: 20,
          color: Colors.yellow
        ),
      ),
      title: Text(
        'Creator Profile',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.yellow,
        ),
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          child: Icon(
            Icons.settings,
            color: Colors.yellow,
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}   