<{include 'header.tpl'}>
<br /><br /><br />
<div class="container projects">
	<div class="row">
	<{*
		<{if $category_id==1}>
			<p><div class='span1'></div><img class='span8' src="images/earning.png"/></p>
			<p>&nbsp;</p>
			<div class='span12'><br /><br /><br /></div>
		<{/if}>
	*}>
		<{if $category_id==1}>
			<canvas id="myChart" width="980px" height="253px" class="span12"></canvas>
			<div class='span12'><br /></div>
			<div class='span8'></div><div class='span2'><input type="text" class="form-control" placeholder="Text input" readonly='readonly' value='平均月结余：<{$average}>'\></div>
			<div class='span12'><br /><br /></div>
		<{/if}>
		<{foreach item=info from=$infos}>
		<div class="col-sm-6 col-md-4 ">
			<div class="thumbnail">
				<a href="<{$info.idx_href}>" target="_blank"><img class="lazy" src="<{$info.image_path}>" <{if $category_id!=1}>style="height:396px;"<{/if}> data-src="<{$info.image_path}>"></a>
				<div class="caption">
					<h3> 
						<a href="<{$info.idx_href}>"><{$info.title}><br><small><{$info.descs}></small></a>
					</h3>
				</div>
			</div>
		</div>
		<{/foreach}>
	</div>
</div>
<script src="../resource/Chart.js-master/Chart.js"></script>
<script type="text/javascript" language="javascript">
var data =
{
	labels : <{$labels}>,
	datasets : 
	[
		{
			fillColor : "rgba(220,220,220,0.8)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
			data : <{$income}>
		},
		{
			fillColor : "rgba(68,114,169,0.4)",
			strokeColor : "rgba(151,187,205,1)",
			pointColor : "rgba(151,187,205,1)",
			pointStrokeColor : "#fff",
			data : <{$expend}> 
		}
	]
}
var options = 
{
	//Boolean - Whether we show the scale above or below the chart segments
	scaleOverlay : true,

	//Boolean - If we want to override with a hard coded scale
	scaleOverride : false,

	//** Required if scaleOverride is true **
	//Number - The number of steps in a hard coded scale
	scaleSteps : null,
	//Number - The value jump in the hard coded scale
	scaleStepWidth : null,
	//Number - The centre starting value
	scaleStartValue : null,

	//Boolean - Show line for each value in the scale
	scaleShowLine : true,

	//String - The colour of the scale line
	scaleLineColor : "rgba(0,0,0,.1)",

	//Number - The width of the line - in pixels
	scaleLineWidth : 1,

	//Boolean - whether we should show text labels
	scaleShowLabels : true,

	//Interpolated JS string - can access value
	scaleLabel : "<%=value%>",

	//String - Scale label font declaration for the scale label
	scaleFontFamily : "'Arial'",

	//Number - Scale label font size in pixels	
	scaleFontSize : 12,

	//String - Scale label font weight style	
	scaleFontStyle : "normal",

	//String - Scale label font colour	
	scaleFontColor : "#666",

	//Boolean - Show a backdrop to the scale label
	scaleShowLabelBackdrop : true,

	//String - The colour of the label backdrop	
	scaleBackdropColor : "rgba(255,255,255,0.75)",

	//Number - The backdrop padding above & below the label in pixels
	scaleBackdropPaddingY : 2,

	//Number - The backdrop padding to the side of the label in pixels	
	scaleBackdropPaddingX : 2,

	//Boolean - Stroke a line around each segment in the chart
	segmentShowStroke : true,

	//String - The colour of the stroke on each segement.
	segmentStrokeColor : "#fff",

	//Number - The width of the stroke value in pixels	
	segmentStrokeWidth : 2,

	//Boolean - Whether to animate the chart or not
	animation : true,

	//Number - Amount of animation steps
	animationSteps : 100,

	//String - Animation easing effect.
	animationEasing : "easeOutBounce",

	//Boolean - Whether to animate the rotation of the chart
	animateRotate : true,

	//Boolean - Whether to animate scaling the chart from the centre
	animateScale : false,

	//Function - This will fire when the animation of the chart is complete.
	onAnimationComplete : null
}
var ctx = document.getElementById("myChart").getContext("2d");
var myNewChart = new Chart(ctx).PolarArea(data);
new Chart(ctx).Line(data,options);
</script>
<{include 'footer.tpl'}>
