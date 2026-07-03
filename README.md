Berikut README yang sudah diterjemahkan ke Bahasa Indonesia:

---

# Contoh FSM Godot
Demonstrasi sederhana *finite state machine* (FSM) yang diimplementasikan di Godot (GDScript) dengan fitur pemain dan NPC musuh. Musuh merespons kedekatan pemain dengan berpindah antara tiga perilaku: **Diam (mengembara)**, **Mengikuti**, dan **Menyerang**.

---
**Demo Langsung**: [Coba di sini](https://den14ditya.itch.io/fsm-with-godot)

---

## Daftar Isi
- [Gambaran Umum](#gambaran-umum)
- [Apa itu Finite State Machine (FSM)?](#apa-itu-finite-state-machine-fsm)
- [Deskripsi Contoh](#deskripsi-contoh)
  - [Status](#status)
  - [Transisi](#transisi)
- [Cara Menjalankan](#cara-menjalankan)
- [Mengembangkan Contoh](#mengembangkan-contoh)
- [Lisensi](#lisensi)

---

## Gambaran Umum
Proyek ini mengilustrasikan cara menerapkan pola desain FSM di Godot. Proyek ini menggunakan pemain dan musuh, di mana musuh mengubah perilakunya berdasarkan jarak pemain. Pendekatan FSM menjaga logika tetap bersih dan modular — ideal untuk AI game dan kontrol perilaku.

## Apa itu Finite State Machine (FSM)?
**Finite State Machine (FSM)** adalah model komputasi yang digunakan untuk merancang sistem dengan sejumlah status tertentu yang terbatas. Setiap status mewakili perilaku yang berbeda, dan sistem berpindah antar status berdasarkan kondisi atau peristiwa. FSM adalah alat yang ampuh untuk mengelola logika AI, alur UI, animasi, dan lainnya karena kejelasan dan kemudahan prediksinya.

## Deskripsi Contoh
Contoh ini menggunakan FSM untuk mengelola perilaku musuh relatif terhadap pemain.

### Status
- **Diam (Mengembara)**:
  Musuh bergerak secara acak di dalam areanya, mensimulasikan perilaku patroli/mengembara saat pemain tidak berada di dekatnya.

- **Mengikuti**:
  Dipicu saat pemain masuk dalam radius deteksi. Musuh mulai bergerak langsung menuju pemain.

- **Menyerang**:
  Dipicu saat pemain sangat dekat. Musuh memulai urutan serangan.

### Transisi
1. **Diam → Mengikuti**
   - Kondisi: Pemain memasuki jangkauan deteksi (contoh: `jarak_pemain < radius_deteksi`).

2. **Mengikuti → Menyerang**
   - Kondisi: Pemain berada dalam jangkauan serangan (contoh: `jarak_pemain < radius_serangan`).

3. **Menyerang → Mengikuti**
   - Kondisi: Pemain keluar dari jangkauan serangan tetapi masih dalam jangkauan deteksi.
   - Musuh berhenti menyerang dan melanjutkan mengikuti.

4. **Mengikuti → Diam**
   - Kondisi: Pemain keluar sepenuhnya dari jangkauan deteksi.
   - Musuh kembali ke pengembaraan acak.

Diagram visual:

![Diagram FSM](diagram.svg)

---

## Cara Menjalankan
1. Clone repositori:
   ```bash
   git clone https://github.com/Den1Adtya/FSM-With-GODOT.git
   ```
2. Buka proyek di Godot (3.x atau 4.x, tergantung pengaturan kamu).
3. Muat scene `Level.tscn`.
4. Jalankan scene dan amati:
   - Musuh mengembara secara acak saat diam.
   - Mendekati musuh membuatnya mengikuti.
   - Sangat dekat dengan musuh membuatnya beralih ke mode menyerang.
   - Mundur membuat musuh kembali mengembara.

## Mengembangkan Contoh
- **Tambah lebih banyak status**: contoh `Patroli`, `Melarikan Diri`, `Mencari`.
- **Animasi per status**: Siklus berjalan saat diam, animasi serangan, dll.
- **Perilaku mengembara yang diacak**: Ubah kecepatan, jeda, atau arah acak.
- **Banyak musuh**: Terapkan logika FSM yang sama pada banyak NPC.
