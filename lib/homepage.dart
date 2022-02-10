import 'package:flutter/material.dart';
import 'package:sqliteschool/branches.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  List<String> cities=['Karachi Branch', 'Lahore Branch', 'Islamabad Branch'];
  List<Widget> routes=[const KarachiBranch(),const LahoreBranch(),const IslamabadBranch()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            child: ListView.builder(
              itemCount: cities.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index){
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
             child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween ,
             children: [
             const Icon(Icons.more_vert),
             Text(cities[index], 
             style: const TextStyle(fontSize: 25),
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
                              Text("Add\nEducational Year"),
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
           child: const Text("Add/edit"))
        
        ],
      ),
    );
  }
}