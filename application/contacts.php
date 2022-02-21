<?php if ($_GET['act']==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Contact List </h3>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=contact&act=tambah'>Tambahkan Data</a>
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
                        <th>Nama Group</th>
                        <th>Nama Kontak</th>
                        <th>No Telpon</th>
                        <th style='width:40px'>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT a.*, b.Name as groups FROM pbk a JOIN pbk_groups b ON a.GroupID=b.ID ORDER BY a.ID DESC");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    echo "<tr><td>$no</td>
                              <td>$r[groups]</td>
                              <td>$r[Name]</td>
                              <td>$r[Number]</td>
                              <td><center>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='index.php?view=contact&act=edit&id=$r[ID]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='index.php?view=contact&hapus=$r[ID]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>
                          </tr>";
                      $no++;
                      }
                      if (isset($_GET['hapus'])){
                          mysqli_query($GLOBALS["___mysqli_ston"], "DELETE FROM pbk where ID='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=contact';</script>";
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
        $query = mysqli_query($GLOBALS["___mysqli_ston"], "UPDATE pbk SET GroupID = '$_POST[a]', Name = '$_POST[b]', Number = '$_POST[c]' where ID='$_POST[id]'");
        if ($query){
          echo "<script>document.location='index.php?view=contact&sukses';</script>";
        }else{
          echo "<script>document.location='index.php?view=contact&gagal';</script>";
        } 
    }
    $edit = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM pbk where ID='$_GET[id]'");
    $s = mysqli_fetch_array($edit);
    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data Contact</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <input type='hidden' name='id' value='$s[ID]'>
                    <tr><th width='120px' scope='row'>Nama Group</th> <td><select name='a' class='form-control'>
                          <option value='' selected>- Pilih Group -</option>"; 
                          $group = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM pbk_groups");
                          while ($g = mysqli_fetch_array($group)){
                            if ($s['GroupID']==$g['ID']){
                              echo "<option value='$g[ID]' selected>$g[Name]</option>";
                            }else{
                              echo "<option value='$g[ID]'>$g[Name]</option>";
                            }
                          }
                    echo "</select></td></tr>
                    <tr><th scope='row'>Nama Kontak</th> <td><input type='text' class='form-control' name='b' value='$s[Name]'> </td></tr>
                    <tr><th scope='row'>No Telpon</th> <td><input type='number' class='form-control' name='c' value='$s[Number]'> </td></tr>
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
      $query = mysqli_query($GLOBALS["___mysqli_ston"], "INSERT INTO pbk VALUES('','$_POST[a]','$_POST[b]','$_POST[c]')");
      if ($query){
          echo "<script>document.location='index.php?view=contact&sukses';</script>";
      }else{
          echo "<script>document.location='index.php?view=contact&gagal';</script>";
      } 
    }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data Contact</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <tr><th width='120px' scope='row'>Nama Group</th> <td><select name='a' class='form-control'>
                          <option value='' selected>- Pilih Group -</option>"; 
                          $group = mysqli_query($GLOBALS["___mysqli_ston"], "SELECT * FROM pbk_groups");
                          while ($g = mysqli_fetch_array($group)){
                              echo "<option value='$g[ID]'>$g[Name]</option>";
                          }
                    echo "</select></td></tr>
                    <tr><th scope='row'>Nama Kontak</th> <td><input type='text' class='form-control' name='b'> </td></tr>
                    <tr><th scope='row'>No Telpon</th> <td><input type='number' class='form-control' name='c'> </td></tr>
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