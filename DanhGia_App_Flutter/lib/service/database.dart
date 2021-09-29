
import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService {
  //DatabaseService({required this.uid});
  //final String uid;
  final CollectionReference OptionCollection = FirebaseFirestore.instance.collection('Rate');
  Future updatedDataGood(String rate,String name,String feedback,int numberP) async {
    return await OptionCollection.doc().set({
      'rate': rate,
      'name': name,
      'feedback': feedback,
      'numberPhone': numberP,
      'time':Timestamp.now(),
      'chatluong': null,
    });
  }

  Future updatedDataBad(String rate,String name,String feedback,int numberP,double clNhanVien,clSanPham,kgCuaHang,giaTien,tdPhucVu) async {
    return await OptionCollection.doc().set({
      'rate': rate,
      'name': name,
      'feedback': feedback,
      'numberPhone': numberP,
      'time':DateTime.now(),
      'chatluong':{
        'clNhanVien':clNhanVien,
        'clSanPham': clNhanVien,
        "kgCuaHang" : kgCuaHang,
        "giaTien": giaTien,
        "tdPhucVu": tdPhucVu
      }
    });
  }
}







































// //@dart=2.9
//
// import 'dart:core';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cuoi_ki_moblie/home/models/Job.dart';
// import 'package:flutter/cupertino.dart';
//
//
// import 'api_path.dart';
// import 'firestore_services.dart';
//
// abstract class Database{
//   Future<void> setJob(Job job);
//   Future<void> deleteJob(Job job);
//   void readJobs();
//   Stream<List<Job>> jobsStream();
// }
//
// String documentIdFromCurrentDate()=> DateTime.now().toIso8601String();
//
// class FirestoreDatabase implements Database{
//   FirestoreDatabase({@required this.uid}): assert(uid != null);
//   final String uid;
//   final _service = FirestoreService.instance;
//
//   @override
//   Future<void>setJob(Job job)=>
//       _service.setData(
//         path: APIPath.job(uid, job.id),
//         data: job.toMapp(),
//       );
//   @override
//   Future<void> deleteJob(Job job) => _service.deleteData(
//     path: APIPath.job(uid, job.id),
//   );
//   @override
//   void readJobs(){
//     final path = APIPath.jobs(uid);
//     final reference = FirebaseFirestore.instance.collection(path);
//     final snapshots = reference.snapshots();
//     snapshots.listen((snapshots){
//       snapshots.docs.forEach((snapshot) {
//         print(snapshot.data());
//       });
//     });
//   }
//   @override
//   Stream<List<Job>> jobsStream()=>
//       _service.collectionSteam(
//           path: APIPath.jobs(uid),
//           builder: (data, documentId) =>Job.formMap(data, documentId)
//       );
//
//
// }