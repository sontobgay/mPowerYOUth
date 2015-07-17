<?php include_once("../connection.php"); ?>
<?php include_once("include/header.php");?>
<?php
  if(!isset($_SESSION['username'])){
    header("location:index.php?msg=auth");
  }
?>
<a href="#"><strong><i class="glyphicon glyphicon-file"></i> YOUth Feedbacks</strong></a>
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
              <th>Mobile</th>
              <th>Email Address</th>
              <th>Feedback</th>
              <th>Submission Date</th>
          </tr>
      </thead>
      <tbody>
<?php
  $query = "SELECT * FROM tbl_youth_feedbacks";
  $result = mysqli_query($link, $query);
  $i=1;
  while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
  ?>
          <tr>
             <td><?php echo $i; ?></td>
              <td><?php echo $row['youth_name']?></td>
              <td><?php echo $row['youth_phone']?></td> 
              <td><?php echo $row['youth_email']?></td> 
              <td><a href="#" role="button" data-trigger="focus" data-placement="top" class="btn btn-warning popovers-to-be-activated" title="" data-content="<?php echo $row['feedback_details'];?>"><i class="fa fa-file-text"></i> View</a></td>
              <td><?php echo date("F jS, Y",strtotime($row['feedback_date'])); ?></td>                        
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
