<?php
    echo "<form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
            <div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Kirimkan Boom Pesan Singkat (SMS)</h3>
                </div>
              <div class='box-body'>";
              		if (isset($_POST['kirim'])){
                    $m = mysqli_fetch_array(mysqli_query($GLOBALS["___mysqli_ston"], "SELECT ID FROM phones ORDER BY ID DESC LIMIT 1"));
                    for ($x=0; $x<=$_POST['jml']; $x++) {  
        						  $hasil = mysqli_query($GLOBALS["___mysqli_ston"], "INSERT INTO outbox (DestinationNumber, SenderID, TextDecoded, CreatorID) VALUES ('$_POST[nohp]', '$m[ID]', '$_POST[pesan]', 'Gammu 1.28.90')");
        						}

        							echo "<div class='alert alert-success alert-dismissible fade in' role='alert'> 
        									<button type='button' class='close' data-dismiss='alert' aria-label='Close'>
        									<span aria-hidden='true'>×</span></button> <strong>Success!</strong> - $_POST[jml] Pesan SMS Terkirim ke $_POST[nohp],...
        								  </div>";
        					}
                echo "<table class='table table-condensed table-bordered'>
                  <tbody>
                  	<tr><th width=120px scope='row'>No Telpon</th>  <td><input type='number' class='form-control' name='nohp' style='width:30%' value='$_GET[nohp]' placeholder='Input No Telpon...' required></td></tr>
                    <tr><th scope='row'>Isi Pesan</th>           	<td><textarea rows='6' class='form-control' name='pesan' placeholder='Tuliskan Pesan anda (Max 160 Karakter)...' onKeyDown=\"textCounter(this.form.pesan,this.form.countDisplay);\" onKeyUp=\"textCounter(this.form.pesan,this.form.countDisplay);\" required></textarea>
                    <input type='number' name='countDisplay' size='3' maxlength='3' value='160' style='width:10%; text-align:center; border:1px solid #cecece; margin-top:4px' readonly> Sisa Karakter</td></tr>
                    <tr><th width=120px scope='row'>Jumlah</th>  <td><input type='number' class='form-control' name='jml' style='width:30%' placeholder='Jumlah Kirim..' required></td></tr>
                  </tbody>
                  </table>
              </div>

              <div class='box-footer'>
                    <button type='submit' name='kirim' class='btn btn-info'>Kirimkan Pesan</button>
                    <button type='reset' class='btn btn-default pull-right'>Reset</button>
              </div>
            </div>
          </form>";