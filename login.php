<?php
session_start();

// Koneksi ke database
$koneksi = new mysqli("localhost", "root", "", "hospital01");

// Periksa koneksi
if ($koneksi->connect_error) {
    die("Koneksi gagal: " . $koneksi->connect_error);
}

// Inisialisasi variabel error
$error = "";

// Periksa apakah form login telah disubmit
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Ambil nilai username dan password dari form
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Query SQL untuk memeriksa apakah username dan password cocok
    $sql = "SELECT id, username, password FROM users WHERE username = '$username' AND password = '$password'";
    $result = $koneksi->query($sql);

    // Periksa apakah ada baris yang ditemukan
    if ($result->num_rows > 0) {
        // Simpan informasi pengguna ke dalam session
        $row = $result->fetch_assoc();
        $_SESSION["id"] = $row["id"];
        $_SESSION["username"] = $row["username"];

        // Arahkan ke halaman index.php
        header("Location: index.php");
        exit();
    } else {
        // Tampilkan pesan kesalahan jika username atau password tidak cocok
        $error = "Username atau password salah.";
    }
}

// Tutup koneksi
$koneksi->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Form</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Style untuk pesan kesalahan */
    .error-message {
      color: red;
      margin-top: 5px;
      font-size: 14px;
    }

    /* Style untuk latar belakang */
    body {
      background-image: url('assets/img/mm.jpg');
      background-size: cover;
      background-repeat: no-repeat;
    }

    /* Style untuk logo */
    .logo {
      width: 150px;
      height: auto;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
         <center> <img src="assets/img/saude.png" alt="Logo" class="logo" style="width: 100px;"> <br>
          Login Form</center>
        </div>
        <div class="card-body">
          <form action="login.php" method="POST">
            <div class="form-group">
              <label for="username">Username:</label>
              <input type="text" class="form-control" id="username" name="username">
            </div>
            <div class="form-group">
              <label for="password">Password:</label>
              <input type="password" class="form-control" id="password" name="password">
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
          </form>
          <?php if(isset($error_message)): ?>
            <div class="error-message"><?php echo $error_message; ?></div>
          <?php endif; ?>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

