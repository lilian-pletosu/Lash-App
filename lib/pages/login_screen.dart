// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/login_bloc.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Login")),
//       body: _buildScaffoldBody(),
//     );
//   }

//   Widget _buildScaffoldBody() {
//     return BlocBuilder<LoginBloc, LoginState>(
//       builder: (context, state) {
//         return _buildParentWidget(context, state);
//       },
//     );
//   }

//   Widget _buildParentWidget(BuildContext context, LoginState state) {
//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           BlocBuilder<LoginBloc, LoginState>(
//             builder: (context, state) {
//               return Text(
//                   '${BlocProvider.of<LoginBloc>(context).state.button}');
//             },
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           TextButton(
//             onPressed: () {
//               context.read<LoginBloc>().add(LoginButtonTappedEvent());
//             },
//             child: const Text("Tap me!!!"),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           TextButton(
//               onPressed: () {
//                 context.read<LoginBloc>().add(ShowSnackBarButtonTappedEvent());
//               },
//               child: const Text("Show Snackbar"))
//         ],
//       ),
//     );
//   }
// }
