import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjaman_perpustakaan_kelasb/app/routes/app_pages.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BookView',
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
                  Icons.book,
                  color: Colors.blue,
                ),
                title: Text(
                  "${state[index].judul}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Penulis: ${state[index].penulis}",
                  style: TextStyle(fontSize: 14),
                ),
                  trailing: ElevatedButton(
                    child: Text("Pinjam"),
                    onPressed: (){
                      Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                        'id':(state[index].id??0).toString(),
                        'judul':state[index].judul??"-"
                      });
                    },
                  )
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
