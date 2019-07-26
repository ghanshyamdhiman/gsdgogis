<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>

<script type="text/javascript">
//<!--
	document.oncontextmenu = new Function("return false");
//-->
</script>
            

        <script>
          cart.add = function(product_id, quantity) {
            $.ajax({
              url: 'index.php?route=checkout/cart/add',
              type: 'post',
              data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
              dataType: 'json',
              beforeSend: function() {
                $('#cart > button').button('loading');
              },
              success: function(json) {
                $('.alert, .text-danger').remove();

                $('#cart > button').button('reset');

                if (json['redirect']) {
                  location = json['redirect'];
                }

                if (json['success']) {
                  $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                  $('#cart-total').html(json['total']);

                  location = '<?php global $url; echo $url->link('checkout/cart'); ?>';
                }
              }
            });
          };
        </script>
      
<body class="<?php echo $class; ?>">
<nav id="top" style="background-color:#B9F8D0; border-bottom:1px solid black; padding:0px">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div class="row">
     <h4 style="font-size:1.4em">
      <div class="col-sm-6" >
         For Bulk Orders Please Contact : <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span>
      </div>
      
       <div class="col-sm-3" style="color:red">
         Website Under Construction
      </div>
       
       <div class="col-sm-3">      
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
         <?php if ($logged) { ?>
          <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
          <?php } else { ?>
        <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
        <li> / </li>
        <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>            
         <?php } ?>
      </ul>
    </div>
  </div>
  </h4>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-3">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-6">
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>      
       <h3 style="text-align:left; vertical-align:text-bottom; color:green; font-weight:bold"> Byte Byte Mein Delight...!</h3>
      </div>
      <div class="col-sm-3">
      <?php echo $search; ?>
      <div style="background-color:marron; font-size:1.4em">
      <?php echo $cart; ?>
      </div>
      </div>
     </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
      <li><a href="http://gogis.in/index.php?route=common/home" title="HOME"><span class="hidden-xs hidden-sm hidden-md" >HOME</span></a></li>
       <li><a href="http://gogis.in/index.php?route=information/information&information_id=4" title="ABOUT US"><span class="hidden-xs hidden-sm hidden-md">ABOUT US</span></a></li>
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
         <li><a href="http://gogis.in/index.php?route=information/information&information_id=9" title="MENU"><span class="hidden-xs hidden-sm hidden-md">MENU</span></a></li>
         <li><a href="http://gogis.in/index.php?route=information/contact" title="CONTACT US"><span class="hidden-xs hidden-sm hidden-md">CONTACT US</span></a></li>
         <!--
          <li><a href="http://gogis.in/index.php?route=information/information&information_id=10" title="STORE LOCATOR"><span class="hidden-xs hidden-sm hidden-md">STORE LOCATOR</span></a></li>
          -->
        
        </ul>
                
    </div>
  </nav>
</div>
<?php } ?>