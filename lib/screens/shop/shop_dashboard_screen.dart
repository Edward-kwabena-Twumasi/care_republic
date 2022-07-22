import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecut/screens/shop/revenue_chart.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late ScrollController scrollController;

  int switchId=0;

  void initState(){
    super.initState();
    scrollController=ScrollController();
    scrollController.addListener(() {

      print(scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text("My shop"),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text("Overview",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              // ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    height: 39,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color:Colors.blue,
                          width: 1.5
                        )
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                elevation: 0,
                                shape: StadiumBorder(),
                                primary: switchId==0?Colors.blue:Colors.white,
                                  textStyle: TextStyle(
                                    color: switchId==1?Colors.blue:Colors.white,
                                  )
                              ),
                              onPressed: (){
                                setState((){
                                  switchId=0;
                            scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve:Curves.bounceIn );
                                });

                          }, child: Text("New",style:TextStyle(
                            color: switchId==1?Colors.blue:Colors.white,
                          ) ,)),
                          ElevatedButton(

                              style:ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: StadiumBorder(),
                                  primary: switchId==1?Colors.blue:Colors.white,
                                textStyle: TextStyle(
                                  color: switchId==0?Colors.blue:Colors.white,
                                )
                              ),
                              onPressed: (){
                            setState(() {
                              switchId=1;
                              scrollController.animateTo(scrollController.offset+MediaQuery.of(context).size.width*0.9
                                  , duration: Duration(milliseconds: 500), curve:Curves.bounceIn );
                            });
                          }, child: Text("Financial",style:TextStyle(
                            color: switchId==0?Colors.blue:Colors.white,
                          ) ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    AnalyticsSummary(name: "New Customers",number: 50,percentage: 2,),
                    AnalyticsSummary(name: "New Appointments",number: 50,percentage: 5,),
                    AnalyticsSummary(name: "Average Income",number: 399,percentage: 19,),
                    AnalyticsSummary(name: "Gross profit",number: 2050,percentage: 20,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Revenue",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LineChartSample1(),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Current",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Name',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Age',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Role',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Sarah')),
                        DataCell(Text('19')),
                        DataCell(Text('Student')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Janine')),
                        DataCell(Text('43')),
                        DataCell(Text('Professor')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('William')),
                        DataCell(Text('27')),
                        DataCell(Text('Associate Professor')),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class AnalyticsSummary extends StatelessWidget {
  const AnalyticsSummary({
    Key? key, required this.name, required this.number, required this.percentage,
  }) : super(key: key);

  final String name;
  final int number;
  final int percentage;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          width: MediaQuery.of(context).size.width*0.4,
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [
              //     Color(0xff2c274c),
              //     Color(0xff46426c),
              //   ],
              //   begin: Alignment.bottomCenter,
              //   end: Alignment.topCenter,
              // ),
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.all(4),
          child: Column(
mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(child: Text("${number} ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),)),
                    Text("+ ${percentage}%")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



