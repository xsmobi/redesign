# Redesign CMS
A website builder for responsive web design based on Bootstrap 4, creating fast loading AJAX single page web sites. Format examples: [redesign.mobi](http://www.redesign.mobi). Anyone can [sign-up](http://www.redesign.mobi/sign-up/) and create a website. It's only 20 seconds from signing up to Hello World.

## Contents
* How content management, content delivery and frontend design play together
* Formatting and design options
* Displaying and templates
* Pages
* General features
* Layout and typography features


## How content management, content delivery and frontend design play together

### Content management
Created with **Coldfusion**, the CMS is a simple [CRUD] https://en.wikipedia.org/wiki/Create,_read,_update_and_delete with a **MySQL** database. Data types (i.a. SQL tables):
* *Address Data and Settings:* one record per site
* *Articles* make up the content of a single page site. Text only ("basic use"), rich text ("advanced"), plus HTML/CSS ("expert")
* *Pages:* articles can be assigned to pages to make the site a multi page application
The user interface is created with [Bootstrap 4](https://v4-alpha.getbootstrap.com/), hence sites can be edited from any device. To see it in action, [sign-up](http://www.redesign.mobi/sign-up/) and get a link that takes you directly into the menu.

### Content delivery
For **basic use**, the CMS stores data only, where each data type consists of various fields. For instance, articles consist of a header, text body, expiry date etc. However, when these data flow into the template via AJAX, fields are marked up with basic styles from the Bootstrap framework.

### Frontend design
The HTML template is almost empty. The head contains user specific data (such as a metatitle or canonical link), CSS links and external JS. The body contains some empty divs waiting for the AJAX data. If **basic** users do not add any CSS, the template looks like plain vanilla Bootstrap which is sufficient for many cases. **Advanced users** create rich text with canned markup from Bootstrap and some easy proprietary markdown (for instance <code>[linkURL link anchor text]</code> similar to Wikipedia markdown). **Expert users** (some HTML and CSS) can add more flavour with styles.

## Formatting and design options

Example screenshot: the **edit menue** of [this post](http://cms.redesign.mobi/redesign-showcase.html?post=1808)
![](http://i.imgur.com/YZHRlE7.jpg)

<hr>
**Non-techies** can build plain vanilla pages quick and easy, just content design without bells and whistles. For instance, a [simple article](http://cms.redesign.mobi/redesign-showcase.html?post=1808) could look like this (just a header, text, image):
![A simple article](http://i.imgur.com/kWp6Ujm.jpg)

<hr>
**CSS-savvy users** can enter styles or link to an external stylesheet to format any HTML element (the entire site, articles, header etc.). Such a [styled article](http://redesign.mobi/?site=redesign-showcase&post=1809) could look like this:
![A styled article](http://i.imgur.com/nFeGpM6.jpg)

<hr>
**Fonts** can be used via external styles, for instance [Google Fonts](https://fonts.google.com/) and customization.
![Styling headers with Google Fonts](http://i.imgur.com/FmuLueA.jpg)

<hr> 
**HTML-savvy users** can also include code, for instance, responsive tables with Bootstrap 4 designs
[A Bootstrap 4 table](http://i.imgur.com/yXnNHJW.jpg)

<hr>
*Bootstrap fans* can use Bootstrap 4 styles for formatting, for instance "primary", "success", "info" or "muted" / "faded" for [colors](https://v4-alpha.getbootstrap.com/utilities/colors/) and backgrounds.
![Bootstrap colors](http://i.imgur.com/vgTD4VJ.jpg)

<hr>
Redesign CMS integrates **icons from Font Awesome** . Icons can be integrated with the Font Awesome button and the respective [icon code](http://fontawesome.io/icons/). Additionally, really awesome combinations of stacked and animated icons are possible as shown in [this article](http://cms.redesign.mobi/redesign-showcase.html?post=1821).
![](http://i.imgur.com/PiI08nk.jpg)

## Display and templates
Presently there is only one base template:
```
<div id="banner"></div>
<div class="container" id="top">             
  	<ul class="nav nav-pills lead pt-1" id="navitems"></ul>
	<div class="container" id="site_header"></div>
	<div id="slogan"></div>
	<div id="posts"></div>
	<div class="row slick-multislider mt-1 mb-1" id="slick_slider"></div>
	<div class="card card-block mt-2" id="postlist" title="Articles"></div>
</div>
<div id="address"></div>
```
* Within the posts div, every post (article) has its id and can be styled
* The banner and the address block both come with a container because they can have fixed width (class="container") or full width (class="container-fluid")
* For the [Slick slider](http://kenwheeler.github.io/slick/) (by @kenwheeler) there is presently only one configuration. It will be more customizable shortly.

## Pages
Articles can be assigned to pages (an article can belong to one page only). To do this, pages have to be created first (in the same way articles are created). Example: menu page section of [this hotel site:](http://cms.redesign.mobi/black-forest-hotel-talblick.html)
![](http://i.imgur.com/V4EmPlF.jpg)
* Label: its the internal URI (only lower case, no special characters, no blanks)
* Page name: will be displayed in the navigation list
* Header and sub header
* Page text: additional that is not part of articles
* Page sort: the order in the navigation list
![](http://i.imgur.com/5yBtZBW.jpg)

## Host everywhere
Since sites are single, statice HTML pages, the can be hosted everywhere. Or they can be published on multiple hosts where updated content is served via AJAX to all hosting sites. Example: a bed and breakfast in Munich, [Pension Amsel](http://pension-amsel.com/)
* Hosted on [redesign.mobi](http://cms.redesign.mobi/pension-amsel-muenchen.html)
* Hosted on [Amazon S3](http://aws-website-pensionamsel-7gdr4.s3-website-us-east-1.amazonaws.com/)
* Hosted on [BitBalloon](http://pension-amsel-muenchen.bitballoon.com)
The lean HTML template plus AJAX loading keeps load time very short
![](http://i.imgur.com/H3UYGBT.jpg)




(this ReadMe is under construction, to be continued)
