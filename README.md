# Naomi Kyla Zahra Siregar
**NPM:** 2406434102  
**Kelas:** PBP - B  

---

## TUGAS 7: ELEMEN DASAR FLUTTER

**Nama Project:** goollmart

### 1. Apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget?
**Widget tree** adalah struktur hierarki yang menggambarkan hubungan antar widget dalam aplikasi Flutter.
Setiap widget di Flutter ditempatkan di dalam *tree* (pohon) yang dimulai dari widget induk (*parent widget*) dan bercabang ke widget anak (*child widgets*).
Contohnya:
- `MaterialApp` → *parent* dari seluruh aplikasi.
- Di dalamnya ada `Scaffold` → *child* dari `MaterialApp`.
- `Scaffold` memiliki `AppBar` dan `Body` → keduanya *child* dari `Scaffold`.
Setiap perubahan pada widget akan menyebabkan **rebuild** pada *child widget* yang terpengaruh. Flutter menghitung ulang tampilan berdasarkan struktur **tree** ini agar UI selalu sinkron dengan data terkini.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya. 
Berikut widget yang digunakan dalam proyek GoollMart (Football Shop) dan fungsinya:
- `MaterialApp` -> Widget utama yang membungkus seluruh aplikasi dan menyediakan tema, navigasi, serta pengaturan umum aplikasi.
- `Scaffold` -> Menyediakan struktur dasar halaman seperti `AppBar`, `Body`, dan `FloatingActionbutton`.
- `AppBar` -> Menampilkan bilah atas (judul aplikasi).
- `Text` -> Menampilkan teks di layar.
- `Column` -> Menyusun widget anak secara vertikal.
- `Row` -> Menyusun widget anak secara horizontal.
- `Padding` -> Memberi jarak di sekitar widget agar tidak menempel satu sama lain.
- `Center` -> Menempatkan widget di tengah layar.
- `Card` -> Membuat tampilan seperti kotak dengan bayangan lembut (digunakan untuk InfoCard).
- `Icon` -> Menampilkan ikon pada tombol atau kartu.
- `GridView.Count` -> Menampilkan daftar tombol (kartu produk) dalam bentuk grid.
- `InkWell` -> Menangani interaksi seperti sentuhan/tap pada kartu.
- `SnackBar` -> Menampilkan pesan singkat di bagian bawah layar ketika tombol ditekan.
- `ThemeData` -> Mengatur warna, gaya teks, dan tema keseluruhan aplikasi.

### 3. Apa fungsi dari widget (`MaterialApp`)? Mengapa widget ini sering digunakan sebagai widget root?
`MaterialApp` berfungsi sebagai titik awal aplikasi Flutter yang menggunakan desain **Material Design** milik Google.
Widget ini menyediakan:
- Tema dan warna global (`ThemeData`),
- Navigasi antar halaman (`Navigator`),
- Judul aplikasi (`title`),
- Dan pengaturan lokal lain.
Karena semua widget di bawahnya membutuhkan *context* tema dan navigasi dari (`MaterialApp`), maka widget ini **selalu digunakan sebagai root widget** pada aplikasi berbasis Material Design.

### 4. Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?
**a. `StatelessWidget`** -> Tidak memiliki state (keadaan) yang dapat berubah. Nilainya tetap selama aplikasi berjalan. Contoh penggunaannya pada Tampilan teks, ikon, tombol statis.
**b. `StatefulWidget`** -> Memiliki state yang dapat berubah selama aplikasi berjalan. Setiap perubahan state akan me-*rebuild* UI. Contoh penggunaannya pada counter, form input, atau data dinamis yang berubah karena interaksi user.

### 5. Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode `build`?
`BuildContext` adalah objek yang menyimpan informasi posisi suatu widget di dalam *widget tree*.
Fungsinya:
- Menentukan *parent-child relationship* antar widget.
- Mengakses tema dan data dari widget lain di atasnya, seperti `Theme.of(context)` atau `Navigator.of(context)`.
Di dalam metode `build`, `context` digunakan untuk:
```dart
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.primary,
    ...
  );
}
```

### 6. Jelaskan konsep *hot reload* di Flutter dan bagaimana bedanya dengan *hot restart*.
**a. Hot Reload** -> Menyisipkan perubahan kode ke dalam aplikasi yang sedang berjalan tanpa kehilangan state (misalnya nilai counter tidak reset). Cocok untuk memperbarui UI saat coding.
**b. Hot Restart** -> Menjalankan ulang aplikasi dari awal dan **menghapus semua state**. Aplikasi memulai ulang seperti baru dijalankan.
Dengan *hot reload*, kita bisa langsung melihat hasil perubahan UI dalam hitungan detik tanpa harus membangun ulang seluruh aplikasi.
