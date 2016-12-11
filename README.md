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
<!-- 
## Displaying and templates 
Sites created are single page sites (or single page applications, SPA), build with Bootstrap 4
* The HTML <code>head</code> and <code>body</code> layout are created dynamically from the server: [dynamic site example](http://redesign.mobi/cards/?site=black-forest-hotel-talblick), content is loaded into the template via AJAX with jQuery and a Coldfusion CFC
* <code>body</code> layout consists of a header, a navigation (if there are pages created), an article section and a footer
* The layout can easily be customized, presently there are two standard layouts with top and side nav, respectively
* These sites can be uploaded at any time to static URLs: [static site example](http://cms.redesign.mobi/black-forest-hotel-talblick/)
 -->


<!-- 
## General features
Extensive descriptions and examples on [rwd.io](http://www.rwd.io)
* Sites can easyily be transferred to other servers: only one HTML page, less than 300 lines. A canonical link can be set.
* Each article is also a stand-alone web page [dynamic article page examample](http://redesign.mobi/cards/?site=black-forest-hotel-talblick) consisting of the respective article content, navigation and footer. There is a [preview template](http://redesign.mobi/cards/?site=black-forest-hotel-talblick&post=1788&apreview), too, without nav and footer, used during editing
* Articles can have a limited lifetime. After expiry they won't be displayed. If all articles have expired (or are set to "no display")
* Sharing the site: there are meta tags for Twitter Cards and Open Graph
* Sharing a page: any individual page has Twitter Cards and Open Graph meta tags, too, plus sharing buttons (presently Twitter only)
* Twitter Moments can easily be added and will be displayes like pages
* There is a widget format to embed a site into any other weg page via Iframe
* Sites can be included in host pages via AJAX, too (ideally Bootstrap 4 pages)
* Design can be customized with CSS, both internal (style section in settings) and via an external style sheet
* SEO: sites have a SEO-friendly, semantic mark-up plus schema.org tags (presently hotels and B&Bs only)
* Site search: [Algolia Search](https://www.algolia.com/) can be added (presently not a public feature)

## Layout and typography features
Both the layout and typography make use of Bootstrap 4
* Articles are full-width (12 columns) only, presently
* Images, both for articles, the banner and the footer are entered as a URL (presently no validity check)
* The banner image can be col-12 or full-screen
* Article data: header, sub-header, body, 1 full-width link button, 1 image (right 3 columns), 3 full-width images with captions, 1 article embed
* Articles can be edited with a simple markup to use Bootstrap's [typography](http://v4-alpha.getbootstrap.com/content/typography/), for instance <code>small</code> <code>mark</code>. For instance, links: <code>[http_link-URL This is the anchor text]</code>
* [Bootstrap 4 Cards](https://v4-alpha.getbootstrap.com/components/card/) can also be created with this markup
* External links or services (like Tweets, Pinterest boards, Instagram images, YouTube / Vimeo, SlideShare / slid.es) can be embedded in pages as Embedly Cards
* Syntax allows HTML-free [Font Awesome](http://fontawesome.io/icons/) integration. Any of the 675+ icons can be integrated
* The footer consists of site data and an address bar which includes a link to the publishers website, and a Google Maps link.
* Site data in the footer: site title, site description, site text (no markup, presently), site image, two iframe site embeds (for instance, for YouTube or SlideShare

### Data types: Articles, Address & Settings
![](http://i.imgur.com/sHLcxXw.jpg)

### About the project, kudos
I created a similar system back in 2008 as a site builder for mobile websites. Over the years I continually used it for content marketing, plus I created tools on top of it, like an HTML email builder and an app builder (with AngularJS). Earlier I used Foundation instead Bootstrap. Now, with Bootstrap 4 having matured very much (though still in Alpha), I want to leverage the power of Bootstrap's responsiveness to create a truly responsive site builder.

A LinkedIn article, published on July 7, 2016: [Redesign: a simple site builder for non-techie publishers & marketers](https://www.linkedin.com/pulse/redesign-simple-site-builder-non-techie-publishers-marketers-ritter)

### Example Sites
Example sites (in German), for tourism marketing: ["Tourismuswerbung Deutschland"](http://www.tourismuswerbung-deutschland.de/)

Some stuff on Responsive Web Design, putting Redesign CMS in a context: [rwd.io](http://www.rwd.io)

Want to try? [Sign-up here.](http://www.redesign.mobi/sign-up/)

Thanks and kudos to all Coldfusion stars I learned from: [Raymond Camden](https://github.com/cfjedimaster), [Pete Freitag](https://github.com/pfreitag), [Ben Nadel](https://github.com/BenNadel) - and, of course: [Ben Forta](http://forta.com/)

Thanks to great free services that make the digital world a better place: Stack Overflow, MySQL, [Bootstrap](https://v4-alpha.getbootstrap.com/), Foundation, W3C validator, Pingdom Tools, [Font Awesome](http://fontawesome.io), jQuery, AngularJs, Embedly, Twitter (for Cards and Moments), Google Maps and Google Translate - as well as services I use and reommend to users for creating sites: Pixlr, CompressNow, Imgur

![](http://i.imgur.com/1a5xeF9.jpg)

 -->
