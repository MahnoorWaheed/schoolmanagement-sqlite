import 'package:flutter/material.dart';
import 'package:sqliteschool/branches.dart';
import 'package:sqliteschool/database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
   TextEditingController cityController=TextEditingController();
  List<String> cities=['Karachi Branch', 'Lahore Branch', 'Islamabad Branch'];
  List<Widget> routes=[const KarachiBranch(),const LahoreBranch(),const IslamabadBranch()];
  List allcitiesList=[];
  void getAllCities() async{
   var list= await Data().readTableName();
   setState(() {
     allcitiesList=list;
   });
   print(list);
  }

  @override
  void initState() {
    // TODO: implement initState
   
   setState(() {
     getAllCities();
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              child: ListView.builder(
                itemCount: allcitiesList.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index){
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
               child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween ,
               children: [
               const Icon(Icons.more_vert),
               Text(allcitiesList[index]['BranchName'], 
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
                                    controller: cityController,
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
                                        setState((){
                                          Data().insertAccount2Group(cityController.text);
                                        });
                                        Navigator.of(context).pop();
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
      ),
    );
  }
}