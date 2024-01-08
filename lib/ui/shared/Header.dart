import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class Header extends StatelessWidget {
  final String title;
  final String subTitle;
  final EdgeInsets? padding;

   const Header({
     super.key,
     this.padding,
     required this.title,
     required this.subTitle

 });

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [

      Padding(
        padding: EdgeInsets.only(top: padding?.top ?? 127),
        child: Text(
          this.title,
            style: Theme.of(context).textTheme.headlineLarge!.apply(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: GoogleFonts.sacramento().fontFamily,
              ),
          ),
      ),
        Padding ( 
          padding: const EdgeInsets.only(top: 6),
          child: Text(
          this.subTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

      ],

    );
    
  } 

}
