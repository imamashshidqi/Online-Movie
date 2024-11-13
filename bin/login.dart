import 'package:interact_cli/interact_cli.dart';
import 'dashboard.dart';
import 'user.dart';
import 'sistem_sewa_film_online.dart';

void login() {
  console.clearScreen();

  String username = Input(prompt: "Masukan Username: ").interact();
  String password = Input(prompt: "Masukan Password: ").interact();

  if (username == admin.username && password == admin.password) {
    console.clearScreen();
    print("Login berhasil sebagai Admin.");
    dashboardAdmin(admin);
  } else {
    bool cek = false;
    for (var cekmember in member) {
      if (cekmember.username == username && cekmember.password == password) {
        console.clearScreen();
        print("Login berhasil sebagai Customer.");
        dashboardCustomer(newCustomer);
        cek = true;
        break;
      }
    }
    if (!cek) {
      console.clearScreen();
      print("Username atau Password salah!");
    }
  }
}
