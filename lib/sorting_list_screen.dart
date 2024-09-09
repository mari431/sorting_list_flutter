import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sorting_list_flutter/controller/sorting_controller.dart';

class SortingListScreen extends StatefulWidget {
  const SortingListScreen({super.key});

  @override
  State<SortingListScreen> createState() => _SortingListScreenState();
}

class _SortingListScreenState extends State<SortingListScreen> {
  final SortingController _sortingController = Get.put(SortingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Sorting List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (_sortingController.sModelList.isEmpty) {
            return Text('No Data');
          } else {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHeader('Sr.No',60,30),
                    _buildHeader('Name',60,30),
                    _buildHeader('Amount',60,30),
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  color: Colors.grey.shade50,
                  // decoration: BoxDecoration( color: Colors.grey.shade50,
                  // border: Border.all(color: Colors.black)
                  // ),

                  child: Column(
                      children: _sortingController.sModelList.map((rowData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 60,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                              color:  _sortingController.selectedColumn.value == 'Sr.No' ? Colors.indigoAccent : Colors.black,
                            ),
                            child: Center(child: Text('${rowData.srno}',style: TextStyle(color: Colors.white),))),
                        Container(
                            width: 60,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                              color:  _sortingController.selectedColumn.value == 'Name' ? Colors.indigoAccent : Colors.black,
                            ),
                            child: Center(child: Text('${rowData.name}',style: TextStyle(color: Colors.white),))),
                        Container(
                            width: 60,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                              color:  _sortingController.selectedColumn.value == 'Amount' ? Colors.indigoAccent : Colors.black,
                            ),
                            child: Center(child: Text('${rowData.amount}',style: TextStyle(color: Colors.white),))),
                      ],
                    );
                  }).toList()),
                ),
              ],
            );
          }
        }),
      ),
    ));
  }



  Widget _buildHeader(String column,double wid, double hei) {
    return SizedBox(
      width: wid,
      height: hei,
      child: GestureDetector(
        onTap: () => _sortingController.sortByColumn(column),
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
            color:  _sortingController.selectedColumn.value == column ? Colors.indigoAccent : Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    column,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.white),
                  ),
                ),
              ),
              Obx(() => _sortingController.selectedColumn.value == column
                  ? (_sortingController.isAscending.value
                  ? Icon(Icons.arrow_upward, size: 16,color: Colors.white,)
                  : Icon(Icons.arrow_downward, size: 16,color: Colors.white,))
                  : SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
