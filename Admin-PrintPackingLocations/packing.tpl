<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/invoice.css" />

<style>
@media print{
    .multiFooter{
       position:relative;
       top:-60px; // this sets the footer -30px from the top of the next 
                  //header/page ... 20px above the bottom of target page
                  //so make sure it is more negative than your footer's height.

       height:20px;//notice that the top position subtracts 
                   //more than the assigned height of the footer
    }
}

th, td {
    border-bottom: 1px solid #ddd;
}

</style>

</head>
<body>

<?php 

function cmp($a, $b)
{
    return strcmp($a["model"], $b["model"]);
}

usort($products, "cmp");


$locations = array();

foreach ($products as $product) { 
  if(!in_array($product['location'],$locations)) {
    $locations[] = $product['location'];
  }  
}

$ignoreStockLocation = 'Default';

?>

<?php foreach ($locations as $location) { if ($location != $ignoreStockLocation) {?>
  <div style="page-break-after: always;">
    <h1>Stock Needed From Location: <?php echo $location; ?></h1>
    <table style="width:100%;">
      <tr>
        <td style="width:25%;"><strong>Model</strong></td>
        <td style="width:40%;"><strong>Product Name</strong></td>
        <td style="width:10%;"><strong>Quantity</strong></td>
        <td style="width:10%;"><strong>Note</strong></td>
      </tr>

    <?php foreach ($products as $product) { ?>
      <?php if ($product['location'] == $location) { ?>

        <tr style="height: 40px;">
          <td style="width:25%;"><?php echo $product['model']; ?><br><small><?php echo $product['variant']; ?></small></td>
          <td style="width:40%;"><?php echo $product['name']; ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>            
          <?php } ?></td>
          <td style="width:10%;"><?php echo $product['quantity']; ?></td>
          <td></td>
        </tr>
      <?php } ?>
    <?php }} ?>
    </table>
  </div>

<?php } ?>



</body>
</html>