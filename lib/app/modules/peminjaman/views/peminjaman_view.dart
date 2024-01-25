import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peminjaman View',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: controller.obx(
            (state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(
                  Icons.bookmarks_sharp,
                  color: Colors.blue,
                ),
                title: Text(
                  "${state[index].book?.judul}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "id User: ${state[index].user}",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "Tanggal Pinjam: ${state[index].tanggalPinjam}",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "Tanggal Kembali: ${state[index].tanggalKembali}",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
