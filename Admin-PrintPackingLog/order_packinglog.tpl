<!doctype html> 
<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
@media all {
  .page-break { display: none; }
}

@media print {
  .page-break { display: block; page-break-before: always; }
}
</style>



<!-- open print dialog automatically -->
<!-- <script type="text/javascript"> -->
<!--  window.onload = function() { window.print(); } -->
<!-- </script> -->
</head>
<body>
<center>

<table class="table table-bordered">
  <col style="width:8%">
  <col style="width:25%">
  <col style="width:35%">
  <col>
  <col style="width:10%">
  <thead>
    <tr>
      <th scope="col">Order #</th>
      <th scope="col">Shipping Address</th>
      <th scope="col">Customer Comments</th>
      <th scope="col">Notes</th>
      <th scope="col">Weight</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach (array_reverse($orders) as $order) { ?>
  <tr>
    <td><?php echo $order['order_id'] ?></td>
    <td><?php echo $order['shipping_address'] ?></td>
      <td><?php echo $order['comment'] ?></td>
      <td></td>
      <td></td>
  </tr>
  <?php } ?>
  </tbody>
</table>

</center>
</body>
</html>