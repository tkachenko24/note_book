// import 'package:flutter/material.dart';
// import 'package:note_book/common/export.dart';
// import 'package:note_book/dashboard/presentation/states/export.dart';

// class AvailabilitySwitch extends StatelessWidget {
//   const AvailabilitySwitch({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CarsBloc, CarsState>(
//       builder: (context, state) {
//         return Switch(
//           value: state.newCar.available,
//           onChanged: (value) =>
//               context.read<CarsBloc>().add(NewCarAvailabilityChanged(value)),
//         );
//       },
//     );
//   }
// }
