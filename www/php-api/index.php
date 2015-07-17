<?php include_once("include/header.php");?>
<?php include_once("connection.php"); ?>
<div class="table-responsive">
  <table class="table table-bordered">
      <thead>
          <tr>
              <th>Sl.</th>
              <th>Name</th>
              <th>Age</th>
              <th>Mobile</th>
              <th>Email Address</th>
              <th>Counselling Details</th>
          </tr>
      </thead>
      <tbody>
<?php
  $query = "SELECT * FROM tbl_counselling_registration";
  $result = mysqli_query($link, $query);
  $i=1;

  while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
  ?>
          <tr>
             <td><?php echo $i; ?></td>
              <td><?php echo $row['applicant_name']?></td>
              <td><?php echo $row['applicant_age']?></td>
              <td><?php echo $row['applicant_mobile']?></td> 
              <td><?php echo $row['applicant_email']?></td> 
              <td><?php echo $row['counselling_details'];?></td>                          
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