// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   String pathPDF =
//       "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf";

//   @override
//   void initState() {
//     super.initState();
//     fromUri(
//         "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf");
//     // fromAsset('documents/sample.pdf', 'sample.pdf').then((f) {
//     //   setState(() {
//     //     pathPDF = f.path;
//     //   });
//     // });
//   }

//   Future<File> createFileOfPdfUrl() async {
//     Completer<File> completer = Completer();
//     try {
//       final url =
//           "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf";
//       final fileName = url.substring(url.lastIndexOf("/") + 1);
//       var request = await HttpClient().getUrl(Uri.parse(url));
//       var response = await request.close();
//       var bytes = await consolidateHttpClientResponseBytes(response);
//       var dir = await getApplicationDocumentsDirectory();
//       File file = File("${dir.path}/$fileName");
//       await file.writeAsBytes(bytes, flush: true);
//       completer.complete(file);
//     } catch (e) {
//       throw Exception("Error downloading pdf file!");
//     }

//     return completer.future;
//   }

//   Future<File> fromAsset(String asset, String filename) async {
//     Completer<File> completer = Completer();
//     try {
//       var dir = await getApplicationDocumentsDirectory();
//       File file = File("${dir.path}/$filename");
//       var data = await rootBundle.load(asset);
//       var bytes = data.buffer.asUint8List();
//       await file.writeAsBytes(bytes, flush: true);
//       completer.complete(file);
//     } catch (e) {
//       throw Exception('Error parsing asset file!');
//     }

//     return completer.future;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeData = Theme.of(context);
//     int pages = 0;
//   int indexPage = 0;

//     return MaterialApp(
//       home: Scaffold(body: Builder(
//         builder: (BuildContext context) {
//           return Stack(
// children: [
// PDFView(
//     filePath: widget.path,
//     enableSwipe: true,
//     swipeHorizontal: true,
//     autoSpacing: false,
//     pageFling: false,
//     onRender: (_pages) {
//         setState(() {
//             pages = _pages!;
//         });
//     },
//     onError: (error) {
//         print(error.toString());
//     },
//     onPageError: (page, error) {
//         print("$page: ${error.toString()}");
//     },
//     onViewCreated: (PDFViewController pdfViewController) {
//         _controller.complete(pdfViewController);
//     },
//     onPageChanged: (int page, int total) {
//         print("page change: $page/$total");
//     },
// ),
// errorMessage.isEmpty
// ? !isReady
// ? Center(
//     child: CircularProgressIndicator(),
// )
// : Container()
// : Center(
//     child: Text(errorMessage),
// )
// ],
// );
//         },
//       )),
//     );
//   }
// }

// class PDFScreen extends StatefulWidget {
//   final String? path;

//   const PDFScreen({Key? key, this.path}) : super(key: key);

//   @override
//   _PDFScreenState createState() => _PDFScreenState();
// }

// class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
//   final Completer<PDFViewController> _controller =
//       Completer<PDFViewController>();
//   int? pages = 0;
//   int? currentPage = 0;
//   bool isReady = false;
//   String errorMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Document"),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.share),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
//           PDFView(
//             filePath: widget.path,
//             onRender: (_pages) {
//               setState(() {
//                 pages = _pages;
//                 isReady = true;
//               });
//             },
//             onError: (error) {
//               setState(() {
//                 errorMessage = error.toString();
//               });
//               print(error.toString());
//             },
//             onPageError: (page, error) {
//               setState(() {
//                 errorMessage = '$page: ${error.toString()}';
//               });
//               print('$page: ${error.toString()}');
//             },
//             onViewCreated: (PDFViewController pdfViewController) {
//               _controller.complete(pdfViewController);
//             },
//           ),
//           errorMessage.isEmpty
//               ? !isReady
//                   ? const Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Container()
//               : Center(
//                   child: Text(errorMessage),
//                 )
//         ],
//       ),
//     );
//   }
// }
