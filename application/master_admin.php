<?php if ($_GET['act']==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Administrator </h3>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=admin&act=tambah'>Tambahkan Data Admin</a>
                </div><!-- /.box-header -->
                <div class="box-body">
                <?php 
                  if (isset($_GET['sukses'])){
                      echo "<div class='alert alert-success alert-dismissible fade in' role='alert'> 
                          <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                          <span aria-hidden='true'>×</span></button> <strong>Sukses!</strong> - Data telah Berhasil Di Proses,..
                          </div>";
                  }elseif(isset($_GET['gagal'])){
                      echo "<div class='alert alert-danger alert-dismissible fade in' role='alert'> 
                          <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                          <span aria-hidden='true'>×</span></button> <strong>Gagal!</strong> - Data tidak Di Proses, terjadi kesalahan dengan data..
                          </div>";
                  }
                ?>
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th style='width:30px'>No</th>
                        <th>Username</th>
                        <th>Nama Lengkap</th>
                        <th>No Telpon</th>
                        <th>Level</th>
                        <th style='width:70px'>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM users ORDER BY id_user DESC");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    echo "<tr><td>$no</td>
                              <td>$r[username]</td>
                              <td>$r[nama_lengkap]</td>
                              <td>$r[no_telpon]</td>
                              <td>$r[level]</td>
                              <td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=admin&act=edit&id=$r[id_user]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=admin&hapus=$r[id_user]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET['hapus'])){
                          mysqli_query($GLOBALS["___mysqli_ston"], "DELETE FROM users where id_user='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=admin';</script>";
                      }

                  ?>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
<?php 
}elseif($_GET['act']=='edit'){
    if (isset($_POST['update'])){
      $data = md5($_POST['b']);
      $passs=hash("sha512",$data);
      if (trim($_POST['b'])==''){
        $query = mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE users SET username = '$_POST[a]',
                                         nama_lengkap = '$_POST[c]',
                                         no_telpon = '$_POST[d]' where id_user='$_POST[id]'");
      }else{
        $query = mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE users SET username = '$_POST[a]',
                                         password = '$passs',
                                         nama_lengkap = '$_POST[c]',
                                         no_telpon = '$_POST[d]' where id_user='$_POST[id]'");
      }
      if ($query){
            echo "<script>document.location='index.php?view=admin&sukses';</script>";
      }else{
            echo "<script>document.location='index.php?view=admin&gagal';</script>";
      }

    }
    $edit = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM users a where a.id_user='$_GET[id]'");
    $s = mysqli_fetch_array($edit);
    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data Administrator</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <input type='hidden' name='id' value='$s[id_user]'>
                    <tr><th width='120px' scope='row'>Username</th> <td><input type='text' class='form-control' name='a' value='$s[username]'> </td></tr>
                    <tr><th scope='row'>Password</th>               <td><input type='text' class='form-control' name='b' placeholder='Kosongkan saja Jika Password tidak diganti,...'></td></tr>
                    <tr><th scope='row'>Nama Lengkap</th>           <td><input type='text' class='form-control' name='c' value='$s[nama_lengkap]'></td></tr>
                    <tr><th scope='row'>No Telpon</th>              <td><input type='text' class='form-control' name='d' value='$s[no_telpon]'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='update' class='btn btn-info'>Update</button>
                    <a href='index.php?view=guru'><button class='btn btn-default pull-right'>Cancel</button></a>
                    
                  </div>
              </form>
            </div>";
}elseif($_GET['act']=='tambah'){
    if (isset($_POST['tambah'])){
      $data = md5($_POST['b']);
      $passs=hash("sha512",$data);
      $query = mysqli_query($GLOBALS["___mysqli_ston"], "INSERT INTO users VALUES('','$_POST[a]','$passs','$_POST[c]','$_POST[d]','superuser')");
      if ($query){
            echo "<script>document.location='index.php?view=admin&sukses';</script>";
      }else{
            echo "<script>document.location='index.php?view=admin&gagal';</script>";
      }
    }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data Administrator</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <tr><th width='120px' scope='row'>Username</th> <td><input type='text' class='form-control' name='a'> </td></tr>
                    <tr><th scope='row'>Password</th>               <td><input type='text' class='form-control' name='b'></td></tr>
                    <tr><th scope='row'>Nama Lengkap</th>           <td><input type='text' class='form-control' name='c'></td></tr>
                    <tr><th scope='row'>No Telpon</th>              <td><input type='text' class='form-control' name='d' value='$s[no_telpon]'></td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>
                    <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                    <a href='index.php?view=guru'><button class='btn btn-default pull-right'>Cancel</button></a>
                    
                  </div>
              </form>
            </div>";
}
?>