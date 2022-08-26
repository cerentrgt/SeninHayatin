import 'package:flutter/material.dart';

import 'HavaDurumuScreens/HavaDurumu.dart';




class HavaDurumuPage extends StatefulWidget {
  const HavaDurumuPage({Key? key}) : super(key: key);

  @override
  State<HavaDurumuPage> createState() => _HavaDurumuPageState();
}

class _HavaDurumuPageState extends State<HavaDurumuPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HavaDurumu(),
    );
  }
}
