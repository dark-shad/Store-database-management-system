<html>
    <head>
        
        <title> Super Mart</title>
</head>

<style>
    h1 {
  text-align: center;
  color: #ffffff
}

body {
  font-family: Mukta, sans-serif;
  height: 50vh;
  display: grid;
  justify-content: center;
  align-items: center;
  font-size: 0.9rem;
  background-image: url('store2.jpeg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;}
* { 

  font-family: sans-serif; /* Change your font family */
}

.content-table {
  border-collapse: collapse;
  margin: 25px 0;
  font-size: 0.9em;
  min-width: 400px;
  border-radius: 5px 5px 0 0;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.content-table thead tr {
  background-color: #009879;
  color: #ffffff;
  text-align: left;
  font-weight: bold;
}

.content-table th,
.content-table td {
  padding: 12px 15px;
}

.content-table tbody tr {
  border-bottom: 1px solid #dddddd;
}

.content-table tbody tr {
  background-color: #ffffff;
}

.content-table tbody tr:last-of-type {
  border-bottom: 2px solid #009879;
}

.content-table tbody tr.active-row {
  font-weight: bold;
  color: #009879;
}
</style>

<body>

<h1>All Product List</h1>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
    <table  class="content-table">
        <thread>
        <tr>
            <th>Sr No</th>
            <th>Product</th>
            <th>Quantiity</th>
            <th>Product Type</th>
            <th>Price</th>
       </tr>
</thread>


<?php
include("dbconn.php");
$query = "select * from product";
$data = mysqli_query($dbconn,$query);
$total = mysqli_num_rows($data);

if($total!=0)
{
    while($result=mysqli_fetch_assoc($data))
    {
        echo "
        <tr>
        <td>".$result['product_id']."</td>
        <td>".$result['Product_Name']."</td>
        <td>".$result['Quantity']."</td>
        <td>".$result['Product_Type']."</td>
        <td>".$result['Price']."</td>
        </tr>
        ";
    }
}
else{
   echo "No records found"; 
}
?>

</table>
</body>
</html>