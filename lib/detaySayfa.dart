
import 'package:flutter/material.dart';
import 'package:untitled41/Yemekler.dart';

class detaySayfa extends StatefulWidget {

  Yemekler yemek;


  detaySayfa(this.yemek);

  @override
  State<detaySayfa> createState() => _detaySayfaState();
}

class _detaySayfaState extends State<detaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.yemek.yemek_adi}"),
      ),
      body: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [



              Image.asset("images/${widget.yemek.yemek_resim_adi}",width: 300,),

              Text("${widget.yemek.yemek_adi}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

              Text("${widget.yemek.yemek_fiyat} \u{20BA}",style: TextStyle(fontSize: 25, color: Colors.blue)),

              ElevatedButton(onPressed: ()
                  {
                    print('${widget.yemek.yemek_adi} sipariş verildi.');
                }, child: Text("Sipariş Ver"))


            ],

          ),

      ),
    );

  }
}
