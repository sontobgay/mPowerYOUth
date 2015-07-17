<?php include_once("../connection.php"); ?>
<?php include_once("include/header.php");?>
<?php
  if(!isset($_SESSION['username'])){
    header("location:index.php?msg=auth");
  }
?>
<a href="#"><strong><i class="glyphicon glyphicon-file"></i> Registered for Counselling</strong></a>
<hr>
<div class="row">
<!-- center left-->
<div class="col-md-12">
<div class="table-responsive">
  <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
      <thead>
          <tr>
              <th>Sl.</th>
              <th>Name</th>
      	      <th>Sex</th>
              <th>Age</th>
              <th>Mobile</th>
              <th>Email Address</th>
              <th>Location</th>
              <th>Issue</th>
              <th>Counselling Details</th>
              <th>Submission date</th>
          </tr>
      </thead>
      <tbody>
<?php
  $query = "SELECT * FROM tbl_counselling_registration as C JOIN tbl_dzongkhags as D ON C.dzongkhag_id=D.dzongkhag_id JOIN tbl_counselling_issues as I ON C.issue_id=I.issue_id";
  $result = mysqli_query($link, $query);
  $i=1;

  while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
  ?>
          <tr>
             <td><?php echo $i; ?></td>
              <td><?php echo $row['applicant_name']?></td>
              <td><?php echo ($row['gender'] == 'M') ? '<i class="fa fa-male" id="gender" data-toggle="tooltip" title="Male"></i>' : '<i class="fa fa-female" id="gender" data-toggle="tooltip" title="Female"></i>';?></td> 
       	      <td><?php echo $row['applicant_age']?></td>
              <td><?php echo $row['applicant_mobile']?></td> 
              <td><?php echo $row['applicant_email']?></td> 
              <td><?php echo $row['dzongkhag_area'].', '.$row['dzongkhag_name']?></td>
              <td><?php echo $row['issue_name'];?></td>
              <td><a href="#" role="button" data-trigger="focus" data-placement="top" class="btn btn-warning popovers-to-be-activated" title="" data-content="<?php echo $row['counselling_details'];?>"><i class="fa fa-file-text"></i> View</a></td>
              <td><?php echo date("F jS, Y",strtotime($row['date_registered'])); ?></td>
          </tr>
<?php
  $i++;
  }
  @mysqli_close($link);
?>
      </tbody>
  </table>
</div>
<?php include_once("include/footer.php");?>
