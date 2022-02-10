import 'package:flutter/material.dart';
import 'package:sqliteschool/classes_batch.dart';

class KarachiBranch extends StatefulWidget {
  const KarachiBranch({ Key? key }) : super(key: key);

  @override
  _KarachiBranchState createState() => _KarachiBranchState();
}

class _KarachiBranchState extends State<KarachiBranch> {
   List<String> year=['2019 - 2020', '2020 - 2021', '2021 - 2022'];
   List<Widget> routes=[const TwentyNineteen()];
  //  List<String> num=['55200   3500', '55200   3500', '55200   58420'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text("Karachi Branch"),
        centerTitle: true,
      ),
      body: Column(
        
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.30,
            child: ListView.builder(
              itemCount: year.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index){
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
             child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween ,
             children: [
             const Icon(Icons.more_vert),
             Column(
               children: [
                 Text(year[index], 
                 style: const TextStyle(fontSize: 25),
                 ),

                 Container(
                   width: 150,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Text("55200", style: 
                       TextStyle(fontSize: 18),),
                       Text("3500",
                       style: 
                       TextStyle(fontSize: 18),
                       )
                     ],
                   ),
                 )

               ],
             ),
             GestureDetector(
               onTap: (){
                 Navigator.of(context).push(
                   MaterialPageRoute(builder: (ctx)=>routes[index]),
                 );
               },
               child: const Icon(Icons.arrow_forward_ios, size: 10,))
             ]),
                     ),
                );
            }),
          ),
          ElevatedButton(onPressed: (){}, child: Text("Add/Edit"))
        ]
      )
    );
  }
}

class LahoreBranch extends StatefulWidget {
  const LahoreBranch({ Key? key }) : super(key: key);

  @override
  _LahoreBranchState createState() => _LahoreBranchState();
}

class _LahoreBranchState extends State<LahoreBranch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}

class IslamabadBranch extends StatefulWidget {
  const IslamabadBranch({ Key? key }) : super(key: key);

  @override
  _IslamabadBranchState createState() => _IslamabadBranchState();
}

class _IslamabadBranchState extends State<IslamabadBranch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}