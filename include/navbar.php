<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<nav class="main-header navbar navbar-expand navbar-white navbar-light shadow" style="background: rgb(19,184,194);
background: -moz-linear-gradient(90deg, rgba(19,184,194,1) 6%, rgba(194,19,145,1) 60%, rgba(151,19,194,1) 87%);
background: -webkit-linear-gradient(90deg, rgba(19,184,194,1) 6%, rgba(194,19,145,1) 60%, rgba(151,19,194,1) 87%);
background: linear-gradient(90deg, rgba(19,184,194,1) 6%, rgba(194,19,145,1) 60%, rgba(151,19,194,1) 87%);
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#13b8c2",endColorstr="#9713c2",GradientType=1);">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
<a href="logout.php" class="btn btn-info bg-sm">LOGOUT</a>
      <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">MANAGER USER</button>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header bg-info">
    <h5 id="offcanvasRightLabel">LISTA DADUS USERS</h5>
    
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
<div class="card">
    <div class="card-body">
    <table class="table">
    <thead>
        <tr>
           
            <th scope="col">Id</th>
            <th scope="col">Username</th>
            <th scope="col">Password</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        // Koneksi ke database
        $koneksi = new mysqli("localhost", "root", "", "hospital01");

        // Periksa koneksi
        if ($koneksi->connect_error) {
            die("Koneksi gagal: " . $koneksi->connect_error);
        }

        // Query SQL untuk mengambil data dari tabel users
        $sql = "SELECT id, username, password FROM users";
        $result = $koneksi->query($sql);

        // Periksa apakah ada data yang ditemukan
        if ($result->num_rows > 0) {
            // Loop melalui setiap baris hasil
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["id"] . "</td>";
                echo "<td>" . $row["username"] . "</td>";
                echo "<td>" . $row["password"] . "</td>";
                echo "<td>";
                echo "<a href='edit.php?id=" . $row["id"] . "' class='btn btn-primary btn-sm'>Edit</a> ";
                echo "<a href='hapus.php?id=" . $row["id"] . "' class='btn btn-danger btn-sm'>Hapus</a>";
                echo "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='5'>Tidak ada data</td></tr>";
        }

        // Tutup koneksi
        $koneksi->close();
        ?>
    </tbody>
</table>

    </div>
  
</div>
</div>
</div>
      </li>
    </ul>
  </nav>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>