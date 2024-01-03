import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtc = TextEditingController();
  var ftc = TextEditingController();
  var inc = TextEditingController();
  var result = "";
  var bgColor = Colors.lightBlueAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 330,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text("YOUR BMI", style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.w600),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: wtc,
                    decoration: InputDecoration(
                      hintText: 'Enter your weight(in Kgs)',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(Icons.line_weight_rounded, color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: ftc,
                    decoration: InputDecoration(
                      hintText: 'Enter your height(in feet)',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(Icons.height_rounded,color: Colors.black,),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: inc,
                    decoration: InputDecoration(
                      hintText: 'Enter your Height(in Inch)',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(Icons.height_rounded, color: Colors.black,),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      var wt = wtc.text.toString();
                      var ft = ftc.text.toString();
                      var inh = inc.text.toString();

                      if(wt!="" && ft!="" && inh!="")
                        {
                          var uwt = int.parse(wt);
                          var uft = int.parse(ft);
                          var uin = int.parse(inh);

                          var tInch = (uft*12) + uin;

                          var tCm = tInch*2.54;

                          var tM = tCm/100;

                          var bmi = uwt/(tM*tM);
                          var msg = "";
                          if(bmi>25)
                            {
                              msg = "You're OverWeight!!";
                              bgColor = Colors.orangeAccent;
                            }else if(bmi<18)
                              {
                                msg = "You're UnderWeight!!";
                                bgColor = Colors.redAccent;
                              }
                          else{
                            msg = "You're Healthy!!";
                            bgColor = Colors.greenAccent;
                          }
                          setState(() {
                            result = '$msg \n Your BMI is ${bmi.toStringAsFixed(2)}';
                          });
                        } else{
                        setState(() {
                          result = 'Please fill all the requried blanks!!';
                        });
                      }
                }, child: Text("Calculate", style: TextStyle(color: Colors.black),)),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(result, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
