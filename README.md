# MyPortfolio Mobile

Aplikasi portofolio mobile berbasis Flutter untuk mata kuliah Pemrograman Berbasis Platform (PBP).

**Nama**: Adinda Madya Aliyah  
**NPM**: 2506656362  
**Kelas**: PBP C  

---

### Tugas 7

1. **Jelaskan apa itu *stateless widget* dan *stateful widget*, serta jelaskan perbedaan dari keduanya!**
   - **StatelessWidget**: Widget yang bersifat statis dan tidak memiliki keadaan (*state*) internal yang dapat berubah selama masa hidupnya. Seluruh konfigurasi dan propertinya bersifat final/tetap setelah diinisialisasi. Widget ini cocok digunakan untuk elemen antarmuka yang tampilannya hanya bergantung pada informasi konfigurasi awal atau data dari widget induknya, seperti teks statis, ikon, dan kartu informasi pemilik (`InfoCard`).
   - **StatefulWidget**: Widget yang bersifat dinamis dan dapat mempertahankan serta mengubah keadaannya (*state*) selama aplikasi berjalan. Widget ini memiliki objek `State` pendamping yang dapat diperbarui kapan saja melalui pemanggilan fungsi `setState()`. Ketika `setState()` dipanggil, Flutter akan menjadwalkan pembangunan ulang (*rebuild*) pada antarmuka widget untuk mencerminkan nilai data terbaru. Widget ini cocok untuk formulir input interaktif, penghitung, atau komponen dengan animasi.
   - **Perbedaan Utama**: `StatelessWidget` tidak memiliki objek `State` dan method `build()`-nya dijalankan satu kali saat widget dibuat, sedangkan `StatefulWidget` mengelola objek `State` yang dapat memutasi data dan memicu `build()` berulang kali sesuai perubahan interaksi pengguna.

2. **Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya!**
   - `MaterialApp`: Widget root aplikasi yang membungkus keseluruhan antarmuka Material Design, menyediakan tema global, routing, dan judul aplikasi.
   - `Scaffold`: Struktur dasar visual tata letak halaman Material, menyediakan slot untuk `appBar`, `drawer`, `body`, dan mekanisme notifikasi `SnackBar`.
   - `AppBar`: Bar bagian atas halaman yang menampilkan judul aplikasi serta tombol drawer / navigasi kembali.
   - `Padding`: Memberikan ruang jarak di sekeliling widget anaknya agar tampilan tidak menempel ke tepi layar.
   - `Column`: Menyusun widget-widget anaknya secara vertikal dari atas ke bawah.
   - `Row`: Menyusun widget-widget anaknya secara horizontal dari kiri ke kanan.
   - `Center`: Memosisikan widget anaknya tepat di tengah ruang yang tersedia.
   - `Text`: Menampilkan teks string dengan gaya tipografi tertentu.
   - `Card`: Menampilkan container dengan efek elevasi visual (bayangan) untuk kartu informasi.
   - `Container`: Widget pembungkus serbaguna untuk mengatur lebar, padding, dan dekorasi.
   - `GridView.count`: Menampilkan daftar widget anak dalam bentuk kisi/grid dengan jumlah kolom tetap (3 kolom).
   - `Material`: Menyediakan kanvas Material untuk warna latar kartu dan efek visual.
   - `InkWell`: Memberikan respons interaktif berupa animasi riak (*ripple effect*) ketika kartu ditekan oleh pengguna.
   - `Icon`: Menampilkan simbol grafis berbasis font icon bawaan Material Icons.
   - `SnackBar`: Notifikasi bar sementara yang muncul di bagian bawah layar untuk memberi umpan balik interaksi kepada pengguna.

3. **Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak oleh fungsi tersebut!**
   - Fungsi `setState()` memberi tahu framework Flutter bahwa telah terjadi perubahan pada keadaan internal objek `State`. Panggilan ini menyebabkan Flutter menjadwalkan eksekusi ulang pada method `build()` dari widget tersebut sehingga UI diperbarui sesuai dengan nilai variabel yang baru.
   - Variabel yang terdampak adalah seluruh variabel instans yang dideklarasikan di dalam kelas `State` terkait dan digunakan untuk merender tampilan antarmuka (misalnya variabel penampung input teks `_school`, `_degree`, status loading, atau nilai counter). Variabel lokal di dalam fungsi atau variabel final pada widget tidak terpengaruh oleh `setState()`.

4. **Jelaskan perbedaan antara `const` dan `final` keyword pada Dart!**
   - **`final`**: Menandakan bahwa nilai variabel hanya dapat diinisialisasi satu kali dan nilainya tidak dapat diubah lagi setelah ditetapkan. Nilai `final` dapat diketahui saat *runtime* (misalnya hasil fungsi, waktu sekarang, atau input pengguna).
   - **`const`**: Bersifat lebih ketat daripada `final`, di mana nilai variabel harus sudah dapat diketahui secara pasti pada saat kompilasi (*compile-time constant*). Widget atau objek yang dideklarasikan dengan `const` akan dialokasikan ke memori kanonikal tunggal (*canonical instance*), sehingga Flutter tidak perlu mengalokasikan ulang objek yang sama berulang kali saat pembangunan UI, yang membantu meningkatkan performa aplikasi.

---

### Tugas 8

1. **Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.**
   - **`Navigator.push()`**: Menambahkan (*push*) sebuah route/halaman baru ke atas tumpukan navigasi (*navigation stack*). Halaman sebelumnya tetap tersimpan di dalam stack di bawah halaman baru, sehingga pengguna dapat kembali ke halaman sebelumnya menggunakan tombol kembali (*Back button*) pada AppBar atau gestur perangkat.
   - **`Navigator.pushReplacement()`**: Mengganti (*replace*) halaman yang sedang aktif di puncak stack dengan halaman baru. Halaman lama dibuang dari stack dan posisinya digantikan oleh halaman baru, sehingga pengguna tidak dapat kembali ke halaman lama dengan tombol back biasa.
   - **`Navigator.pop()`**: Menghapus (*pop*) halaman yang berada di puncak stack saat ini, sehingga pengguna kembali ke halaman yang berada tepat di bawahnya dalam stack navigasi. Method ini juga digunakan untuk menutup dialog (`AlertDialog`) atau drawer.
   - **Membuka formulir dari kartu aksi**: Menggunakan **`Navigator.push()`** agar halaman utama tetap berada di dalam stack navigasi. Dengan demikian, ketika formulir terbuka, tombol kembali bawaan pada `AppBar` secara otomatis muncul dan pengguna dapat dengan mudah kembali ke halaman utama.
   - **Opsi Home di Drawer**: Menggunakan **`Navigator.pushReplacement()`** menuju `MyHomePage()`. Penggunaan `pushReplacement()` memastikan halaman formulir lama digantikan oleh `MyHomePage()`, sehingga stack navigasi tidak menumpuk halaman berulang kali saat pengguna berpindah-pindah antar menu drawer.

2. **Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**
   - Susunan `Scaffold`, `AppBar`, dan `Drawer` menerapkan prinsip arsitektur Material Design yang konsisten:
     - `Scaffold` menyediakan kerangka kerja kanonikal (tata letak standar) untuk setiap layar aplikasi, memastikan posisi bar atas, area isi (*body*), dan menu samping (*drawer*) berada di koordinat yang seragam.
     - `AppBar` menampilkan identitas visual terpadu di setiap halaman dengan teks judul tebal putih dan tombol akses navigasi (menu drawer atau tombol kembali).
     - `Drawer` (`LeftDrawer`) bertindak sebagai komponen navigasi global yang dapat digunakan kembali (*reusable widget*) di berbagai halaman (`MyHomePage`, `EducationFormPage`, dan `ProjectFormPage`), sehingga pengguna selalu menemukan menu navigasi yang sama di mana pun mereka berada.
   - **Contoh konsistensi warna tema**: Warna primer portofolio didefinisikan satu kali di `lib/main.dart` melalui `ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, secondary: Colors.amber[700]))`. Di setiap halaman (`menu.dart`, `education_form.dart`, `project_form.dart`, dan `left_drawer.dart`), warna tersebut diakses secara dinamis menggunakan `Theme.of(context).colorScheme.primary` untuk latar belakang `AppBar` dan `DrawerHeader`, serta tombol "Simpan". Jika warna dasar aplikasi diubah di `main.dart`, seluruh halaman akan otomatis beradaptasi tanpa perlu mengubah kode satu per satu.

3. **Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.**
   - Formulir disusun menggunakan kombinasi `SingleChildScrollView`, `Column`, dan `Padding` karena formulir terdiri dari serangkaian field input vertikal yang membutuhkan ruang visual memadai serta fleksibilitas terhadap ukuran layar yang beragam (misalnya ponsel layar kecil atau orientasi landscape).
   - **Peran widget penggulir (`SingleChildScrollView`)**: Mencegah terjadinya galat *bottom overflow* (*render overflow*) ketika papan ketik virtual (*soft keyboard*) muncul di layar. Saat keyboard aktif, tinggi area tampilan menyusut secara drastis. Dengan `SingleChildScrollView`, seluruh isi formulir dan tombol "Simpan" tetap dapat digulir ke atas sehingga pengguna dapat mengisi setiap field dan menekan tombol tanpa terhalang keyboard.
   - **Peran widget pengatur jarak (`Padding`)**: Memberikan ruang bernapas (*whitespace*) di sekeliling setiap `TextFormField` dan tombol aksi. Hal ini mencegah elemen input saling menempel ke tepi layar atau satu sama lain, membuat antarmuka lebih nyaman dibaca (*legible*), serta mempermudah jari pengguna untuk menyentuh area input (*touch target*).

4. **Apa peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**
   - **`GlobalKey<FormState>`**: Kunci unik global yang memberikan akses ke objek `FormState` internal dari widget `Form`. Kunci ini memungkinkan kode di luar form (misalnya pada callback `onPressed` tombol Simpan) untuk mengidentifikasi dan memicu operasi pada seluruh form.
   - **`validator`**: Fungsi logika yang dipasang pada masing-masing `TextFormField` untuk memeriksa keabsahan nilai input. Fungsi ini mengembalikan string pesan kesalahan jika input tidak valid, atau `null` jika lolos validasi.
   - **`validate()`**: Method pada `FormState` yang dipanggil melalui `_formKey.currentState!.validate()`. Saat dieksekusi, method ini menjalankan seluruh fungsi `validator` dari semua field di dalam form secara serentak. Jika ada minimal satu field yang mengembalikan string error, form ditandai tidak valid, pesan kesalahan ditampilkan di bawah masing-masing kolom, dan proses penyimpanan dihentikan.
   - **Contoh nilai yang ditolak**: Nilai string yang hanya berisi spasi kosong (misalnya `"   "`) pada kolom nama institusi, atau nilai angka tahun seperti `"1850"` atau teks `"abc"` pada kolom tahun mulai.
   - **Mengapa jenis input / papan ketik saja belum cukup**: Mengatur `keyboardType: TextInputType.number` hanyalah saran antarmuka (*UI hint*) kepada sistem operasi untuk menampilkan papan ketik angka, bukan mekanisme validasi data. Pengguna masih dapat menempelkan teks huruf melalui *clipboard*, memasukkan tanda baca negatif/titik, mengosongkan isian, atau memasukkan angka yang tidak masuk akal (misalnya tahun 99999). Oleh karena itu, validasi logika di sisi kode menggunakan `validator` mutlak diperlukan untuk menjamin keutuhan dan kebenaran data sebelum diproses lebih lanjut.

---

### AI Disclosure
Dalam pengerjaan Tugas 8 ini, saya memanfaatkan bantuan asisten AI (Google Antigravity) untuk:
- Mempelajari implementasi widget `Form`, `GlobalKey<FormState>`, dan fungsi `validator` pada Flutter.
- Merancang struktur arsitektur berkas navigasi modular (`lib/screens/` dan `lib/widgets/left_drawer.dart`).
- Mengimplementasikan alur navigasi menggunakan `Navigator.push()` dan `Navigator.pushReplacement()`.
- Menyusun penanganan validasi input yang aman terhadap string kosong, batas karakter, serta validasi rentang tahun.
