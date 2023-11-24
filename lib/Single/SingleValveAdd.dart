// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
//
// class SingleValveAdd extends StatefulWidget {
//   const SingleValveAdd({super.key});
//
//   @override
//   State<SingleValveAdd> createState() => _SingleValveAddState();
// }
//
// class _SingleValveAddState extends State<SingleValveAdd> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hive"),
//       ),
//       body: Column(
//         children: [
//           FutureBuilder(
//               future: Hive.openBox('1'),
//               builder: (context, snapshot) {
//                 return Column(
//                   children: [
//                     Text(snapshot.data!.get('key').toString()),
//                     Text(snapshot.data!.get('adreess')['p/o'].toString()),
//                   ],
//                 );
//               }),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () async {
//         var box = await Hive.openBox('1');
//         box.put('key', 'hhhhhhhhhhhhh');
//         box.put('adreess', {
//           'vill': 'Shalfalam',
//           'p/o' : 'Khall'
//         });
//       }),
//     );
//   }
// }
