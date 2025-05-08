import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Typing Speed'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
Random r=new Random();
List<String> l=["I have always been an average student in my class. This hurt my feelings and then I resolved that I shall study very hard and become a rank holder. I wanted to be placed among the first three at the end of each examination.Since, I have a strong will power so I worked hard all day long. I paid great attention to all that the teachers taught in the class and also spent a lot of fruitful time in studying in the library. At home too I would sit down at my study table for hours before going to play with my friends.","Been two years, our memories are blurred Hadn't heard your voice, no, not a word But still they, they talk about the things we were They talk about us But I don't know the things that you have heard She's dancing on your feet With our song on repeat","bisikan keluhan hasrat hati di akhr jambangan kisah sedih katakan padanya aku pergi membawa derita sendiri rayuan suara hati hamba mengukir kenangan penuh duka didalam hati ingin bertanya"];

 int n=r.nextInt(l.length);

class _MyHomePageState extends State<MyHomePage> {
TextEditingController nameController=TextEditingController();
int c=60;
  @override
  void _startCountDown(){
    nameController.text="";
    Timer.periodic(Duration(seconds: 1),(timer){
      if(c>0){
      setState(() {
        c--;
        if(c==0){
          c=0;
          _verify();
          timer.cancel();
        }
      });
    }
  });
  }
  void _verify(){
    if(c>=0 && nameController.text==l[n]){
      showDialog(context: context,
       builder: (context)=>AlertDialog(
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: const Text('close',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),)
        ],
        title:const Text('Result!',style: TextStyle(fontSize: 15)),
        content: const Text('Congratulations! You have done in 60 Seconds',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
       ));
    }
    else{
      showDialog(context: context,
       builder: (context)=>AlertDialog(
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: const Text('close',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),)
        ],
        title:const Text('Result!',style: TextStyle(fontSize: 15)),
        content: const Text('Better luck next Time!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
       ));
    }
    }
  Widget build(BuildContext context) {
     var children = <Widget>[
                 Image.asset("assets/clock.png"),
                 Padding(padding: EdgeInsets.all(16.0),
                 ),
                 Text(
                  '$c'+' Seconds',
                  style: TextStyle(fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.bold),
                 ),
              ];
    var container = Container(
                width:800,
                height:100,
                child: Text(
          
          l[n],
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                  );
    var scaffold = Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
       Center(
        child: Column(
          children: <Widget>[
            const Text(
              'Type As Fast As You Can!',
              style: TextStyle(fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.bold),
            ),
            Container(
              width: 400,
              height:200,
              child:Row(
              children:children
              )
            ),
            Container(
              width:800,
              height:400,
              child:Column(
              children: [
              container,
                  TextField(
                    minLines:4,
                    maxLines:6,
                    style: TextStyle(fontSize: 30),
                    decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Press Start Button Before Typing'),
                    controller: nameController,
                  )
                ],
              ),
            ),
            Container(
              height: 25,
              width: 200,
               child: Row(
                children:[
            Container(
              child:TextButton(
  style: ButtonStyle(
    foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    backgroundColor: WidgetStatePropertyAll(Colors.blue),
  ),
  onPressed: _startCountDown,
  child: Text('Start'),
)
                //children: [
            /*MaterialButton(onPressed: _startCountDown,
            child: Text(
              'Start',
              //style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),color:Colors.deepPurple[600])*/
          ),
          Padding(padding: EdgeInsets.all(16.0),
                 ),
          Container(child:TextButton(
  style: ButtonStyle(
    foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    backgroundColor: WidgetStatePropertyAll(Colors.blue),
  ),
  onPressed: _verify,
  child: Text('Submit'),
),)
                ],
              ),),
          ],
        ),
      ),
    );
    return scaffold;
  }
}
