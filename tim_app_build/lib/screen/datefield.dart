import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

// // class Datefield extends StatelessWidget {
// //   const Datefield({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     DateTime selectedData;
// //     return Scaffold(
// //         appBar: AppBar(),
// //         body: Column(
// //           children: [
// //             Container(
// //               child: Datefields(),
// //             )
// //           ],
// //         ));
// //   }
// // }

// class Datefields extends StatefulWidget {
//   @override
//   State<Datefields> createState() => _DatefieldsState();
// }

// class _DatefieldsState extends State<Datefields> {
//   late DateTime selectedData;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(children: [
//         Container(
//           height: 200,
//           width: 300,
//           child: DateTimeField(
//             onDateSelected: (DateTime value) {
//               setState(() {
//                 selectedData = value;
//               });
//             },
//             firstDate: DateTime(2020, 3, 8),
//             lastDate: DateTime(2020, 3, 20),
//             selectedDate: selectedData,
//           ),
//         ),
//       ]),
//     );
//   }
// }

class MyHomePageDate extends StatefulWidget {
  const MyHomePageDate({Key? key}) : super(key: key);

  @override
  _MyHomePageDateState createState() => _MyHomePageDateState();
}

class _MyHomePageDateState extends State<MyHomePageDate> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const FlutterLogo(size: 100),
          const SizedBox(height: 20),
          const Text('DateField package showcase'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text('DateTimeField'),
          ),
          DateTimeField(
              decoration: const InputDecoration(
                  hintText: 'Please select your birthday date and time'),
              selectedDate: selectedDate,
              onDateSelected: (DateTime value) {
                setState(() {
                  selectedDate = value;
                });
              }),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text('DateTimeFormField'),
          ),
          Form(
            child: Column(
              children: <Widget>[
                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'My Super Date Time Field',
                  ),
                  firstDate: DateTime.now().add(const Duration(days: 10)),
                  initialDate: DateTime.now().add(const Duration(days: 10)),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (DateTime? e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 50),
                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Only time',
                  ),
                  mode: DateTimeFieldPickerMode.time,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (DateTime? e) {
                    return (e?.day ?? 0) == 1
                        ? 'Please not the first day'
                        : null;
                  },
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}