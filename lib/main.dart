import 'package:flutter/material.dart';
import 'package:untitled41/Yemekler.dart';
import 'package:untitled41/detaySayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future <List<Yemekler>> yemekleriGetir() async
  {
    var y1 = Yemekler(1, "Ayran", "ayran.jpg", 11);
    var y2 = Yemekler(1, "Baklava", "baklava.jpeg", 22);
    var y3 = Yemekler(1, "Fanta", "fanta.jpg", 13);
    var y4 = Yemekler(1, "Kadayıf", "kadayif.jpg", 18);
    var y5 = Yemekler(1, "Köfte", "kofte.jpg", 45);
    var y6 = Yemekler(1, "Makarna", "makarna.jpg", 35);

    var yemekListesi = <Yemekler>[];

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context,snaphot)
        {
          if(snaphot.hasData)
            {
              var yemekListesi = snaphot.data;
              return ListView.builder(

                 itemCount: yemekListesi!.length,
                  itemBuilder: (context,index)
                  {
                    var yemek = yemekListesi[index];

                    return GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => detaySayfa(yemek)));
                      },
                      child: Card (

                        child: Row(
                          children: [

                            Image.asset("images/${yemek.yemek_resim_adi}",width: 150,),

                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${yemek.yemek_adi}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 20,),
                                  Text("${yemek.yemek_fiyat} \u{20BA}",style: TextStyle(fontSize: 25, color: Colors.blue)),

                                ],
                              ),
                            ),
                            Spacer(),
                        Icon(Icons.keyboard_arrow_right),

                          ],
                        ),

                      ),
                    );


                  }

              );
            }
              else
                {
                  return Center(
                    child: Text("Veri Alınamadı."),
                  );
                }
        },
      ),

    );
  }
}
