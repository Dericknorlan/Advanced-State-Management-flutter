# Advanced-State-Management-flutter 

# Aplikasi Drag-and-Drop dengan Global State

Aplikasi ini adalah contoh implementasi drag-and-drop menggunakan Flutter. Aplikasi ini menampilkan daftar "counter" yang dapat di-drag, drop, diubah warnanya, dihapus, dan ditambah melalui integrasi dengan paket `super_drag_and_drop` dan state management menggunakan paket `global_state`.

## Fitur Utama

1. **Drag-and-Drop:**
   - Counter dapat di-drag dan di-drop untuk mengubah urutan dalam daftar.
   - Mendukung operasi drag dengan data kustom.

2. **Manajemen Global State:**
   - Menggunakan paket `global_state` untuk menyimpan dan mengelola daftar counter.
   - Setiap counter memiliki nilai counter, warna, dan label unik.

3. **Operasi pada Counter:**
   - **Increment:** Meningkatkan nilai counter.
   - **Decrement:** Mengurangi nilai counter (tidak bisa kurang dari 0).
   - **Change Color:** Mengubah warna counter secara siklis.
   - **Remove Counter:** Menghapus counter dari daftar.

4. **Drop Region:**
   - Area drop memiliki desain menggunakan `dotted_border`.
   - Menampilkan teks "Drop items here to reorder" untuk memberikan petunjuk kepada pengguna.

5. **Penambahan Counter Baru:**
   - Tombol untuk menambahkan counter baru dengan label otomatis.

## Struktur File

```plaintext
global_state/
|-lib/
   |-global_state.dart # Paket untuk manajemen state global.
lib/
   |- main.dart       # Titik masuk aplikasi.
   |- drag_and_drop/  # Paket untuk fitur drag-and-drop.
```

## Cara Kerja Aplikasi

### Drag-and-Drop
- **Widget Draggable:**
  Setiap counter dibungkus dengan `DragItemWidget` untuk mendukung drag.
- **Drop Region:**
  Area drop menggunakan `DropRegion` dengan fitur:
  - Mengelola data yang di-drop.
  - Memungkinkan pengguna untuk reorder counter.

### Manajemen Counter
- Counter disimpan di dalam `GlobalState` yang bertindak sebagai state manager.
- Operasi seperti increment, decrement, change color, dan remove dilakukan dengan memodifikasi state dan memanggil `notifyListeners()` untuk memperbarui UI.

### Navigasi UI
- Menggunakan `MaterialApp` dengan `Scaffold` untuk menyusun antarmuka utama.
- Semua counter ditampilkan secara dinamis menggunakan widget `Column`.

## Dependensi
Berikut adalah dependensi yang digunakan:

```yaml
dependencies:
  flutter:
    sdk: flutter
  global_state:
    path: global_state
  dotted_border: ^2.1.0
  super_drag_and_drop: ^0.8.24
```

- **`flutter`**: Framework utama.
- **`global_state`**: Paket kustom untuk manajemen state global.
- **`dotted_border`**: Membuat border dengan pola titik-titik.
- **`super_drag_and_drop`**: Mendukung drag-and-drop yang canggih.

## Cara Menjalankan Aplikasi

1. **Clone Repository:**
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

2. **Pasang Dependensi:**
   Jalankan perintah berikut untuk menginstal semua dependensi:
   ```bash
   flutter pub get
   ```

3. **Jalankan Aplikasi:**
   Jalankan perintah berikut untuk menjalankan aplikasi di emulator atau perangkat:
   ```bash
   flutter run
   ```

## Screenshots
TBD

## Kontribusi
Jika Anda ingin berkontribusi, silakan buat pull request atau laporkan masalah pada repository ini.
