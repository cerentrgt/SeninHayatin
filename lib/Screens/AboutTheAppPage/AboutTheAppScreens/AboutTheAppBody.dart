import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutTheAppBody extends StatefulWidget {
  const AboutTheAppBody({Key? key}) : super(key: key);

  @override
  State<AboutTheAppBody> createState() => _AboutTheAppBodyState();
}

class _AboutTheAppBodyState extends State<AboutTheAppBody> {
  var userName = FirebaseAuth.instance.currentUser!.displayName ?? "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD1C4E9),
              Color(0xFFB39DDB),
              Color(0xFF9575CD),
              Color(0xFF7E57C2),
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Merhaba $userName ",
              style: TextStyle(fontSize: 30, color: Colors.blueAccent),
            ),
            SizedBox(
              height: 10,
            ),


                  Text(
                    "Uygulama hakkında bilgi almak için buradasınız.",
                    style: TextStyle(fontSize: 18,color: Colors.white),
                  ),


                  Text(
                    "Uygulamamızı şu sebeplerden dolayı tasarladık :  ",
                    style: TextStyle(fontSize: 18,color: Colors.white),
                  ),

           SizedBox(height: 10,),
           Text(
                "=> İlk olarak sizin bir anı defterinizi oluşturalım dedik ve Anılar sayfasını yaptık. ",
                style: TextStyle(fontSize: 17,color: Colors.white),
              ),

           Text(
                "=> İkinci olarak hayal kurmanızı onları gerçekleştirmenizi,gerçekleştirince mutlu olmanızı istedik ve Hayaller sayfasını yaptık. ",
                style: TextStyle(fontSize: 17,color: Colors.white),
              ),

            Text(
                "=> Ve son olarak Notlarım sayfasını yaptık. Notlarım sayfasını sizin için önemli olan bilgileri unutmanızı engellemek istedik.",
                style: TextStyle(fontSize: 17,color: Colors.white),
              ),
            Text(
              "=> Hayatınız sizin için önemlidir. Onu doyasıya yaşamalısınız.",
              style: TextStyle(fontSize: 17,color: Colors.white),
            ),

            SizedBox(height: 150,),
            Divider(color: Colors.blue, height: 20, thickness: 2),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                 Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Eğer daha fazla bilgi almak isterseniz",
                          style: TextStyle(fontSize: 17,color: Colors.black),
                        ),
                      ],
                    ),
                       Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "E-mail : veyselceren25@gmail.com",
                          style: TextStyle(fontSize: 17,color: Colors.black),
                        ),
                      ],
                    ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
