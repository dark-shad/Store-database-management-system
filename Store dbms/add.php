<?php{
    include('dbconn.php');
  }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Super Mart</title>
</head>
<style>
    body {
  font-family: Mukta, sans-serif;
  height: 50vh;
  display: grid;
  justify-content: center;
  align-items: center;
  background-image: url('store2.jpeg');
  color: #ffffff;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;}
  * { 

font-family: sans-serif; /* Change your font family */
}
.class{
    font-family: Mukta, sans-serif;
    font-size: 4rem;
    justify-content: center;
    color: #ffffff;
}

.form-conrol {

}
</style>

<body>
<?php
include("dbconn.php");
if(isset($_POST['submit'])){

    $prod_serial=$_POST['prod_serial'];
    $prod_name=$_POST['prod_name'];
    $prod_desc=$_POST['prod_desc'];
    $prod_qty=$_POST['prod_qty'];
    $prod_cost=$_POST['prod_cost'];
    $prod_type=$_POST['prod_type'];
   

    if(empty($prod_serial) ||empty($prod_name) || empty($prod_desc) || empty($prod_qty) || empty($prod_cost)|| empty($prod_type)){    

        if(empty($prod_serial)) {
            echo "<font color='red'>Product name field is empty!</font><br/>";
        }  

        if(empty($prod_type)) {
            echo "<font color='red'>Product name field is empty!</font><br/>";
        }  

        if(empty($prod_name)) {
            echo "<font color='red'>Product name field is empty!</font><br/>";
        }
        
        if(empty($prod_desc)) {
            echo "<font color='red'>Product description field is empty!</font><br/>";
        }

        if(empty($prod_qty)) {
            echo "<font color='red'>Quantity field is empty!</font><br/>";
        }   

        if(empty($prod_cost)) {
            echo "<font color='red'>Product cost field is empty!</font><br/>";
        }   


        if(empty($prod_serial)) {
            echo "<font color='red'>Serial field is empty!</font><br/>";
        }

    } else {    

        $query = "INSERT INTO product (product_id, Product_Name, Product_description,Quantity,Product_Type,Price) 
        VALUES ('$prod_serial','$prod_name','$prod_desc','$prod_qty','$prod_type','$prod_cost')";  

        $result = mysqli_query($dbconn,$query);
            
        if($result){
            
            $prod_name = $_POST['prod_name'];
            $prod_qty = $_POST['prod_qty'];          
        }
        
    }
}

?>



<div>
     <div class="head"><h3>Add Products</h3></div>

          <div>
            <form action="" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="prod_name">Product Name:</label>
                    <input type="text" class="form-control" id="prod_name" name="prod_name" placeholder="Product Name"/>
                    <br></br>
                    <label for="prod_desc">Product Description:</label>
                    <input type="text" class="form-control" id="prod_desc" name="prod_desc" placeholder="Product Description"/>
                    <br></br>
                    <label for="prod_cost">Product Cost:</label>
                    <input type="text" class="form-control" id="prod_price" name="prod_cost" placeholder="Value e.g. 123.4"/>
                    <br></br>
                    <label for="prod_qty">Quantity:</label>
                    <input type="text" class="form-control" id="prod_qty" name="prod_qty" placeholder="Value e.g. 123"/>
                    <br></br>
                    <label for="prod_qty">Product Type:</label>
                    <input type="text" class="form-control" id="prod_qty" name="prod_type" placeholder="Value e.g. type"/>
                    <br></br>
                    <label for="prod_serial">Serial:</label>
                    <input type="text" class="form-control" id="prod_serial" name="prod_serial" placeholder="Value e.g. 1234"/>


                    </div>

                    
                </div>
                <br>

                <div>
                    <button type="submit" class="btn btn-success btn-round" id="submit" name="submit">
                    <i class="now-ui-icons ui-1_check"></i> Add Product
                    </button> 
                </div>
            </form>
          </div>
        </div> 
        <br> 
    </div>
</div>
</div>
</div>
</body>

</script>

</html>