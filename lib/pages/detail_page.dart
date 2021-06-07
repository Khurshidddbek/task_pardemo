import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_pardemo/model/emp_model.dart';

class DetailPage extends StatefulWidget {
  static final String id = 'detail_page';

  final Employee input;
  DetailPage({this.input});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          height: 70,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.input.employee_name + ' (' + widget.input.employee_age.toString() + ')'),

              SizedBox(height: 5,),

              Text(widget.input.employee_salary.toString() + '\$'),
            ],
          ),
        ),
        ),
    );
  }
}
