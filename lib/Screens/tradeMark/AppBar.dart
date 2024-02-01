import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Login/login_screen.dart';

class homeBar extends StatelessWidget {
  const homeBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: [
          Image.asset('assets/logo/logo.png', height: 33, width: 33),
          SizedBox(
            width: 15,
          ),
          Text(
            this.title,
            style: GoogleFonts.calligraffitti(color: Colors.deepPurple.withBlue(140)),

          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.person)),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
