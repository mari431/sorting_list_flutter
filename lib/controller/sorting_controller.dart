import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sorting_list_flutter/controller/sorting_controller.dart';

class SortingController extends GetxController{
 RxList <SModel> sModelList = RxList<SModel>();

 RxString selectedColumn = 'Sr.No'.obs; // Track selected column
 RxBool isAscending = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    startFunction();
    super.onInit();
  }


  Future<void> startFunction()async{
    sModelList.add(SModel(srno: '1', name: 'A', amount: 10.00));
    sModelList.add(SModel(srno: '8', name: 'H', amount: 17.00));
    sModelList.add(SModel(srno: '2', name: 'B', amount: 11.00));
    sModelList.add(SModel(srno: '6', name: 'F', amount: 15.00));
    sModelList.add(SModel(srno: '3', name: 'C', amount: 12.00));
    sModelList.add(SModel(srno: '9', name: 'I', amount: 18.00));
    sModelList.add(SModel(srno: '4', name: 'D', amount: 13.00));
    sModelList.add(SModel(srno: '10', name: 'J', amount: 19.00));
    sModelList.add(SModel(srno: '5', name: 'E', amount: 14.00));
    sModelList.add(SModel(srno: '7', name: 'G', amount: 16.00));




  }


 Future<void> sortByColumn(String column)async {
   if (isAscending.value) {
     sModelList.sort((a, b) {
       switch (column) {
         case 'Sr.No':
           return double.parse(a.srno.toString().isEmpty ? '0' : a.srno.toString())
               .compareTo(double.parse(b.srno.toString().isEmpty ? '0' : b.srno.toString()));
         case 'Name':
           return a.name.compareTo(b.name);
         case 'Amount':
           return double.parse(a.amount.toString().isEmpty ? '0' : a.amount.toString())
               .compareTo(double.parse(b.amount.toString().isEmpty ? '0' : b.amount.toString()));
       default:
           return 0;
       }
     });
   } else {
     sModelList.sort((a, b) {
       switch (column) {
         case 'Sr.No':
           return double.parse(b.srno.toString().isEmpty ? '0' : b.srno.toString())
               .compareTo(double.parse(a.srno.toString().isEmpty ? '0' : a.srno.toString()));
         case 'Name':
           return b.name.compareTo(a.name);
         case 'Amount':
           return double.parse(b.amount.toString().isEmpty ? '0' : b.amount.toString())
               .compareTo(double.parse(a.amount.toString().isEmpty ? '0' : a.amount.toString()));
       default:
           return 0;
       }
     });
   }
   isAscending.value = !isAscending.value;
   selectedColumn.value = column;
   sModelList.refresh(); // Refresh the list to trigger UI update
 }




}


class SModel{
  String srno='';
  String name='';
  double amount=0.0;
  SModel({required this.srno,required this.name,required this.amount});
}