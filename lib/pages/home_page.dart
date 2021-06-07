import 'package:flutter/material.dart';
import 'package:task_pardemo/model/emp_model.dart';
import 'package:task_pardemo/pages/detail_page.dart';
import 'package:task_pardemo/services/http_service.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> items = [];

  void _apiEmpList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      _showResponse(response),
    });
  }

  void _showResponse(String response) {
    var empList = Network.parseEmpList(response);
    setState(() {
      items = empList.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 100));
    _apiEmpList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return itemOfList(items[i]);
        },

      ),
    );
  }

  Widget itemOfList(Employee emp) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(height: 5, color: Colors.black,),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              _openDetails(emp);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(emp.employee_name + ' (' + emp.employee_age.toString() + ')'),

                SizedBox(height: 5,),

                Text(emp.employee_salary.toString() + '\$'),
              ],
            ),
          ),

          SizedBox(height: 10,),

          Divider(height: 5, color: Colors.black,),
        ],
      ),
    );
  }

  Future _openDetails(Employee emp) async {
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
      return new DetailPage(input: emp,);
    }));
  }
}
