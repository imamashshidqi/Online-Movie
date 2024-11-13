import 'package:dart_console/dart_console.dart';
import 'package:interact_cli/interact_cli.dart';
import 'login.dart';
import 'user.dart';

Admin admin = Admin("ADMIN", "admin", "admin123");
Customer newCustomer = Customer('', '', '');
void main() {
  while (true) {
    console.setTextStyle(bold: true);
    console.setBackgroundColor(ConsoleColor.cyan);
    console.writeLine("Halaman Utama!", TextAlignment.center);
    console.resetColorAttributes();

    int pilihan = Select(
        prompt: "Pilih Menu!",
        options: ["Daftar", "Login", "Keluar Program"]).interact();

    switch (pilihan) {
      case 0:
        newCustomer.daftar();
        break;
      case 1:
        login();
        break;
      case 2:
        console.clearScreen();
        print("Terima kasih telah menggunakan aplikasi!");
        return;
      default:
        print("Pilihan tidak valid!");
    }
  }
}
