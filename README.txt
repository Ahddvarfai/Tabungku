TABUNGKU - SOURCE CODE LIB

1. Pastikan terminal berada di folder proyek:
   cd ~/tabungku

2. Tambahkan dependency:
   flutter pub add get
   flutter pub add shared_preferences

3. Ekstrak ZIP ini, lalu salin folder lib ke proyek ~/tabungku.
   Pilih replace/overwrite jika diminta.

4. Ambil dependency dan periksa:
   flutter pub get
   flutter analyze

5. Jalankan aplikasi desktop Linux:
   flutter run -d linux

FITUR:
- Ringkasan saldo, pemasukan, dan pengeluaran.
- Tambah transaksi dengan validasi dan pratinjau nominal.
- Detail transaksi dan hapus transaksi.
- GetX: GetMaterialApp, GetxController, RxList, Obx, Get.to, Get.back.
- Penyimpanan lokal memakai shared_preferences; data transaksi tetap ada
  setelah aplikasi ditutup dan dibuka kembali.

CATATAN:
- Dua transaksi contoh akan dibuat saat aplikasi pertama kali dijalankan.
- Saldo dihitung dari total pemasukan dikurangi total pengeluaran.
- Jangan menghapus folder test atau konfigurasi proyek yang sudah ada.
- Kode ini memenuhi implementasi fitur yang tercantum di ringkasan tugas.
  Cocokkan kembali dengan instruksi/rubrik asli dosen sebelum dikumpulkan.
