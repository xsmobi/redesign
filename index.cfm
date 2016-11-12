<cfsetting enablecfoutputonly="yes" />

<cfif isdefined("url.site")>
	<cfinclude template="z_get_site_meta_and_images.cfm">
<cfelse>
	<cfif isdefined("url.up")>
		<cfinclude template="z_upload_angebote.cfm">
	<cfelseif isdefined("url.algolia")>
		<cfinclude template="z_create_algolia_index.cfm">
	<cfelse>
		<cfoutput>no site</cfoutput><cfabort>
	</cfif>
</cfif>
<cfinclude template="z_get_twitter_card_data.cfm">

<cfif qpages.recordcount or qmoments.recordcount>
	<cfset is_nav = "Yes"><cfelse><cfset is_nav = "No">
</cfif>
<cfif isdefined("url.vnav")>
	<cfset is_vnav = "Yes"><cfelse><cfset is_vnav = "No">
</cfif>
<cfif isdefined("url.apreview")>
	<cfset is_apreview = "Yes"><cfelse><cfset is_apreview = "No">
</cfif>

<cfsetting enablecfoutputonly="No" /><!DOCTYPE html>
<cfoutput><html lang="de"></cfoutput>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
    <cfoutput>
    <title>#meta_title#</title>
	<cfif len(description)><meta name="description" content="#description#"></cfif>
	<link rel="canonical" href="#canonical#" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<cfif is_algolia>
		<script src="//cdn.jsdelivr.net/instantsearch.js/1/instantsearch.min.js"></script>
		<link rel="stylesheet" href="//cdn.jsdelivr.net/instantsearch.js/1/instantsearch.min.css" />
	</cfif>
	</cfoutput>
	<link href="https://plus.google.com/114452540494833952881?rel=author" rel="author">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!--- <script type="text/javascript" src="https://ssl.gstatic.com/trends_nrtr/760_RC08/embed_loader.js"></script>	 --->
	<cfoutput>
	<cfif trim(qsite.site_css) neq ""><link rel="stylesheet" href="#qsite.site_css#"></cfif>
	<cfif trim(qsite.site_css_text) neq ""><style>
		#qsite.site_css_text#
	</style></cfif>
	</cfoutput>
	<cfif not is_widget><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"></cfif>
	<script>
		$(document).ready(function(){
		<cfoutput>var asite= "#url.site#";</cfoutput>
		$.urlParam = function(name){
    		var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
   			if (results==null){
       			return 0;
    		}
    		else{
       			return results[1] || 0;
    		}
		};
		var apost = $.urlParam("post");
		var asort = $.urlParam("sort");
		// console.log(asort);
		$.getJSON('http://www.redesign.mobi/card/getentries.cfc?method=getFront&returnformat=JSON&queryformat=column&asite='+asite+'&apost='+apost+'&asort='+asort,		
			function(data) {
				$.each(data.DATA.BANNER, function(i,banner){
					$('#banner').append(banner);
					return false;
				});
				$.each(data.DATA.FIRMA, function(i,firma){
					$('#firma').append(firma);	
					return false;
				});
				$.each(data.DATA.SLOGAN, function(i,slogan){
					$('#slogan').append(slogan);	
					return false;					
				});
				$.each(data.DATA.ARTICLES_HEADER, function(i,articles_header){
					$('#posts').append(articles_header);	
					return false;					
				});
				$.each(data.DATA.ARTICLES_HEADER_2, function(i,articles_header_2){
					$('#posts').append(articles_header_2);	
					return false;					
				});
				$.each(data.DATA.POST, function(i,post){
					$('#posts').append(post);	
				});
				$.each(data.DATA.POSTLIST, function(i,postlist){
					$('#postlist').append(postlist);	
					return false;							
				});
				$.each(data.DATA.ADDRESS, function(i,address){
					$('#address').append(address);	
					return false;							
				});
				if (apost !== 0){
					$('#algolia_search').hide();
					$('#algolia_hits').hide();
				};	
		});
	});
	</script>
	
	<cfif trim(qsite.site_image) neq "" or is_post and ListLen(bildliste)>
		<cfinclude template="z_twitter_og_meta_tags.cfm">
	</cfif>
	<cfif trim(qsite.schema_org) neq "" and trim(qsite.site_image) neq "">
		<cfinclude template="z_schema_org.cfm">
	</cfif>
	<cfif qmoments.recordcount>
		<style>
		<cfoutput query="qmoments">##m#numberformat(mkn, "0000000")#,</cfoutput>
		#moments {display: none;}
		.fa-bolt {color: #ffd700;}
	</style>
	</cfif>
	<cfif isdefined("url.du")>
		<cfset ga_id = "UA-32385575-1"><cfelse><cfset ga_id = "UA-530582-18">
	</cfif>
	<script> 
	idx = "0"; // moments
	idxx = "0";
	pdx = "0"; // pages
	pdxx = "0";
	</script>

	<script>
	  	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	 	 m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	  	<cfoutput>ga('create', '#ga_id#', 'auto');</cfoutput>
	  	ga('send', 'pageview');
	</script>
</head>

<body>

<cfif is_widget>
	<cfif qpages.recordcount>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link home-link" href="#" id="home">Home</a></li>
			<cfoutput query="qpages">
  				<li class="nav-item"><a class="nav-link page-link loadpage" href="##" id="load_#label#">#charnews(page_name)#</a></li>
  			</cfoutput>
		</ul>
	<cfelse>
		<nav class="nav" id="postlist"></nav>
	</cfif>
	<section id="posts"></section>
<cfelse>
	<div id="banner"></div>

	<div class="container" id="top">

		<cfif trim(qsite.site_titel) neq "">
			<h2 class="text-muted text-lg-center p-t-1"><cfoutput>#charnews(qsite.site_titel)#</cfoutput></h2>
		</cfif>
		<div class="row">
			<div class="col-sm-9 col-xs-12">
				<cfif is_algolia>
					<div class="row" id="algolia_search">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="searchinput"><cfoutput><fieldset class="form-group"><input type="text" class="form-control" id="search-box" placeholder="instant search while you type"></fieldset></cfoutput></div>	
						<div class="col-lg-5 col-md-4  lead hidden-md-down" id="pagination-container"></div>
						<div class="col-lg-1 col-xs-2  algolia-logo text-xs-right"><a href="https://algolia.com" target="_blank" rel="nofollow"><img src="http://www.deutschlandurlaub.mobi/algolia_logo_bg-white.jpg" alt="Algolia" style="width: 60px;"></a></div>
					</div>
				</cfif>
			</div>
			<div class="col-sm-3 hidden-sm-down">
				<div id="google_translate_element" class="pull-right" style="background-color: white; padding-left: 2px; margin-top: 2px;"></div>
			</div>	
		</div>

		<cfif is_nav and not is_vnav>
			<ul class="nav nav-pills lead">
				<cfinclude template="z_nav.cfm">
			</ul>
		</cfif>
		<cfif is_algolia>
			<div class="row m-t-1" id="algolia_hits">
				<div class="col-lg-12">
					<div class="row" id="hits-container"></div>
				</div>
			</div>
		</cfif>
		<div class="row m-t-2">
			<div class="col-lg-12">
				<h1 id="firma" class="display-3 text-xs-center"></h1>
				<h2 id="slogan" class="display-4 text-xs-center"></h2>
				<cfif is_post and is_twitter><cfset posturl = URLEncodedFormat("http://www.redesign.mobi/cards?site=#url.site#&post=#url.post#")><cfoutput><a class="pull-right m-l-1" href="https://twitter.com/intent/tweet?text=#posturl#"><i class="fa fa-twitter-square fa-lg" aria-hidden="true"></i></a></cfoutput></cfif>
				<!--- <cfif qpages.recordcount><div class="bg-info" id="pgheader"><h3 id="page_header" class="m-t-1 text-lg-center"></h3></div></cfif> --->
			</div>
		</div>
		<cfif qmoments.recordcount>
			<div id="#moments">
			<cfoutput query="qmoments">
				<div id="m#numberformat(mkn, "0000000")#" class="mdiv"><a class="twitter-moment" href="#url0#">#charnews(titel)#</a></div>
			</cfoutput>
			</div>
		</cfif>
		
		<cfif is_nav and is_vnav>
			<div class="row">
				<div class="col-lg-3">
					<ul class="nav nav-pills nav-stacked lead">
						<cfinclude template="z_nav.cfm">
					</ul>
				</div>
				<div class="col-lg-9">
					<section id="posts"></section>
				</div>			
			</div>
		<cfelse>
			<section id="posts"></section>
		</cfif>

		<cfif not is_apreview><nav class="nav" id="postlist"></nav></cfif>

	</div>
	
	<cfif not is_apreview><section id="address"></section></cfif>
	
</cfif>


<cfif qpages.recordcount>
<script>
$('#home').click(function() {
	<cfoutput>var asite= "#url.site#";</cfoutput>
	$.getJSON('http://www.redesign.mobi/card/getentries.cfc?method=getFront&returnformat=JSON&queryformat=column&asite='+asite+'&apage=',		
			function(data) {
				$('#page_header').empty();
				$('#posts').empty();
				$.each(data.DATA.POST, function(i,post){
					$('#posts').append(post);	
				});
				$.each(data.DATA.FIRMA, function(i,firma){
					$('#firma').html(firma);	
					return false;
				});
				$.each(data.DATA.SLOGAN, function(i,slogan){
					$('#slogan').html(slogan);	
					return false;					
				});		
	});
	$(".pcl").removeClass('active');
});
$('.pcl').click(function() {
	pdxx = pdx;
	pdx = this.id;
	$(".pcl").removeClass('active');
	$("#"+pdx).addClass('active');
	pdx = pdx.replace("load_", "");
	<cfoutput>
	var asite= "#url.site#";
	</cfoutput>
	$.getJSON('http://www.redesign.mobi/card/getentries.cfc?method=getFront&returnformat=JSON&queryformat=column&asite='+asite+'&apage='+pdx,	
			function(data) {
				$('#posts').empty();
				$.each(data.DATA.POST, function(i,post){
					$('#posts').append(post);	
				});
				/*
				$('#page_header').empty();
				$.each(data.DATA.PAGE_NAME, function(i,page_name){
					$('#page_header').append(page_name);	
					return false;
				});
				*/
				$.each(data.DATA.PAGE_H1, function(i,page_h1){
					$('#firma').html(page_h1);	
					return false;
				});
				$.each(data.DATA.PAGE_H2, function(i,page_h2){
					$('#slogan').html(page_h2);	
					return false;
				});				
				
	});
	$('#algolia_hits').hide();
	$('#algolia_search').hide();
	$('#slogan').empty();
});
$('#home').click(function() {
	$('#algolia_hits').show();	
	$('#algolia_search').show();
});
</script>
</cfif>

<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'de', includedLanguages: 'ar,cs,de,en,es,fr,it,ja,la,nl,no,pl,pt,ru,sv,tr,zh-CN', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, multilanguagePage: true, gaTrack: true, gaId: 'UA-32385575-1'}, 'google_translate_element');
}
</script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<cfif trim(qsite.javascript_files) neq ""><cfoutput><cfloop list="#qsite.javascript_files#" index="jsfile" delimiters="#chr(13)##chr(10)#">
	<script src="#jsfile#"></script></cfloop></cfoutput></cfif>
	
<cfif qmoments.recordcount>
<script>
$('.mcl').click(function() {
	$('#posts').hide();
	$('#pgheader').hide();
	$('#firma').hide();
	$('#slogan').hide();
	idxx = idx;
	idx = this.id;
	idx = idx.replace("toggle_", "");
	$('#' + idxx).hide();
	$('#' + idx).show();
	$(".pcl").removeClass('active');
	$('#algolia_search').hide();
	$('#algolia_hits').hide();
});
$('.hidemoments').click(function(){
		$('#posts').show();
		$('#pgheader').show();
		$('#firma').show();
		$('#slogan').show();
		$('.mdiv').hide();
	});
</script>
</cfif>

	


<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
<script async src="//cdn.embedly.com/widgets/platform.js" charset="UTF-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.2/js/tether.min.js"></script>
<script src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"></script>
<cfif not is_widget>
	<script>
	$(function () {
  	$('[data-toggle="tooltip"]').tooltip()
	})
	</script>
</cfif>
</body>
</html>