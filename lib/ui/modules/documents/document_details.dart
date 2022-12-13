import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import '../../utils/colors.dart';

class DocumentDetails extends ConsumerStatefulWidget {
  const DocumentDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DocumentDetailsState();
}

class _DocumentDetailsState extends ConsumerState<DocumentDetails> {
  final pdfController = PdfController(
      document: PdfDocument.openAsset('assets/reglamento.pdf'),
      initialPage: 0,
      viewportFraction: 1.0);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: c.disabled,
        child: SafeArea(
          child: Stack(
            children: [
              PdfView(
                controller: pdfController,
                scrollDirection: Axis.vertical,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios))
            ],
          ),
        ),
      ),
    );
  }
}
