import 'package:flutter/material.dart';

class TwentyNineteen extends StatefulWidget {
  const TwentyNineteen({ Key? key }) : super(key: key);

  @override
  _TwentyNineteenState createState() => _TwentyNineteenState();
}

class _TwentyNineteenState extends State<TwentyNineteen> {
  final _formKey = GlobalKey<FormState>();

  List<String> cities=['Class 1', 'Class 2'];
  //List<Widget> routes=[const KarachiBranch(),const LahoreBranch(),const IslamabadBranch()];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("2019 - 2020 "),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            
            height: MediaQuery.of(context).size.height*0.20,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cities.length,
              itemBuilder: (ctx, index){
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
             child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween ,
             children: [
             const Icon(Icons.more_vert),
             Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(cities[index], 
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
                //  Navigator.of(context).push(
                //    MaterialPageRoute(builder: (ctx)=>routes[index]),
                //  );
               },
               child: const Icon(Icons.arrow_forward_ios, size: 10,))
             ]),
                     ),
                );
            }),
          ),
          ElevatedButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    content: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("Class\n2019 - 2020"),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:  BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.green
                    ),
                                    )
                                  ),
                                ),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  child: Text("Add/Edit\nBranch Name"),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              );
          },
           child: const Text("Add new class")),
           ElevatedButton(onPressed: (){}, child: Text("Import"))
        
        ],
      ),
    );
  }
}