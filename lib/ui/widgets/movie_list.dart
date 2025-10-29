import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  // KESALAHAN DIPERBAIKI: Fungsi build hanya memiliki 1 parameter, yaitu BuildContext
  Widget build(BuildContext context) { 

    // DAFTAR PATH ASET LOKAL
    // Gunakan path yang berbeda untuk menampilkan gambar yang berbeda.
    // Pastikan Anda telah mendeklarasikan folder assets/images/ di pubspec.yaml
    final List<String> assetPaths = [
      'assets/images/kucing.jpg', 
      'assets/images/great.jpg',
      'assets/images/great.jpg',
      'assets/images/kucing.jpg',
      'assets/images/kucing.jpg',
      'assets/images/kucing.jpg',
      'assets/images/kucing.jpg',// Ganti dengan nama file gambar yang berbeda
      
    ];

    return Column(
      children: [
        // BAGIAN JUDUL 'TRENDING'
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10), 
          color: const Color.fromARGB(255, 7, 7, 7),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Trending',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text('More >',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ],
          ),
        ),
        
        // BAGIAN LIST FILM HORIZONTAL
        Container(
          height: 150,
          color: const Color.fromARGB(255, 7, 7, 7),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            // ITEMCOUNT DIPERBAIKI: Merujuk ke panjang daftar assetPaths
            itemCount: assetPaths.length, 
            
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 10 : 0, 
                // ITEMCOUNT DIPERBAIKI di sini juga
                right: index == assetPaths.length - 1 ? 10 : 0,
              ),
              child: Container(
                width: 100,
                // Hapus atau ganti warna placeholder jika tidak diperlukan
                color: Colors.grey[300], 
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    fit: BoxFit.cover,
                    // PENGGANTIAN UTAMA: Menggunakan AssetImage
                    image: AssetImage(
                      assetPaths[index], // Mengambil path aset yang berbeda
                    ),
                  ),
                ),
              ),
            ), 
            separatorBuilder: (context, index) => const SizedBox(width: 10), 
          ),
        ),
      ],
    );          
  }
}