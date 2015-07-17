<?php include_once("../connection.php"); ?>
<?php include_once("include/header.php");?>
<?php
  if(!isset($_SESSION['username'])){
    header("location:index.php?msg=auth");
  }
?>
<a href="#"><strong><i class="glyphicon glyphicon-file"></i> YOUth mind Assessment</strong></a>
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
              <th>Gender</th>
              <th>Mobile</th>
              <th>Email</th>
              <th>Current Location</th>
              <th>Feeling Lonely</th>
              <th>Talk to Counsellor</th>
              <th>Thoughts</th>
              <th>Submission Date</th>
          </tr>
      </thead>
      <tbody>
<?php
  $query = "SELECT * FROM tbl_youth_mind_assessment as Ma JOIN tbl_dzongkhags as D ON Ma.dzongkhag_id=D.dzongkhag_id";
  $result = mysqli_query($link, $query);
  $i=1;

  while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
  ?>
          <tr>
             <td><?php echo $i; ?></td>
              <td><?php echo $row['name'];?></td>
              <td><?php echo ($row['gender'] == 'M') ? 'Male' : 'Female'; ?></td>
              <td><?php echo $row['mobile'];?></td>
              <td><?php echo $row['email'];?></td>
              <td><?php echo $row['dzongkhag_area'].', '.$row['dzongkhag_name']?></td>
              <td><?php echo ($row['feeling'] == 'Y') ? 'Yes' : 'No'; ?></td> 
              <td><?php echo ($row['talk_counsellor'] == 'Y') ? 'Yes' : 'No'; ?></td> 
              <td><a href="#" role="button" data-trigger="focus" data-placement="top" class="btn btn-warning popovers-to-be-activated" title="" data-content="<?php echo $row['your_thoughts'];?>"><i class="fa fa-file-text"></i> View</a></td>
              <td><?php echo date("F jS, Y",strtotime($row['assessment_date'])); ?></td>                 
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
