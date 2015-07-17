<?php
  include_once '../connection.php';
  // Define $username and $password 

  if(isset($_POST['loginname']) && !empty($_POST['loginname'])){

  $username = mysqli_real_escape_string($link, $_POST['loginname']);
  $password = mysqli_real_escape_string($link, $_POST['password']);

  $pwd = md5($salt . $password);

  $result = mysqli_query($link, "SELECT * FROM tbl_login WHERE username='$username' and password='$pwd'");

  $count = mysqli_num_rows($result);

  // If result matched $username and $password, table row must be 1 row

  if($count == 1){
    $_SESSION['username'] = 'username';
    $_SESSION['password'] = 'password';
      header("location:feedback.php");
      exit;
  }
  else {
    header("location:index.php?msg=error");
    exit;
  }
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>m-Power YOUth</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="description" content="Bootstrap Login Form example snippet. An example HTML, JavaScript and CSS code for Bootstrap." />
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link rel="apple-touch-icon" href="/bootstrap/img/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="/bootstrap/img/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="/bootstrap/img/apple-touch-icon-114x114.png">
        <!-- CSS code from Bootply.com editor -->
        <style type="text/css">
            .modal-footer {   border-top: 0px; }
        </style>
    </head>
    <body>
<div class="container" style="margin-top:40px">
    <div class="row">
      <div class="col-sm-6 col-md-4 col-md-offset-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <strong> mPower YOUth Application</strong>
          </div>
          <div class="panel-body">
            <form role="form" action="<?php echo $SERVER['PHP_SELF'];?>" method="POST">
              <fieldset>
                <div class="row">
                  <div class="center-block">
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-12 col-md-10  col-md-offset-1 ">
                    <div class="form-group">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="glyphicon glyphicon-user"></i>
                        </span> 
                        <input class="form-control" placeholder="Username" name="loginname" type="text" autofocus>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="glyphicon glyphicon-lock"></i>
                        </span>
                        <input class="form-control" placeholder="Password" name="password" type="password" value="">
                      </div>
                    </div>
                    <div class="form-group">
                      <input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign in">
                    </div>
                  </div>
                </div>
              </fieldset>
            </form>
          </div>
          <?php if(isset($_GET['msg']) && ($_GET['msg'] == 'error')){?>
            <div class="panel-footer">
            <strong class="text-danger"><i class="glyphicon glyphicon-exclamation-sign"></i> Invalid Username / Password</strong>
          </div>
         <?php } else if(isset($_GET['msg']) && ($_GET['msg'] == 'auth')){?>
            <div class="panel-footer">
            <strong class="text-danger"><i class="glyphicon glyphicon-exclamation-sign"></i> You are unauthorized to view this page!</strong>
          </div>
         <?php } ?>
        </div>
      </div>
    </div>
  </div
    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type='text/javascript' src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
  </body>
</html>