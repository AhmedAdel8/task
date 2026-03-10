

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:share/share.dart';

// Future<void> createLink({required int id, required String type}) async {
//   Uri deepLinkUri = Uri.parse('http://canny.page.link/$type/$id');
//   Share.share(deepLinkUri.toString());
// }

// class ShareButton extends StatelessWidget {
//   const ShareButton({
//     super.key,
//     required this.onTap,
//   });
//   final VoidCallback onTap;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(color: Colors.grey, spreadRadius: 0.2, blurRadius: 1.0)
//           ],
//           shape: BoxShape.circle,
//         ),
//         padding: const EdgeInsets.all(15.0),
//         child: const Icon(
//           Icons.share,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
