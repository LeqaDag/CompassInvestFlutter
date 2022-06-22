// ignore_for_file: must_be_immutable, import_of_legacy_library_into_null_safe, non_constant_identifier_names, unused_local_variable

import 'dart:io';

import 'package:compassinvest/views/responsive/guest/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:path/path.dart';

class FreeEbookDetailsPage extends StatefulWidget {
  final File file;
  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;
  const FreeEbookDetailsPage(
      {Key? key,
      required this.about_us,
      required this.soon,
      required this.instgram_link,
      required this.facebook_link,
      required this.website_link,
      required this.privacy,
      required this.file})
      : super(key: key);

  @override
  State<FreeEbookDetailsPage> createState() => _FreeEbookDetailsPageState();
}


class _FreeEbookDetailsPageState extends State<FreeEbookDetailsPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black45,
        automaticallyImplyLeading: true,
        centerTitle: true,
        actions: pages >= 2
            ? [
                Center(child: Text(text)),
                IconButton(
                  icon: const Icon(Icons.chevron_left, size: 32),
                  onPressed: () {
                    final page = indexPage == 0 ? pages : indexPage - 1;
                    controller.setPage(page);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, size: 32),
                  onPressed: () {
                    final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                    controller.setPage(page);
                  },
                ),
              ]
            : null,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => GuestDashBoard(
                          about_us: widget.about_us,
                          soon: widget.soon,
                          privacy: widget.privacy,
                          instgram_link: widget.instgram_link,
                          facebook_link: widget.facebook_link,
                          website_link: widget.website_link,
                        )));
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: PDFView(
        filePath: widget.file.path,
        // autoSpacing: false,
        // swipeHorizontal: true,
        // pageSnap: false,
        // pageFling: false,
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      ),
    );
  }
}
