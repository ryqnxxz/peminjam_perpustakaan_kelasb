import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddpeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add peminjaman View',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.tanggalPinjamController,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Pinjam',
                    hintText: 'Masukkan Tanggal Pinjam',
                    icon: Icon(Icons.date_range),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tanggal Pinjam tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.tanggalKembaliController,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Kembali',
                    hintText: 'Masukkan Tanggal kembali',
                    icon: Icon(Icons.update),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tanggal kembali tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Center(
                  child: Obx(() => controller.loading.value
                      ? CircularProgressIndicator(
                    color: Colors.black,
                  )
                      : ElevatedButton(
                    onPressed: () {
                      controller.addPeminjamanpost();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.lightBlueAccent),
                      ),
                    ),
                    child: Text(
                      'Pinjam',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
