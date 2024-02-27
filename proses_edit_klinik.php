<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Pastikan ID MUNICIPIU sudah diterima
    if (isset($_POST["editIdMunicipiu"])) {
        $idMunicipiu = $_POST["editIdMunicipiu"];
        $naranMunicipiu = $_POST["editNaranMunicipiu"];
        $obs = $_POST["editObs"];
        // Koneksi ke database (sesuaikan dengan informasi koneksi yang sesuai)
        $koneksi = new mysqli("localhost", "root", "", "hospital01");
        // Periksa koneksi
        if ($koneksi->connect_error) {
            die("Koneksi gagal: " . $koneksi->connect_error);
        }
        // Query SQL untuk memperbarui data berdasarkan ID MUNICIPIU
        $sql = "UPDATE t_klinika SET naran_klinika = '$naranMunicipiu', obs = '$obs' WHERE id_klinika = $idMunicipiu";
        // Eksekusi query
        if ($koneksi->query($sql) === TRUE) {
            // Redirect kembali ke halaman sebelumnya dengan pesan sukses
            header("Location: Dadus_klinik.php?pesan=Data berhasil diperbarui");
        } else {
            // Redirect kembali ke halaman sebelumnya dengan pesan kesalahan
            header("Location: Dadus_klinik.php?pesan=Gagal memperbarui data: " . $koneksi->error);
        }

        // Tutup koneksi ke database
        $koneksi->close();
    } else {
        echo "ID KLINIKA tidak valid.";
    }
} else {
    echo "Akses tidak valid.";
}
?>
