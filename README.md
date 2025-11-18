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

------------------------------------------------------------------------------------------------------------------------------------------

## TUGAS 9: INTEGRASI LAYANAN WEB DJANGO DENGAN APLIKASI FLUTTER 

### 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan `Map<String, dynamic>` tanpa model (terkait validasi tipe, null-safety, maintainability)?
**1. Keuntungan menggunakan model Dart:**
- **Validasi tipe**: Model memastikan bahwa data JSON yang diterima sesuai tipe yang diharapkan (misal `String`, `int`). Ini membantu mencegah error saat runtime.
- **Null-safety**: Dengan model, kita bisa menentukan field mana yang wajib atau opsional, sehingga lebih aman dari null error.
- **Maintainability & readability**: Akses data jadi lebih jelas (`product.name` daripada `data['name']`). Model juga memudahkan dokumentasi struktur data.
- **Konversi otomatis**: Kita bisa menambahkan `fromJson` dan `toJson` untuk parsing JSON ke objek dan sebaliknya.
**2. Konsekuensi langsung memetakan JSON ke `Map<String, dynamic>`:**
- Risiko typo atau kesalahan akses key.
- Tidak ada validasi tipe otomatis sehingga bisa muncul runtime error jika tipe data tidak sesuai.
- Kurang readable, sulit dimaintain, terutama saat proyek besar atau struktur JSON kompleks.

### 2. Apa fungsi package *http* dan *CookieRequest* dalam tugas ini? Jelaskan perbedaan peran *http* vs *CookieRequest*.
**1. http package:**
- Digunakan untuk melakukan request HTTP biasa (GET, POST) ke server Django.
- Tidak secara otomatis menyimpan atau mengelola cookie. Cocok untuk fetch data sederhana dari API publik.
**2. CookieRequest:**
- Dikembangkan khusus untuk integrasi Flutter + Django dengan autentikasi berbasis session/cookie.
- Menyimpan cookie secara otomatis, memungkinkan login, logout, dan request authenticated tanpa menambahkan header manual.
- Bisa memanggil method seperti `login`, `get`, `post` dengan session user.

**Perbedaan utama:**
- `http` → request HTTP dasar, tidak otomatis kelola cookie.
- `CookieRequest` → request HTTP + manajemen session/cookie otomatis → cocok untuk aplikasi dengan login Django.

### 3. Jelaskan mengapa *instance CookieRequest* perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
**Instance `CookieRequest`** menyimpan session user yang sudah login. Dengan membagikannya melalui `Provider`, semua halaman/komponen bisa mengakses user yang sama untuk:
- Mengambil data yang membutuhkan autentikasi.
- Mengirim data baru ke server (misal tambah produk atau update profil).

Tanpa shared instance, setiap halaman harus login ulang atau mengelola cookie sendiri → tidak praktis.

### 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
**1. ALLOWED_HOSTS & 10.0.2.2:**
- Saat menggunakan Android emulator, `localhost` di emulator menunjuk ke emulator sendiri, bukan komputer host.
- `10.0.2.2` menunjuk ke host machine.
- Django harus menambahkan `10.0.2.2` ke `ALLOWED_HOSTS` agar request dari emulator diterima.
**2. CORS:**
- Cross-Origin Resource Sharing (CORS) diperlukan agar aplikasi Flutter dapat meminta resource dari Django yang berjalan di host berbeda.
- Tanpa CORS → request akan ditolak karena security policy browser / emulator.
**3. SameSite & Cookie Settings:**
Agar cookie session dapat dikirim dari Flutter ke Django, pengaturan cookie harus sesuai (misal `SameSite=None` jika lintas domain).
**4. Izin Internet di Android `(AndroidManifest.xml)`:**
- Flutter perlu akses internet untuk melakukan HTTP request.
- Tanpa permission → request gagal, halaman tidak bisa fetch data.
**5. Konsekuensi jika konfigurasi tidak benar:**
- Login gagal → session tidak tersimpan.
- Data JSON tidak bisa di-fetch → List produk kosong.
- Error CORS → request ditolak.

### 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. Flutter mengirim HTTP GET request ke endpoint Django `fetchProduct`.
2. Response dari server di-decode dari JSON ke list atau map.
3. Data JSON diubah menjadi objek `Product` melalui `Product.fromJson()`.
4. Semua objek `Product` disimpan di list `listProduct`.
5. `FutureBuilder` digunakan untuk menunggu data selesai dimuat.
- **Jika data belum siap** → tampil `CircularProgressIndicator`.
- **Jika data siap** → tampil `ListView.builder` untuk menampilkan semua item.

### 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. User memasukkan username dan password di `TextField`.
2. Flutter mengirim HTTP POST menggunakan `CookieRequest` ke endpoint login Django.
```dart
final response = await request.login(
    "http://127.0.0.1:8000/auth/login/",  
    {
        'username': username,
        'password': password,
    });
```
3. Django memeriksa kredensial:
- **Jika valid** → mengirim response berhasil.
- **Jika gagal** → mengirim response error.
4. Flutter memeriksa `request.loggedIn`:
- **Jika berhasil** → navigasi ke `MyHomePage` dan tampilkan SnackBar “Welcome”.
- **Jika gagal** → tampilkan `AlertDialog` berisi pesan error.

### 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Mempersiapkan API Django
- Pastikan server Django sudah berjalan dan endpoint JSON & autentikasi tersedia (`/json/` untuk data produk, `/auth/login/` untuk login).
- Cek response JSON di browser atau Postman untuk memastikan format data sudah sesuai.
2. Menyediakan CookieRequest Global
- Gunakan `Provider` di `main.dart` untuk membuat instance `CookieRequest` agar bisa diakses di semua halaman:
```dart
return Provider(
  create: (_) => CookieRequest(),
  child: MaterialApp(...),
);
```
- Dengan cara ini, semua widget bisa melakukan request yang terautentikasi ke Django.
3. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
- Membuat django-app baru bernama `authentication` dan menambahkannya ke `INSTALLED_APPS` di `settings.py` aplikasi Django.
- Menginstall `django-cors-headers` dan menambahkannya ke `INSTALLED_APPS` dan `requirements.txt`, serta menambahkan `corsheaders.middleware.CorsMiddleware` ke `MIDDLEWARE` di `settings.py`
- Menambahkan beberapa konfigurasi berikut ke `settings.py`:
```dart
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
4. Mendesain Tampilan Login & Register
- Sesuaikan warna dengan web GoollMart (navbar gelap, tulisan logo kuning, tombol login utama gelap).
- Gunakan `TextField` untuk input, `ElevatedButton` untuk tombol login, dan `GestureDetectorv` untuk navigasi ke halaman register.
- Pastikan desain responsif dengan `SingleChildScrollView` agar keyboard tidak menutupi input.
5. Implementasi Autentikasi
- Ambil input username & password dari `TextField`.
- Kirim request login menggunakan `CookieRequest.login`.
- Jika berhasil → navigasi ke `MyHomePage` + tampilkan `SnackBar`.
- Jika gagal → tampilkan `AlertDialog` dengan pesan error dari Django.
6. Mengambil & Menampilkan Data JSON
- Buat function `fetchProduct()` yang melakukan GET request ke endpoint JSON.
- Decode response JSON dan convert ke objek `Product` dengan `Product.fromJson()`.
- Gunakan `FutureBuilder` untuk menunggu data dimuat, tampilkan `CircularProgressIndicator` jika belum siap.
- Setelah data siap → tampilkan list produk menggunakan `ListView.builder`.
7. Desain Halaman Produk & Detail
- Sesuaikan warna background, card, dan teks supaya konsisten dengan tema web.
- Gunakan Card untuk menampilkan setiap item produk dengan shadow dan border sesuai design.
- Detail item menggunakan halaman baru `(DetailItemPage)` yang menampilkan info lengkap.
8. Integrasi Navigasi & Interaksi
- Pastikan tombol login/register dan item list bisa diklik.
- Gunakan `Navigator.push` / `Navigator.pushReplacement` untuk berpindah halaman.
- Gunakan `GestureDetector` di list item untuk menangkap tap user.
9. Testing & Validasi
- Test login dengan akun yang valid dan invalid.
- Test fetch JSON: semua data tampil sesuai.
