import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore,this.resetHandler);

  String  get resultPhrase{
    String resultText;
    if (resultScore> 50){
      resultText="You are Awesome";
    }
    else if (resultScore>30){
      resultText="You are Okay";
    }
    else{
      resultText="You are Bad";
    }  
    return "Your Score is $resultScore and $resultText";
    }
      

  @override
  Widget build(BuildContext context) {
    return  
       Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
           ElevatedButton(onPressed: resetHandler, child: const Text("Reset Quiz"))
        ],
      );
    
  }
}
