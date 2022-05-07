import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const d_cottoncolor = Color.fromARGB(255, 255, 188, 217);

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beauty Booking',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchSection(),
            ArtisteSection(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: d_cottoncolor,
          size: 20,
        ),
        onPressed: () {},
      ),
      title: Text('Accueil',
          style: GoogleFonts.poppins(
            color: d_cottoncolor,
            fontSize: 25,
            fontWeight: FontWeight.w200,
          )),
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: d_cottoncolor,
            size: 18,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.place,
            color: d_cottoncolor,
            size: 18,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 129,
      color: Color.fromARGB(81, 255, 188, 217),
      padding: EdgeInsets.fromLTRB(10, 15, 12, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type de prestation',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.search,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    primary: Colors.pinkAccent,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.only(
                  left: 65,
                ),
                child: Column(
                  children: [
                    Text(
                      'Choisir une date',
                      style: GoogleFonts.poppins(
                        color: Colors.pinkAccent,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '04 Mai - 22 Mai',
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ArtisteSection extends StatelessWidget {
  final List artisteList = [
    {
      'title': 'Ines Beauty',
      'Ville': 'Paris 15eme',
      'Distance': 2,
      'Note': 24,
      'Photo': 'images/inesbeauty.png',
      'Prix': '40'
    },
    {
      'title': 'Elle Marmoutier',
      'Ville': 'Melun',
      'Distance': 48,
      'Note': 43,
      'Photo': 'images/beauty2.jpg',
      'Prix': '70'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '259 Estheticienne trouvée',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Filtrée',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.filter_list_outlined,
                        color: Colors.pinkAccent,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: artisteList.map((artiste) {
              return ArtisteCard(artiste);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ArtisteCard extends StatelessWidget {
  final Map artisteData;
  ArtisteCard(this.artisteData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 245,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(
                image: AssetImage(artisteData['Photo']),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: -15,
                  child: MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: d_cottoncolor,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  artisteData['title'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\€' + artisteData['Prix'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  artisteData['Ville'],
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: d_cottoncolor,
                      size: 17,
                    ),
                    Text(
                      artisteData['Distance'].toString() + ' Km de vous',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Certifié BeautyBook',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: d_cottoncolor,
                  size: 20,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rate,
                      color: d_cottoncolor,
                      size: 19,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_cottoncolor,
                      size: 19,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_cottoncolor,
                      size: 19,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: d_cottoncolor,
                      size: 19,
                    ),
                    Icon(
                      Icons.star_border,
                      color: d_cottoncolor,
                      size: 19,
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  artisteData['Note'].toString() + ' Notes',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
