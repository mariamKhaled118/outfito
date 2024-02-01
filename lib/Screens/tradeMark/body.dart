import 'package:flutter/material.dart';

import 'component/linkOfBrands.dart';


class HomeBody extends StatefulWidget {
  @override
  _MyBodyPageState createState() => _MyBodyPageState();
}

class _MyBodyPageState extends State<HomeBody> {



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'Zara',
                  brandGender:
                      'Latest trends in clothing for women & men & kids at ZARA online.'
                      ' Find new arrivals, fashion catalogs, collections & look books every week.',
                  image: AssetImage('assets/home/zara.jpeg'),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'H & M',
                  brandGender:
                      'H&M is your shopping destination for fashion, home,'
                      ' beauty, kids\'clothes and more. '
                      'Browse the latest collections and find quality pieces at affordable ',
                  image: AssetImage('assets/home/H & M.png'),
                ),
              ),
              SizedBox(
                width: 14,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'SHEIN',
                  brandGender:
                      'SHEIN is a fun and ultra-affordable online shopping platform.'
                      ' From fashion apparel to home, beauty, accessories, shoes and pet, plus electronics, '
                      'tools, office and more, SHEIN is dedicated to meet all your needs in life. ',
                  image: AssetImage('assets/home/shein.png'),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'BERSHKA',
                  brandGender:
                      'Do you never miss the latest fashion trends? Do you live to discover new outfits?'
                      ' Are your looks a hit wherever you go? '
                      'Then you have come to the perfect place! 😜',
                  image: AssetImage('assets/home/BERSHKA.png'),
                ),
              ),
              SizedBox(
                width: 14,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'Stradivarius',
                  brandGender:
                      'Stradivarius is the online women\'s clothing store you were looking for.'
                      ' Get the best prices on the latest trends in the world of fashion with the best shopping experience,'
                      ' welcome to the Stradivarius app',
                  image: AssetImage('assets/home/Stradivarius.png'),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'Lefties',
                  brandGender:
                      'Discover the latest Lefties collections in our new app.'
                      ' Enjoy a functional application while discovering the latest trends for women, men, '
                      'kids, babies, footwear, accessories and editorials with all the trends of the season.',
                  image: AssetImage('assets/home/lefties.png'),
                ),
              ),
              SizedBox(
                width: 14,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'Ravin',
                  brandGender:
                      'Ravin is the fastest-growing Fashion Retailer in the MENA, growing bigger than ever,'
                      ' we are dedicated to bring you the latest fashion trends at affordable prices for women,'
                      ' men and Kids. Our Collection is updated weekly with new styles every week coming in. Ravin app was build to make your shopping experience easier and enjoyable. '
                      'It’s the most expulsive channel for our clients to never miss a sell or a promotion',
                  image: AssetImage('assets/home/ravin.png'),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'Town Team',
                  brandGender:
                      'TOWN TEAM was founded in 1998. TOWN TEAM is one of most popular '
                      'men’s fashion brands in EGYPT specialized in casual wear and '
                      'is constantly growing and spreading nationwide across the EGYPT '
                      'located in the most Central high-end locations, malls, street retail.',
                  image: AssetImage('assets/home/town team.png'),
                ),
              ),
              SizedBox(
                width: 14,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'LC Waikiki',
                  brandGender:
                      'To dress people in line with their styles and budgets and make'
                      ' them feel good based on “Everyone Deserves to Dress Well” mission.',
                  image: AssetImage('assets/home/lc.png'),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'DeFacto',
                  brandGender: 'It offers an unprecedented shopping experience. You too, enter the application, from all categories '
                      'Enjoy your easy shopping! From the campaign products to the leading collections,'
                      ' the latest from fashion t-shirt trends to holiday outfits. DeFacto present new and unique user experience waiting!',
                  image: AssetImage('assets/home/defacto.png'),
                ),
              ),
              SizedBox(
                width: 14,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'Max Fashion',
                  brandGender: 'Thinking about shopping? we got you covered at Max Fashion! '
                      'It’s the biggest fashion brand in the Middle east offering exceptional value. '
                      'Shop from over 20,000 styles across Womenswear, kids wear – (baby, toddlers, teens), '
                      'Menswear, home, accessories, beauty & more. '
                      'Max Fashion - look stylish, stay fashionable and make a statement. Download our app now.',
                  image: AssetImage('assets/home/max.jpeg'),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: LinkBrand(
                  brandName: 'CIDER',
                  brandGender: 'We curate an inspired closet for the global trendsetter in all of us,'
                      ' bringing you affordable,'
                      ' everyday statement pieces that make you feel like the main character every single day.',
                  image: AssetImage('assets/home/cider.png'),
                ),
              ),
              SizedBox(
                width: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
