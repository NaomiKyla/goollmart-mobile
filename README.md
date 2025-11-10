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
**- `StatelessWidget`** -> Tidak memiliki state (keadaan) yang dapat berubah. Nilainya tetap selama aplikasi berjalan. Contoh penggunaannya pada Tampilan teks, ikon, tombol statis.
**- `StatefulWidget`** -> Memiliki state yang dapat berubah selama aplikasi berjalan. Setiap perubahan state akan me-*rebuild* UI. Contoh penggunaannya pada counter, form input, atau data dinamis yang berubah karena interaksi user.

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
**- Hot Reload** -> Menyisipkan perubahan kode ke dalam aplikasi yang sedang berjalan tanpa kehilangan state (misalnya nilai counter tidak reset). Cocok untuk memperbarui UI saat coding.
**- Hot Restart** -> Menjalankan ulang aplikasi dari awal dan **menghapus semua state**. Aplikasi memulai ulang seperti baru dijalankan.

Dengan *hot reload*, kita bisa langsung melihat hasil perubahan UI dalam hitungan detik tanpa harus membangun ulang seluruh aplikasi.

------------------------------------------------------------------------------------------------------------------------------------------

## TUGAS 8: FLUTTER NAVIGATION, LAYOUTS, FORMS, AND INPUT ELEMENTS

### 1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter.
**`Navigator.push()`** digunakan untuk menambahkan halaman baru di atas stack halaman yang sedang aktif. Artinya, pengguna bisa kembali ke halaman sebelumnya dengan menekan tombol Back, karena halaman lama tetap ada di dalam memori aplikasi. Sebaliknya, **`Navigator.pushReplacement()`** digunakan untuk mengganti halaman saat ini dengan halaman baru, sehingga halaman sebelumnya dihapus dari stack dan pengguna tidak dapat kembali dengan tombol Back. Penerapan di aplikasi GoollMart:
**- `Navigator.push()`** digunakan ketika pengguna menekan tombol “Create Product” di halaman utama (menu.dart) agar mereka bisa kembali ke halaman utama setelah mengisi form.
**- `Navigator.pushReplacement()`** digunakan pada Drawer, misalnya ketika menekan “Home” atau “Create Product”, supaya halaman berpindah sepenuhnya tanpa menumpuk halaman sebelumnya (efisien untuk navigasi utama).

### 2. Bagaimana kamu memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Di aplikasi GoollMart, ketiga widget ini digunakan sebagai struktur dasar agar setiap halaman memiliki tampilan dan navigasi yang konsisten:
**- `Scaffold`** berfungsi sebagai kerangka utama setiap halaman, yang memuat seluruh elemen seperti AppBar, Drawer, dan body.
**- `AppBar`** digunakan untuk menampilkan judul halaman di bagian atas, misalnya “GoollMart” di halaman utama dan “Create Product Form” di halaman form produk.
**- `Drawer`** digunakan sebagai menu navigasi yang muncul di sisi kiri, berisi dua opsi: “Home” dan “Create Product”. Drawer ini disertakan di setiap halaman untuk konsistensi navigasi.

Dengan kombinasi ini, seluruh halaman aplikasi GoollMart terasa menyatu secara visual dan mudah digunakan oleh pengguna.

### 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Widget layout ini sangat penting untuk menjaga kenyamanan tampilan form dan responsivitas layar:
**- `Padding`** memberi jarak antar elemen, sehingga form terlihat rapi dan tidak saling menempel.
**- `SingleChildScrollView`** memungkinkan halaman form untuk digulir (scroll), agar tidak terjadi overflow ketika form terlalu panjang atau dibuka di layar kecil.
**- `ListView` atau `Column`** digunakan untuk menyusun elemen form secara vertikal, memudahkan pengguna mengisi dari atas ke bawah. 

Contoh di aplikasi GoollMart:
Pada `product_form.dart`, seluruh elemen form (`TextFormField`, `DropdownButtonFormField`, dan `SwitchListTile`) dibungkus di dalam `SingleChildScrollView` dengan `Padding` di setiap input agar tata letaknya rapi dan tidak keluar layar saat keyboard muncul.

### 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Warna tema GoollMart disesuaikan agar konsisten dengan nuansa biru dan biru tua (indigo) yang merepresentasikan profesionalitas dan semangat olahraga. Penyesuaiannya dilakukan di main.dart melalui konfigurasi ThemeData dan ColorScheme berikut:
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.blueAccent[400]),
),
```
**- `primarySwatch: Colors.blue`** digunakan sebagai warna utama untuk AppBar dan komponen utama.
**- `secondary: Colors.blueAccent[400]`** digunakan sebagai warna sekunder untuk elemen seperti tombol dan kartu (card).

Dengan ini, seluruh halaman di aplikasi GoollMart memiliki identitas visual yang seragam, bersih, dan merepresentasikan brand toko dengan baik.