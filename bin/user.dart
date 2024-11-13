import 'package:dart_console/dart_console.dart';
import 'package:interact_cli/interact_cli.dart';
import 'film.dart';

Console console = Console();

class User {
  String nama;
  String username;
  String password;

  User(this.nama, this.username, this.password);

  void login() {}
  void logout() {}
  void lihatFilm() {
    filmFilm.listFilm();
  }

  void updateProfile() {}
}

DataFilm filmFilm = DataFilm();

class Admin extends User {
  Admin(super.nama, super.username, super.password);

  void tambahFilm() {
    console.clearScreen();

    String judul = Input(prompt: "Masukan Judul Film: ").interact();
    String genre = Input(prompt: "Masukan Genre Film: ").interact();
    int tglRilis = int.parse(
        Input(prompt: "Masukan Tanggal Rilis Film (dd): ").interact());
    int durasi =
        int.parse(Input(prompt: "Masukan Durasi Film (menit): ").interact());
    double rating =
        double.parse(Input(prompt: "Masukan Rating Film 1-5: ").interact());

    Film filmBaru = Film(judul, genre, tglRilis, durasi, rating);
    filmFilm.tambahFilm(filmBaru);
  }

  void updateFilm() {
    console.clearScreen();

    int index = int.parse(
        Input(prompt: "Film dengan Index ke berapa yang ingin di Update?: ")
            .interact());
    String judulBaru = Input(prompt: "Masukan Judul Film baru: ").interact();

    filmFilm.updateFilm(index, judulBaru);
  }

  void hapusFilm() {
    console.clearScreen();

    int index = int.parse(
        Input(prompt: "Film dengan Index ke berapa yang ingin di Hapus?: ")
            .interact());

    filmFilm.hapusFilm(index);
  }
}

List<Customer> member = <Customer>[];

class Customer extends User {
  String statusLangganan;

  Customer(super.nama, super.username, super.password,
      {this.statusLangganan = 'Basic'});

  void daftar() {
    console.clearScreen();

    String nama = Input(prompt: "Masukkan Nama Customer: ").interact();
    String username = Input(prompt: "Masukkan Username Customer: ").interact();
    String password = Input(prompt: "Masukkan Password Customer: ").interact();

    Customer customerBaru = Customer(nama, username, password);
    member.add(customerBaru);
    print(
        "$nama berhasil ditambahkan sebagai Customer dengan Status Langganan: $statusLangganan");
  }

  @override
  void updateProfile() {}

  @override
  String toString() {
    return 'Nama: $nama, Username: $username, Password: $password';
  }
}
