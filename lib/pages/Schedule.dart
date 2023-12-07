import 'package:flutter/material.dart';

class Senin{
  String Judul;
  String Rating;
  String imagePath;

  Senin({
    required this.Judul,
    required this.imagePath,
    required this.Rating, 
  });
}

class Selasa{
  String Judul;
  String Rating;
  String imagePath;

  Selasa({
    required this.Judul,
    required this.imagePath, 
    required this.Rating, 
  });
}

class Rabu{
  String Judul;
  String Rating;
  String imagePath;

  Rabu({
    required this.Judul,
    required this.imagePath, 
    required this.Rating, 
  });
}

class Kamis{
  String Judul;
  String Rating;
  String imagePath;

  Kamis({
    required this.Judul,
    required this.imagePath, 
    required this.Rating, 
  });
}

class Jumat{
  String Judul;
  String Rating;
  String imagePath;

  Jumat ({
    required this.Judul,
    required this.imagePath, 
    required this.Rating, 
  });
}

class Sabtu{
  String Judul;
  String Rating;
  String imagePath;

  Sabtu({
    required this.Judul,
    required this.imagePath, 
    required this.Rating, 
  });
}

class Minggu{
  String Judul;
  String Rating;
  String imagePath;

  Minggu({
    required this.Judul,
    required this.imagePath, 
    required this.Rating, 
  });
}

class JadwalTayang extends StatefulWidget {
  const JadwalTayang({super.key});

  @override
  State<JadwalTayang> createState() => _JadwalTayangState();
}

class _JadwalTayangState extends State<JadwalTayang> {
  final List<Senin> List_senin = [
    Senin(Judul: 'One Piece', imagePath: 'assets/one_piece.jpg', Rating: '8.45'),
    Senin(Judul: 'Goblin Slayer', imagePath: 'assets/Gs2.png', Rating: '8.50'),
    Senin(Judul: 'SPY X Family', imagePath: 'assets/spy.png', Rating: '8.50'),
  ];
  final List<Selasa> List_selasa = [
    Selasa(Judul: 'One Piece', imagePath: 'assets/one_piece.jpg', Rating: '8.45'),
    Selasa(Judul: 'Goblin Slayer', imagePath: 'assets/Gs2.png', Rating: '8.50'),
    Selasa(Judul: 'SPY X Family', imagePath: 'assets/spy.png', Rating: '8.50'),
  ];
  final List<Rabu> List_Rabu = [
    Rabu(Judul: 'One Piece', imagePath: 'assets/one_piece.jpg', Rating: '8.45'),
    Rabu(Judul: 'Goblin Slayer', imagePath: 'assets/Gs2.png', Rating: '8.50'),
    Rabu(Judul: 'SPY X Family', imagePath: 'assets/spy.png', Rating: '8.50'),
  ];
  final List<Kamis> List_kamis = [
    Kamis(Judul: 'One Piece', imagePath: 'assets/one_piece.jpg', Rating: '8.45'),
    Kamis(Judul: 'Goblin Slayer', imagePath: 'assets/Gs2.png', Rating: '8.50'),
    Kamis(Judul: 'SPY X Family', imagePath: 'assets/spy.png', Rating: '8.50'),
  ];
  final List<Jumat> List_jumat = [
    Jumat(Judul: 'One Piece', imagePath: 'assets/one_piece.jpg', Rating: '8.45'),
    Jumat(Judul: 'Goblin Slayer', imagePath: 'assets/Gs2.png', Rating: '8.50'),
    Jumat(Judul: 'SPY X Family', imagePath: 'assets/spy.png', Rating: '8.50'),
  ];
  final List<Sabtu> List_sabtu = [
    Sabtu(Judul: 'One Piece', imagePath: 'assets/one_piece.jpg', Rating: '8.45'),
    Sabtu(Judul: 'Goblin Slayer', imagePath: 'assets/Gs2.png', Rating: '8.50'),
    Sabtu(Judul: 'SPY X Family', imagePath: 'assets/spy.png', Rating: '8.50'),
  ];
  final List<Minggu> List_minggu = [
    Minggu(Judul: 'One Piece', imagePath: 'assets/one_piece.jpg', Rating: '8.45'),
    Minggu(Judul: 'Goblin Slayer', imagePath: 'assets/Gs2.png', Rating: '8.50'),
    Minggu(Judul: 'SPY X Family', imagePath: 'assets/spy.png', Rating: '8.50'),
  ];
  @override
  Widget build(BuildContext context) {
    var Lebar = MediaQuery.of(context).size.width;
    var Tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF374259),
      appBar: AppBar(
        backgroundColor: Color(0xFF374259),
        title: Text(
          'SCHEDULE ANIME',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Senin_schedule(Lebar),
              Selasa_schedule(Lebar),
              Rabu_schedule(Lebar),
              Kamis_Schedule(Lebar),
              Jumat_schedule(Lebar),
              Sabtu_schedule(Lebar),
              Minggu_schedule(Lebar),
            ],
          ),
        ),
      );
  }

  Container Senin_schedule (double Lebar) {
    return Container(
      width: Lebar,
      height: 370,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'SENIN',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(width: 150),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF374259), // Warna latar belakang tombol
                  onPrimary: Colors.yellow, // Warna teks pada tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Mengatur sudut tombol
                  ),
                  minimumSize: Size(50, 50),
                  elevation: 0.0, // Ukuran
                ),
                onPressed: (){}, 
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 10,
                ), 
                label: Text('View All'),
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: Lebar,
            height: 260,
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: List_senin.length,
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
                          image: AssetImage(List_senin[index].imagePath),
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
                          color: Color(0xFF374259),
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
                              List_senin[index].Rating,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.yellow,
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
                          color: Color(0xFF374259),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          List_senin[index].Judul,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
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
    );
  }
  Container Selasa_schedule (double Lebar) {
    return Container(
      width: Lebar,
      height: 370,
      margin: EdgeInsets.all( 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'SELASA',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(width: 130),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF374259), // Warna latar belakang tombol
                  onPrimary: Colors.yellow, // Warna teks pada tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Mengatur sudut tombol
                  ),
                  minimumSize: Size(50, 50),
                  elevation: 0.0, // Ukuran
                ),
                onPressed: (){}, 
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 10,
                ), 
                label: Text('View All'),
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: Lebar,
            height: 260,
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: List_selasa.length,
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
                          image: AssetImage(List_selasa[index].imagePath),
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
                          color: Color(0xFF374259),
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
                              List_selasa[index].Rating,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.yellow,
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
                          color: Color(0xFF374259),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          List_selasa[index].Judul,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
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
    );
  }
  Container Rabu_schedule (double Lebar) {
    return Container(
      width: Lebar,
      height: 370,
      margin: EdgeInsets.all( 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Rabu',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(width: 170),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF374259), // Warna latar belakang tombol
                  onPrimary: Colors.yellow, // Warna teks pada tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Mengatur sudut tombol
                  ),
                  minimumSize: Size(50, 50),
                  elevation: 0.0, // Ukuran
                ),
                onPressed: (){}, 
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 10,
                ), 
                label: Text('View All'),
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: Lebar,
            height: 260,
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: List_Rabu.length,
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
                          image: AssetImage(List_Rabu[index].imagePath),
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
                          color: Color(0xFF374259),
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
                              List_Rabu[index].Rating,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.yellow,
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
                          color: Color(0xFF374259),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          List_Rabu[index].Judul,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
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
    );
  }
  Container Kamis_Schedule (double Lebar) {
    return Container(
      width: Lebar,
      height: 370,
      margin: EdgeInsets.all( 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'KAMIS',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(width: 130),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF374259), // Warna latar belakang tombol
                  onPrimary: Colors.yellow, // Warna teks pada tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Mengatur sudut tombol
                  ),
                  minimumSize: Size(50, 50),
                  elevation: 0.0, // Ukuran
                ),
                onPressed: (){}, 
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 10,
                ), 
                label: Text('View All'),
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: Lebar,
            height: 260,
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: List_kamis.length,
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
                          image: AssetImage(List_kamis[index].imagePath),
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
                          color: Color(0xFF374259),
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
                              List_kamis[index].Rating,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.yellow,
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
                          color: Color(0xFF374259),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          List_kamis[index].Judul,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
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
    );
  }
  Container Jumat_schedule(double Lebar) {
    return Container(
      width: Lebar,
      height: 370,
      margin: EdgeInsets.all( 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'JUMAT',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(width: 130),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF374259), // Warna latar belakang tombol
                  onPrimary: Colors.yellow, // Warna teks pada tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Mengatur sudut tombol
                  ),
                  minimumSize: Size(50, 50),
                  elevation: 0.0, // Ukuran
                ),
                onPressed: (){}, 
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 10,
                ), 
                label: Text('View All'),
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: Lebar,
            height: 260,
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: List_jumat.length,
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
                          image: AssetImage(List_jumat[index].imagePath),
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
                          color: Color(0xFF374259),
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
                              List_jumat[index].Rating,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.yellow,
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
                          color: Color(0xFF374259),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          List_jumat[index].Judul,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
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
    );
  }
  Container Sabtu_schedule(double Lebar) {
    return Container(
      width: Lebar,
      height: 370,
      margin: EdgeInsets.all( 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'SABTU',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(width: 130),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF374259), // Warna latar belakang tombol
                  onPrimary: Colors.yellow, // Warna teks pada tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Mengatur sudut tombol
                  ),
                  minimumSize: Size(50, 50),
                  elevation: 0.0, // Ukuran
                ),
                onPressed: (){}, 
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 10,
                ), 
                label: Text('View All'),
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: Lebar,
            height: 260,
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: List_sabtu.length,
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
                          image: AssetImage(List_sabtu[index].imagePath),
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
                          color: Color(0xFF374259),
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
                              List_sabtu[index].Rating,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.yellow,
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
                          color: Color(0xFF374259),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          List_sabtu[index].Judul,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
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
    );
  }
  Container Minggu_schedule(double Lebar) {
    return Container(
      width: Lebar,
      height: 370,
      margin: EdgeInsets.all( 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'MINGGU',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(width: 130),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF374259), // Warna latar belakang tombol
                  onPrimary: Colors.yellow, // Warna teks pada tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Mengatur sudut tombol
                  ),
                  minimumSize: Size(50, 50),
                  elevation: 0.0, // Ukuran
                ),
                onPressed: (){}, 
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 10,
                ), 
                label: Text('View All'),
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: Lebar,
            height: 260,
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: List_minggu.length,
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
                          image: AssetImage(List_minggu[index].imagePath),
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
                          color: Color(0xFF374259),
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
                              List_minggu[index].Rating,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.yellow,
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
                          color: Color(0xFF374259),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          List_minggu[index].Judul,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
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
    );
  }
}