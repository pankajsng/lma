<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head> 
	<spring:url value="/resources/dist/css/bootstrap.css" var="crunchifyCSS" />
	<spring:url value="/resources/dist/js/jquery-1.9.1.min.js" var="crunchifyJS" />	
	<link href="${crunchifyCSS}" rel="stylesheet" type = "text/css" />
	<script src="${crunchifyJS}" type="text/javascript"></script>
	
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Pie Chart</title>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			var options = {
				chart: {
	                renderTo: 'container',
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: 'Social Profile and Product statistics'
	            },
	            tooltip: {
	                formatter: function() {
	                    return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
	                }
	            },
	            plotOptions: {
	                pie: {
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: true,
	                        color: '#000000',
	                        connectorColor: '#000000',
	                        formatter: function() {
	                            return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
	                        }
	                    }
	                }
	            },
	            series: [{
	                type: 'pie',
	                name: 'Browser share',
	                data: []
	            }]
	        }
	        
	        $.getJSON("http://localhost:8080/lma/getJSONValues", function(json) {
	        	console.log('json : ' + json);
				options.series[0].data = json;
	        	chart = new Highcharts.Chart(options);
	        });
	        
	        
	        
      	});   
		</script>
		<script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/modules/exporting.js"></script>	
</head>

<body>

<div class="container">
    
<ul class="nav nav-pills pull-right">
  <li role="presentation" class="active"><a href="#">Home</a></li>
  <li role="presentation"><a href="#">Profile</a></li>
  <li role="presentation"><a href="#">Messages</a></li>
</ul>

<div class="row">
  <div class="col-md-10 col-md-push-2">
  	<h4>Twitter Analytics / Pie Chart</p> 
	</h4>
	<div id="showStatistics"></div>
	<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
	</div>
  <div class="col-md-2 col-md-pull-10">
	  <ul class="nav nav-pills nav-stacked">
		  <li role="presentation" class="active"><a href="#">Product Catalogue</a></li>
		  <li role="presentation" class="pull-right"><a href="create_product.php">Create a Product</a></li>
		  <li role="presentation" class="pull-right"><a href="all_products.php">All Products</a></li>
	  </ul>
  </div>
    <div class="col-md-2 col-md-pull-10">
	  <ul class="nav nav-pills nav-stacked">
		  <li role="presentation" class="active"><a href="#">Twitter Analytics</a></li>
		  <li role="presentation" class="pull-right"><a href="http://localhost:8080/lma/showpiechart">Pie Chart</a></li>
		  <li role="presentation" class="pull-right"><a href="http://localhost:8080/lma/showcolumnchart">Bar Chart</a></li>	
	  </ul>
  </div>
</div>
</div>
<div id="show_user_sec" class="user_section">

</div>
<div id="update_user_sec" class="user_section">

</div> 	
	<spring:url value="/resources/dist/js/bootstrap.js" var="bootstrapJS" />	
	<script src="${bootstrapJS}" type="text/javascript"></script> 
	<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
</body>
</html>