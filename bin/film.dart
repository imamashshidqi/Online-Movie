import 'dart:io';

import 'package:dart_console/dart_console.dart';

Console console = Console();

class Film {
  String judul;
  String genre;
  int tglRilis;
  int durasi;
  double rating;

  Film(this.judul, this.genre, this.tglRilis, this.durasi, this.rating);
}

List<Film> filmFilm = <Film>[];

class DataFilm {
  void tambahFilm(Film film) {
    console.clearScreen();
    filmFilm.add(film);
    print("Film ${film.judul} berhasil ditambahkan.");
  }

  void listFilm() {
    console.clearScreen();
    Table tabel = Table()
      ..insertColumn(header: "Judul", alignment: TextAlignment.center)
      ..insertColumn(header: "Genre", alignment: TextAlignment.center)
      ..insertColumn(header: "Tanggal Rilis", alignment: TextAlignment.center)
      ..insertColumn(header: "Durasi", alignment: TextAlignment.center)
      ..insertColumn(header: "Rating", alignment: TextAlignment.center)
      ..headerStyle = FontStyle.bold
      ..headerColor = ConsoleColor.green
      ..borderStyle = BorderStyle.square
      ..borderColor = ConsoleColor.cyan
      ..borderType = BorderType.grid;

    if (filmFilm.isEmpty) {
      tabel.insertRow(["-", "-", "-", "-", "-"]);
    } else {
      for (Film film in filmFilm) {
        tabel.insertRow(
            [film.judul, film.genre, film.tglRilis, film.durasi, film.rating]);
      }
    }

    print(tabel);

    stdout.write("Lanjut? (Enter)");
    stdin.readLineSync();
  }

  void updateFilm(int index, String judulBaru) {
    if (index < 0 || index >= filmFilm.length) {
      print("Index tidak valid");
    } else {
      filmFilm[index].judul = judulBaru;
      print("Buku index ke-$index telah diperbaharui");
    }
  }

  void hapusFilm(int index) {
    if (index < 0 || index >= filmFilm.length) {
      print("Index tidak Valid");
    } else {
      String judul = filmFilm[index].judul;
      filmFilm.removeAt(index);
      print("Film $judul telah di Hapus!");
    }
  }
}
