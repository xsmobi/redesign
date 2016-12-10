<cfsetting enablecfoutputonly="Yes" />

<cfif isdefined("url.site")>
	<cfinclude template="includes/head_settings.cfm"> <!--- + is_click_slider --->
	<cfinclude template="includes/twitter_card_open_graph_data.cfm">
	<cfif isdefined("url.up")>
		<cfhttp url="http://redesign.mobi/index.cfm?site=#site#" charset="utf-8">
		<cffile action="WRITE" output="#cfhttp.filecontent#" file="D:\home\redesign.mobi\wwwroot\cms\#site#.html" nameconflict="OVERWRITE">
		<!--- <cflocation url="http://www.redesign.mobi/?site=#url.site#"> --->
		<!--- <cflocation url="http://www.redesign.mobi/?user=#SESSION.uuser#&password=#SESSION.upw#"> --->
	</cfif>
<cfelse>
	<cfhttp url="http://redesign.mobi/index0.cfm" charset="utf-8">
	<cfoutput>#cfhttp.filecontent#</cfoutput><cfabort>
</cfif>

<cfsetting enablecfoutputonly="No" /><!DOCTYPE html>
<cfoutput><html lang="#qsite.website_language#"></cfoutput>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<cfoutput><title>#meta_title#</title>
	<meta name="description" content="#description#">
	<link rel="canonical" href="#canonical#" /></cfoutput>
	<cfif is_twitter><cfoutput><cfinclude template="includes/twitter_card_open_graph_tags.cfm"></cfoutput></cfif>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<cfif is_slick_slider><script src="http://cdn.jsdelivr.net/jquery.slick/1.3.7/slick.min.js"></script></cfif>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<cfif isdefined("stylesheets")><cfoutput>#stylesheets#</cfoutput></cfif>
	<cfif trim(qsite.site_css_text) neq ""><style>
		<cfoutput>#qsite.site_css_text#</cfoutput>
	</style></cfif>
	<cfif is_slick_slider><link rel="stylesheet" href="http://cdn.jsdelivr.net/jquery.slick/1.3.7/slick.css"></cfif>
	<style>
		#top {border-radius: 6px 6px 0 0;}
		#navitems {display: none;}
		#slick_slider {display: none;}
	</style>
</head>

<body>
	<div id="banner"></div>
	<div class="container" id="top">
		<ul class="nav nav-pills lead pt-1" id="navitems"></ul>
		<div class="container" id="site_header"></div>
		<div id="slogan"></div>
		<div id="posts"></div>
		<cfif is_slick_slider><div class="row"><div class="col-lg-12" id="trigger_slick_slider"></div></div></cfif>
		<div class="row slick-multislider mt-1 mb-1" id="slick_slider"></div>
		<div class="card card-block mt-2" id="postlist" title="Articles"></div>
	</div>
	<div id="address"></div>
<script async src="//cdn.embedly.com/widgets/platform.js" charset="UTF-8"></script>
<!--- <script src="http://www.redesign.mobi/js/getsite.js"></script> ---> 
<script>
$(document).ready(function(){
		/*
		from_edit = document.referrer;
		console.log("**********************" + from_edit);
		*/

		// Creating an initial nav list with home <li><a></a></li> item only
		$("#navitems").html('<li class="nav-item"><a class="nav-link pcl" href="#" id="load_home">Home</a></li>');
		
		// Defining the string for Coldfusion CFC request
		$.urlParam = function(name){
    		var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
   			if (results==null){
       			return 0;
    		}
    		else{
       			return results[1] || 0;
    		}
		};
		var cfcJSON = "http://www.redesign.mobi/includes/getsite.cfc?method=getFront&returnformat=JSON&queryformat=column";
		
		// Test: change var asite
		<!--- var asite = $.urlParam("site"); --->
		<cfoutput>var asite = "#url.site#";</cfoutput>
		var apost = $.urlParam("post");
		var asort = $.urlParam("sort");
		
		if (apost.length > 0) {
		$("#site_image").hide();
		$("#address").hide();
		$("#slick_slider").hide();
		//console.log(apost.length);
		};
		
		var apreview = $.urlParam("preview");
		// console.log("xxx" + apreview + "yyy");

		
		// Appending more <li><a></a></li> items to the nav list
		$.getJSON(cfcJSON+'&asite='+asite+'&apost='+apost+'&asort='+asort,		
			function(data) {
				$.each(data.DATA.NAVITEMS, function(i,navitems){
					$('#navitems').show();
					$('#navitems').append(navitems);	
					return false;	
					$("#navitems").hide();						
				});
		});


		$.getJSON(cfcJSON+'&asite='+asite+'&apost='+apost+'&asort='+asort+'&apreview='+apreview,		
			function(data) {
				// Articles (multiple)
				$.each(data.DATA.POST, function(i,post){
					$('#posts').append(post);	
				});
				// Site data (one-time)
				$.each(data.DATA.PREVIEW_HINT, function(i,preview_hint){
					$('body').prepend(preview_hint);	
					return false;
				});
				// Styles
				$.each(data.DATA.SITE_CSS_TEXT, function(i,site_css_text){
					$('style').append(site_css_text);	
					return false;
				});
				$.each(data.DATA.BANNER, function(i,banner){
					$('#banner').append(banner);	
					return false;
				});
				$.each(data.DATA.SITE_HEADER, function(i,site_header){
					$('#site_header').append(site_header);	
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
				$('#postlist').empty();
				$.each(data.DATA.POSTLIST, function(i,postlist){
					$('#postlist').append(postlist);	
					return false;							
				});
				$('#slick_slider').empty();
				$.each(data.DATA.SLICK_SLIDER, function(i,slick_slider){
				// console.log(slick_slider);
					$('#slick_slider').append(slick_slider);	
					return false;							
				});
				$( "#trigger_slick_slider" ).trigger( "click" );
				
				
				$.each(data.DATA.ADDRESS, function(i,address){
					$('#address').append(address);	
					return false;							
				});
		});

		// Click on navigation links
		pdx = 0;
		$(document).on('click','.pcl',function() {
			pdxx = pdx;
			pdx = this.id;
			$(".pcl").removeClass('active');
			$("#"+pdx).addClass('active');
			pdx = pdx.replace("load_", "");
			if (pdx == "home") {
				pdx = "";
				$("#banner").show();
				// console.log("show banner");
			} else {
				$("#banner").hide();
				// console.log("hide banner");
			}
			;
			
		// Creating page content, filtering articles with apage
		$.getJSON(cfcJSON+'&asite='+asite+'&apost='+apost+'&asort='+asort+'&apage='+pdx,	
			function(data) {
				// Articles (multiple)
				$('#posts').empty();
				$.each(data.DATA.POST, function(i,post){
					$('#posts').append(post);	
				});
				
				// Page data (one-time)
				$('#site_header').empty();
				$('#slogan').empty();
				if (pdx == "") { // home
					$.each(data.DATA.SITE_HEADER, function(i,site_header){
						$('#site_header').append(site_header);	
					return false;
					});	
					$.each(data.DATA.SLOGAN, function(i,slogan){
						$('#slogan').append(slogan);
					return false;					
					});
				} else {
					$.each(data.DATA.PAGE_H1, function(i,page_h1){
						$('#site_header').append(page_h1);	
						return false;
					});	
					$.each(data.DATA.PAGE_H2, function(i,page_h2){
						$('#slogan').append(page_h2);
						return false;					
					});
				};	
		});
	});
});
</script>
<cfif is_slick_slider><script>
			$("#trigger_slick_slider").click(function(){
			// console.log("clicked");
  				$('.slick-multislider').slick({
          		// slidesToShow: 2,
          		// slidesToScroll: 2,
				fade: true,
          		autoplay: true,
          		autoplaySpeed: 2000,
          		dots: true
  				});
				$("#slick_slider").show();
			});
</script></cfif>
</body>
</html>
