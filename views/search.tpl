<{include 'header.tpl'}>
<link href="../resource/bootstrap/css/site.css" rel="stylesheet">
<script src="../resource/bootstrap/js/jquery.js"></script>
<script language="javascript">
function js_label(label_id, label_opt)
{
	var label_json = $('#'+label_opt+'_json').html();
	$.post(
		'search.php',
		{label_json:label_json, opt_type:'change', label_id:label_id},
		function(data) { $('#'+label_opt+'_json').html(data); }
	);
	var label_icon = $('#label_icon_'+label_id).html();
	$.post(
	'search.php',
	{label_icon:label_icon, opt_type:'icon'},
	function (data) { $('#label_icon_'+label_id).html(data); }
	);
}

function js_commit(opt_type)
{
	var search_text = document.getElementById('search').value;
	var tags_json = $('#tags_json').html();
	var dates_json = $('#dates_json').html();
	location = '/html/debin.php?category=search&dates='+dates_json+'&tags='+tags_json+'&search='+search_text+'&opt_type='+opt_type;
}
</script>

<div id="myCarousel" class="carousel slide">
	<div class="carousel-inner">
		<div class="item active masthead">
			<div class="container">
				<div class="carousel-caption">
					<h1>龍潭齋</h1>
					<br/>
					<p>
					<form class="navbar-form bs3-link" action="javascript:void(0)"; role="search">
						<div class="form-group">
							<input type="text" style="width:400px;height:40px" class="form-control" id="search" placeholder="Search" value="<{$search_text}>">
						</div>&nbsp;&nbsp;
						<button type="submit" class="btn btn-default" style="height:40px" onclick="js_commit('title')">标&nbsp;&nbsp;题</button>
						<button type="submit" class="btn btn-default" style="height:40px" onclick="js_commit('contents')">内&nbsp;&nbsp;容</button>
						<button type="submit" class="btn btn-default" style="height:40px" onclick="js_commit('mood')">心&nbsp;&nbsp;情</button>
					</form>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container bs-docs-container" style="background-color:rgba(0,0,0,0)">
	<div class="row">
		<div class="span6">
			<div id="tags_json" name="tags_json"> 
				<input type="hidden" value='$[$$]$'/>
			</div>
			<br />
			<div class="alert">
				<div style="scrollbar-face-color: #889b9f;  scrollbar-highlight-color: #c3d6da; overflow: auto;scrollbar-shadow-color: #3d5054; scrollbar-3dlight-color: #3d5054; scrollbar-arrow-color: #ffd6da;scrollbar-darkshadow-color: #85989c; height: 500px">
					<table class="table table-hover" style="background-color:rgba(255, 255, 255, 0)" frame=void border=0 cellpadding=0 cellspacing=0 bordercolor=rgba(0,0,0,0)>
						<{foreach item=info from=$tags name=tag}>
						<{if $smarty.foreach.tag.index % 3 == 0}>
						<tr>
						<{/if}>
							<td>
								<div id="label_icon_<{$info.tag_id}>">
									<a href="javascript:void(0);" onclick='js_label(<{$info.tag_id}>, "tags")'>
										<span class="label" id="<{$info.tag_id}>" style="height:40px">
											<i class="glyphicon glyphicon-bookmark"></i>
										&nbsp;&nbsp;<{$info.tag_name}>
										</span>
									</a>
								</div>
							</td>
							<td><{$info.article_count}></td>
						<{if $smarty.foreach.tag.index % 3 == 2}>
						</tr>
						<{/if}>
						<{/foreach}>
						<{if $tags_count % 3 != 0}>
						</tr>
						<{/if}>
					</table>
				</div>
			</div>
		</div>
		<div class="span4">
			<div id="dates_json" name="dates_json"> 
				<input type="hidden" value='$[$$]$'/>
			</div>
			<br />
			<div class="alert">
				<div style="scrollbar-face-color: #889b9f;  scrollbar-highlight-color: #c3d6da; overflow: auto;scrollbar-shadow-color: #3d5054; scrollbar-3dlight-color: #3d5054; scrollbar-arrow-color: #ffd6da;scrollbar-darkshadow-color: #85989c; height: 500px">
					<table class="table table-hover" style="background-color:rgba(255, 255, 255, 0)" frame=void border=0 cellpadding=0 cellspacing=0 bordercolor=rgba(0,0,0,0)>
						<{foreach item=info from=$dates}>
						<tr>
							<td>
								<div id="label_icon_<{$info.id}>">
									<a href="javascript:void(0);" onclick='js_label(<{$info.id}>, "dates")'>
										<span class="label" id="<{$info.id}>" style="height:40px">
											<i class="glyphicon glyphicon-bookmark"></i>
										&nbsp;&nbsp;<{$info.month}>
										</span>
									</a>
								</div>
							</td>
							<td><{$info.article}></td>
							<td><{$info.mood}></td>
						</tr>
						<{/foreach}>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<{include 'footer.tpl'}>
