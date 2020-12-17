import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Simple Calculator',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
 _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  double result =0.0;
  String strResult ='';
  String islem ='';
  String op ='';
  double firstnumber;
  bool afteroperation = true;
  void onDigitPress(String text) {
    print('digit pressed $text');
    setState(() {
      if (text!= "D" && text != "=")
      islem = islem + '$text';
    });
    if(text=='+')
    {
      op=text;
      firstnumber = result;
      afteroperation = true;
      strResult='';
      setState(() {
      });
    }
    else if (text=='=')
    {
      switch (op) {
        case '+':
          setState(() {
            result = result + firstnumber;
          });
          strResult = '$result';
          break;
        case '-':
          setState(() {
            result = firstnumber - result;
          });
          strResult = '$result';
          break;
        case 'x':
          setState(() {
            result *= firstnumber;
          });
          strResult = '$result';
          break;
        case '/':
          setState(() {
            result = firstnumber / result;
          });
          strResult = '$result';
          break;

      }
    }
    else if (text=='-')
      {
        op=text;
        firstnumber = result;
        strResult='';
        setState(() {
          result=0;
        });
      }
    else if (text=='x')
    {
      op=text;
      firstnumber = result;
      strResult='';
      setState(() {
        result=0;
      });
    }
    else if (text=='/')
    {
      op=text;
      firstnumber = result;
      strResult='';
      setState(() {
        result=0;
      });
    }
    else if (text=='C')
    {
      result=0.0;
      strResult ='';
      setState(() {
        islem='';
      });
    }
    else if (text=='D')
    {
      if(strResult==null)
        {
          strResult ='';
        }
      else
        {
          setState(() {
            strResult=strResult.substring(0, strResult.length-1);
          });
        }

    }
    else
    {
      if(afteroperation) {
        var tempResult = strResult + text;
        var temp = double.tryParse(tempResult);
        if (temp != null) {
          strResult = tempResult;
          setState(() {
            result = temp ?? result;
          });
        }
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Simple Calculator"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  margin: new EdgeInsets.only(top: 30.0),
                  padding: new EdgeInsets.only(bottom: 0.0),
                  alignment: Alignment.topRight,
                  child: Text(
                    '$islem',
                    style: TextStyle(fontSize: 30),
                  ),
                )
            ),
            Expanded(
              flex: 4,
                child: Container(
                  alignment: Alignment.topRight,
                  margin: new EdgeInsets.only(top: 40.0, bottom:0.0),
                  padding: new EdgeInsets.only(top: 0.0, bottom: 0.0),
                  child: Text(
                    '$result',
                    style: TextStyle(fontSize: 60),
                  ),
                )
              ),
            Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildCalcButton('C', Colors.red),
                    buildCalcButton('D', Colors.blue),
                    buildCalcButton('/', Colors.blue),
                  ],
                )),
            Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildCalcButton('7', Colors.black54),
                    buildCalcButton('8', Colors.black54),
                    buildCalcButton('9', Colors.black54),
                    buildCalcButton('x', Colors.blue),
                  ],
                )),
            Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildCalcButton('4', Colors.black54),
                    buildCalcButton('5', Colors.black54),
                    buildCalcButton('6', Colors.black54),
                    buildCalcButton('+', Colors.blue),
                  ],
                )),
            Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildCalcButton('1', Colors.black54),
                    buildCalcButton('2', Colors.black54),
                    buildCalcButton('3', Colors.black54),
                    buildCalcButton('-', Colors.blue),
                  ],
                )),
            Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildCalcButton('.', Colors.black54),
                    buildCalcButton('0', Colors.black54),
                    buildCalcButton('00', Colors.black54),
                    buildCalcButton('=', Colors.blue),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Expanded buildCalcButton(String text, Color color) {
    return Expanded(
      child: Container(
        padding: new EdgeInsets.all(0),
        color: color,
        child: FlatButton(
          onPressed: (){
            onDigitPress(text);
          },
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),

            side: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
            )
          ),
          padding: EdgeInsets.all(16.0),

          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }
  }
