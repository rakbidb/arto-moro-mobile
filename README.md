# Arto Moro Mobile Shop
#### by Rakha Abid Bangsawan - 2206081585 - PBP A
<hr>

# Jawaban Tugas 7
<hr>

## 1. Apa perbedaan utama antara <em>stateless</em> dengan <em>stateful widget</em> dalam konteks pengembangan aplikasi Flutter?
### Jawaban: 
- <b><em>Stateless Widget</em></b> <br>
    <em>Stateless Widget</em> adalah sebuah widget yang bersifat statis dan tidak dapat diubah setelah page dibuat. 
- <b><em>Stateful Widget</em></b> <br>
    <em>Stateful Widget</em> adalah sebuah widget yang bersifat dinamis, artinya widget tersebut dapat berubah sepanjang waktu.
- Jadi, stateful widget lebih cocok apabila page mengandung komponen yang perlu memberikan respon terhadap request yang dapat menyebabkan perubahan data ataupun merespon terhadap input pengguna, sedangkan stateless widget lebih cocok untuk tipe page yang static (tidak terjadi refresh/perubahan konten page berulang kali). Dalam konteks pengembangan aplikasi Flutter, keputusan kapan perlu menggunakan stateless atau stateful widget dapat memengaruhi kinerja aplikasi secara signifikan mengingat masing-masing memiliki karateristiknya sendiri. Dengan pemilihan yang tepat, aplikasi dapat berjalan dengan lebih efisien.
<hr>

## 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing
### Jawaban: 
- `MyApp - StatelessWidget` => Sebuah StatelessWidget yang berfungsi sebagai app utama.
- `MaterialApp` => Untuk kustomisasi dasar aplikasi dengan design Material (theme, title, etc.).
- `ThemeData` => Untuk mengatur theme aplikasi (colorScheme, font, etc.).
- `MyHomePage - StatelessWidget` => Sebuah StatelessWidget yang berfungsi sebagai home page dari app.
- `Scaffold` => Untuk kustomisasi struktur dasar page app (appBar, body, etc.).
- `AppBar` => Untuk menampilkan section paling atas pada page.
- `Text` => Untuk menampilkan teks pada page.
- `TextStyle` => Untuk kustomisasi teks pada page (color, size, etc.).
- `SingleChildScrollView` => Sebuah widget wrapper yang dapat discroll apabila konten lebih besar dari ukuran screen.
- `Padding` => Untuk mengatur jarak (padding) di sekitar widget childnya.
- `Column` => Untuk mengatur widget childnya dalam kolom vertikal.
- `GridView.count` => Untuk mengatur widget childnya dalam bentuk grid sesuai banyak baris dan kolom yang diinginkan.
- `ShopCard - StatelessWidget` => Sebuah StatelessWidget untuk menampilkan ShopItem dalam bentuk card
- `Material` => Untuk kustomisasi design Material pada widget (elevation, color, etc.)
- `InkWell` => Untuk dapat memberikan respons ketika diklik (semacam button).
- `SnackBar` => Untuk menampilkan pesan sementara kepada pengguna.
- `Container` => Untuk mengatur tata letak widget.
- `Center` => Untuk mengubah posisi widget childnya ke tengah.
- `Icon` => untuk menampilkan icon yang diinginkan dan dapat dikustomisasi (seperti color, size, etc.).

<hr>

## 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
### Jawaban: 
### Berikut adalah cara mengimplementasikan semua checklist pada Tugas 7.
- [ ] Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
    - Menjalankan command berikut pada cmd:
    ```bash
    flutter create arto_moro
    cd arto_moro
    flutter run
    ```

- [ ] Membuat tiga tombol sederhana dengan ikon dan teks untuk:
    - Mengubah main.dart menjadi seperti di bawah ini agar home page berada di menu.dart
    ```dart
    import 'package:flutter/material.dart';
    import 'package:arto_moro/menu.dart';

    void main() {
        runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
        const MyApp({super.key});

        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Arto Moro',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                useMaterial3: true,
            ),
            home: MyHomePage(),
            );
        }
    }
    ```

    - Menambahkan class ShopItem sebagai berikut pada menu.dart:
    ```dart
    class ShopItem {
        final String name;
        final IconData icon;
        final Color warna;

        ShopItem(this.name, this.icon, this.warna);
    }
    ```
    - [ ] Melihat daftar item (Lihat Item)
        - Menambahkan `ShopItem("Lihat Produk", Icons.checklist, Colors.lightBlueAccent),` sebagai tombol Lihat Produk pada `final List<ShopItem> items` <br>
    - [ ] Menambah item (Tambah Item)
        - Menambahkan `ShopItem("Tambah Produk", Icons.add_shopping_cart, Colors.lightBlue),` sebagai tombol Tambah Item pada `final List<ShopItem> items` <br>
    - [ ] Logout (Logout)
        - Menambahkan `ShopItem("Logout", Icons.logout, Colors.blue),` sebagai tombol Logout pada `final List<ShopItem> items` <br>
        
    - Jadi, pada akhirnya akan menjadi:
    ```dart
    final List<ShopItem> items = [
        ShopItem("Lihat Produk", Icons.checklist, Colors.lightBlueAccent),
        ShopItem("Tambah Produk", Icons.add_shopping_cart, Colors.lightBlue),
        ShopItem("Logout", Icons.logout, Colors.blue),
    ];
    ```
    - Membuat class ShopCard yang akan menjadi StatelessWidget untuk ShopItem
    - Pada MyHomePage, ubah `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);`

- [ ] Memunculkan Snackbar dengan tulisan:
    - [ ] "Kamu telah menekan tombol Lihat Produk" ketika tombol Lihat Produk ditekan.
    - [ ] "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
    - [ ] "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

    - Menambahkan potongan kode berikut pada function build ShopCard agar muncul SnackBar sebagai respon ketika button diklik. Tidak perlu membuat sebanyak 3 karena hanya perlu disesuaikan dengan attribute `name` dari masing-masing ShopItem.
    ```dart
    onTap: () {
        // Memunculkan SnackBar ketika diklik
        ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Kamu telah menekan tombol ${item.name}!")));
    },
    ```

<hr>
