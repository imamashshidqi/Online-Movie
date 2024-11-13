import 'package:dart_console/dart_console.dart';
import 'package:interact_cli/interact_cli.dart';

import 'user.dart';

void dashboardAdmin(Admin admin) {
  while (true) {
    console.clearScreen();
    console.setTextStyle(bold: true);
    console.setBackgroundColor(ConsoleColor.red);
    console.writeLine("Halaman ADMIN!", TextAlignment.center);
    console.resetColorAttributes();

    int pilihan = Select(prompt: "Pilih Menu!", options: [
      "Tambah Film",
      "Lihat Daftar Film",
      "Update Film",
      "Hapus Film",
      "Logout"
    ]).interact();
    switch (pilihan) {
      case 0:
        admin.tambahFilm();
        break;
      case 1:
        admin.lihatFilm();
        break;
      case 2:
        admin.updateFilm();
        break;
      case 3:
        admin.hapusFilm();
        break;
      case 4:
        console.clearScreen();
        print("Admin Logout");
        return;
      default:
        print("Pilihan tidak valid!");
    }
  }
}

void dashboardCustomer(Customer customer) {
  while (true) {
    console.setTextStyle(bold: true);
    console.setBackgroundColor(ConsoleColor.cyan);
    console.writeLine("Halaman Customer!", TextAlignment.center);
    console.resetColorAttributes();

    int pilihan = Select(
        prompt: "Pilih Menu!",
        options: ["Lihat Daftar Film", "Update Profile", "Logout"]).interact();

    switch (pilihan) {
      case 0:
        customer.lihatFilm();
        break;
      case 1:
        customer.updateProfile();
        break;
      case 2:
        console.clearScreen();
        print("Customer Logout");
        return;
      default:
        print("Pilihan tidak valid!");
    }
  }
}
