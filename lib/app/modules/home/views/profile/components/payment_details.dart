import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:property_app/app/modules/home/controllers/home_controller.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:property_app/app/contants/app_colors.dart';

class PaymentDetails extends StatelessWidget {
  PaymentDetails({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: Text(
          'Payment Details',
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF434343),
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 0.5,
                    ), //BoxShadow
                    BoxShadow(
                      color: Color(0xFFFDFDFD),
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                height: 530,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hotel Name',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        color: Color(0xFF7D7F88),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'The Park Hotel',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2,
                        color: textColorDark,
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      'Hotel Address',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        color: Color(0xFF7D7F88),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Indore, MP',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2,
                        color: textColorDark,
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      'Payment Mode',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        color: Color(0xFF7D7F88),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Razorpay',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2,
                        color: textColorDark,
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      'Payment ID',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        color: Color(0xFF7D7F88),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'dfhd865dddgd55dgffh',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2,
                        color: textColorDark,
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      'Stay Duration',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        color: Color(0xFF7D7F88),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Nov 1 - Nov 5',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2,
                        color: textColorDark,
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      'Paid Amount:',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        color: Color(0xFF7D7F88),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '5000',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2,
                        color: textColorDark,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: IconButton(
                        onPressed: () async {
                          createPDF();
                        },
                        icon: Icon(
                          Icons.file_download_outlined,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawImage(PdfBitmap(await _readImageData('Image-4.png')),
        const Rect.fromLTWH(200, 0, 100, 100));

    page.graphics.drawString(
      'Payment Receipt',
      PdfStandardFont(
        PdfFontFamily.helvetica,
        30,
      ),
      bounds: const Rect.fromLTWH(120, 100, 0, 0),
    );

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 16),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 4);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];

    header.cells[0].value = 'Name';
    header.cells[1].value = 'John Doe';
    header.cells[2].value = 'Contact No';
    header.cells[3].value = '9856238521';

    PdfGridRow row = grid.rows.add();

    row.cells[0].value = 'Hotel Name';
    row.cells[1].value = 'The Park Hotel';
    row.cells[2].value = 'Hotel Address';
    row.cells[3].value = 'Indore, MP';

    row = grid.rows.add();
    row.cells[0].value = 'Payment ID';
    row.cells[1].value = 'dfhd865dddgd55dgffh';
    row.cells[2].value = 'Payment Mode';
    row.cells[3].value = 'Razorpay';

    row = grid.rows.add();
    row.cells[0].value = 'Stay Duration';
    row.cells[1].value = 'Nov 1 - Nov 5';
    row.cells[2].value = 'Amount Paid';
    row.cells[3].value = '5000';

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 200, 0, 0));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    final path = (await getExternalStorageDirectory())!.path;
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$fileName');
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('assets/app/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
