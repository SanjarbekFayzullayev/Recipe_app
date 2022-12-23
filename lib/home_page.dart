import 'package:flutter/material.dart';
import 'package:ricep_app/detals_page.dart';
import 'Model/Recipe.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static List<Recipe> list = [
    Recipe("Palov", "images/palov.jpg", 45000, "Grunch , Go'sh , Sabzi , Pizyoz",
        "Osh juda yaxshi ovat bo'lib odatda o'zbekiston va chet el davlatlarda ko'p istemol qilainadi. Oshda juda ko'p foydali mahsulotlat bilar qilnisa inson sog'ligi uchun juda foydali bo'ladi desak mubolag'a bo'lmaydi."),
    Recipe("Qazi", "images/qazi.jpg", 70000, "Ot go'shti,Piyoz",
        "Qazi ovqati ko' hollarda ot go'shtini 8-7 yil saqlangan go'shdan tayyorlanadi , Ko'plab istemolchilar yoshlarni tashkil qiladi chunki yoshi katta insonlaraga  qattoiyan man qilinadi"),
    Recipe(
        "Chuchvara",
        "images/chuchvara.jpg",
        20000,
        "Yarim tayyor chuchvara, Ziravaorlar",
        "Chuchvara hozirgi kunda yarim tayyor mahsulotlar bilan uy bekalarimiz tayyorlashj vaqatini hamda mehnatni kamaytirmoqdalar ammo yarim tayyor ,mahsulotlarni muddatida ehtyot bo'ling."),
    Recipe("Somsa", "images/samsa.jpg", 18000, "Go'sht , Hamir , Piyoz",
        "Somsa uy bekalarnimiZ va uydagi hamma yahshi ko'radigan ovaqtlardan biri bo'lib u juda ko'p hollarada qo'y go'shtidan qilinsa ko'ngildagidek chiqadi."),
    Recipe("Honim", "images/homnim.jpg", 30000, "Go'sht , Piyoz , Hamir",
        "Honim mantini singlisi desagham bo'ladi albatta bu hazil . Odatda honim ovqati mantiqosqonda bishiriladi un inson terisigaham foydasi juda katta buni asosiy sababai u bug'da pshirlanligidir."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe App"),
        backgroundColor: Colors.grey,
      ),
      body: ListView(
        children: [
          mycard(list[0], context),
          mycard(list[1], context),
          mycard(list[2], context),
          mycard(list[3], context),
          mycard(list[4], context),
        ],
      ),
    );
  }

  Widget mycard(Recipe recipe, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalsPage(
              name: recipe.title,
              about: recipe.allAbout,
              image: recipe.imageUrl,
                maynan:recipe.cost,

            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(18.0),
        elevation: 72,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              color: Colors.white60,
              child: Image.asset(recipe.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Nomi: " + recipe.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Narhi: " + recipe.cost.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Tarkibi: " + recipe.ingredient,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
