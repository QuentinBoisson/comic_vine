import 'package:flutter/material.dart';
import 'package:comic_vine/assets/app_colors.dart';

class List extends StatelessWidget {
  const List ({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.screenBackground,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Séries les plus regardées',
              ),
            ],
        ),
      )
    );
  }
}