import 'package:bmi_calculator_flutter/constants/app_constants.dart';
import 'package:bmi_calculator_flutter/widgets/left_bar.dart';
import 'package:bmi_calculator_flutter/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  double bmi  = 0;
  String category = 'Normal';
  String _unitHeight = 'cm';
  String _unitWeight = 'kg';


  void calculateBmi(double height, double weight){
    if(_unitHeight =='cm'){
      height = height/100;
    }
    else if(_unitHeight == 'inches'){
      height = height*2.54;
    }
    else if(_unitHeight == 'ft'){
      height = height*30.48;
    }

    if(_unitWeight == "lbs"){
      weight = weight*0.453592;
    }
    else if(_unitWeight == 'ounce'){
      weight = weight* 0.0283495;
    }

    bmi = weight/(height*height);
    if(bmi < 18.5){
      category = "Underweight";
    }
    else if(bmi < 25){
      category = "Normal";
    }
    else if(bmi < 30){
      category = "Overweight";
    }
    else{
      category = "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TweenAnimationBuilder(
          duration:const Duration(milliseconds: 2000),
          builder: (BuildContext context,double value, Widget? child){
            return Opacity(opacity: value, child: child!);
          },
          tween: Tween<double>(begin: 0,end: 1),
          child: const Text('BMI Calculator',
          style: TextStyle(
            color: accentColor,
            fontWeight: FontWeight.bold
          ),),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _height,
                    style:const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8)
                      )
                    ) ,
                  ),
                ),
                DropdownButton(
                    value: _unitHeight,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 15,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      color: Colors.grey[700]
                    ),
                    items: ['cm','m','inches','ft'].map((e) => DropdownMenuItem(child: Text(e), value: e,)).toList(),
                    onChanged: (String? newValue){
                        setState(() {
                          _unitHeight = newValue!;
                        });
                    },
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _weight,
                    style:const  TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8)
                        )
                    ) ,
                  ),
                ),
                DropdownButton(
                  value: _unitWeight,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 15,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      color: Colors.grey[700]
                  ),
                  items: ['kg','lbs','ounce'].map((e) => DropdownMenuItem(child: Text(e), value: e,)).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      _unitWeight = newValue!;
                    });
                  },
                ),

              ],
            ),
            const SizedBox(height: 60,),
             Container(
               color: Colors.grey[900],
               child: Padding(
                 padding: const EdgeInsets.all(20),
                 child: GestureDetector(
                   onTap: (){
                     try{
                       double height = double.parse(_height.text);
                       double weight = double.parse(_weight.text);
                       setState(() {
                         calculateBmi(height, weight);
                       });
                     }
                     catch(e){
                       const snackBar = SnackBar(content: Text('Empty Fields!'));
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                     }
                   },
                  child: const Text('Calculate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: accentColor
                  ),),
            ),
               ),
             ),
            const SizedBox(height: 50,),
            Text(bmi.toStringAsFixed(2),
            style: const TextStyle(fontSize: 90, color: accentColor),),
            const SizedBox(height: 30,),
            Text(category,
              style: const TextStyle(fontSize: 32, color: accentColor, fontWeight: FontWeight.w400),),
            const SizedBox(height: 10,),
            const LeftBar(barWidth: 30),
            const SizedBox(height: 20,),
            const LeftBar(barWidth: 70),
            const SizedBox(height: 20,),
            const LeftBar(barWidth: 50),
            const RightBar(barWidth: 20),
            const SizedBox(height: 20,),
            const RightBar(barWidth: 50),
            const SizedBox(height: 20,),
            const RightBar(barWidth: 30),
          ],
        ),
      ),
    );
  }
}
