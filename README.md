# redesign
Redesign CMS, a Website builder based on Boostrap 4, creating fast loading AJAX pages

## Content Management
Created with Coldfusion, a simple CRUD (create, read, update, delete) with a MySQL database.

## Backend
Edit these data formats:
* Address Data and Settings: one record per site
* Articles: "pages" or "views" of a single page site
* Pages: used to filter articles
* Links: presently only used for Twitter Moments
The user interface is created with Bootstrap 4, so sites can be edited from any device

## Display
Sites created are single page sites (or single page applications, SPA), build with Bootstrap 4
* The HTML <code>head</code> and <code>body</code> layout are created dynamically from the server: [dynamic site example](http://redesign.mobi/cards/?site=black-forest-hotel-talblick), content is filled into the template via AJAX with jQuery and a Coldfusion CFC
* <code>body</code> layout consists of a header, a navigation (if there are pages created), an article section and a footer
* The layout can easily be customized, presently there are two standard layouts with top and side nav, respectively
* These sites can be uploaded at any time to static URLs: [static site example](http://cms.redesign.mobi/black-forest-hotel-talblick/)

## General features
Extensive descriptions and examples on [rwd.io](http://www.rwd.io)
* Sites can easyily be transferred to other servers: only one HTML page, less than 100 lines. A canonical link can be set.
* Each article is also a stand-alone web page [dynamic article page examample](http://redesign.mobi/cards/?site=black-forest-hotel-talblick) consisting of the respective article content, navigation and footer. There is a [preview template](http://redesign.mobi/cards/?site=black-forest-hotel-talblick&post=1788&apreview), too, without nav and footer, used during editing
* Articles can have a limited lifetime. After expiry they won't be displayed. If all articles have expired (or are set to "no display")
* Sharing the site: there are meta tags for Twitter Cards and Open Graph
* Sharing a page: any individual page has Twitter Cards and Open Graph meta tags, too, plus sharing buttons (presently Twitter only)
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
* Syntax allows HTML-free [Font Awesome](http://fontawesome.io/icons/) integration. Any of the 675+ icons can be integrated
* The footer consists of site data and an address bar which includes a link to the publishers website, and a Google Maps link.
* Site data in the footer: site title, site description, site text (no markup, presently), site image, two iframe site embeds (for instance, for YouTube or SlideShare

## Edit Menu
Screenshots, editing a sample site

### Data types: Articles, Address & Settings
![](http://i.imgur.com/Lhuz8ZA.jpg)

![](http://i.imgur.com/VWYLBhM.jpg)

### Editing an article
![](http://i.imgur.com/wnKGccG.jpg)

Contextual help: article markdown
![](http://i.imgur.com/eFDhdqm.jpg)

## About the project, kudos
I created a similar system back in 2008 as a site builder for mobile websites. Over the years I continually used it for content marketing, plus I created tools on top of it, like an HTML email builder and an app builder (with AngularJS). Earlier I used Foundation instead Bootstrap. Now, with Bootstrap 4 having matured very much (though still in Alpha), I want to leverage the power of Bootstrap's responsiveness to create a truly responsive site builder.

A LinkedIn article, published on July 7, 2016: [Redesign: a simple site builder for non-techie publishers & marketers](https://www.linkedin.com/pulse/redesign-simple-site-builder-non-techie-publishers-marketers-ritter)

Example sites (in German), for tourism marketing: ["Tourismuswerbung Deutschland"](http://www.tourismuswerbung-deutschland.de/)

Some stuff on Responsive Web Design, putting Redesign CMS in a context: [rwd.io](http://www.rwd.io)

Want to try? [Sign-up here.](http://www.redesign.mobi/sign-up/)

Thanks and kudos to all Coldfusion stars I learned from: Raymond Camdon, Pete Freitag, Ben Nadel - and, of course: Ben Forta

Thanks to great free services that make the digital world a better place: Stack Overflow, MySQL, Bootstrap, Foundation, Font Awesome, jQuery, AngularJs, Embedly, Twitter (for Cards and Moments), Google Translate - as well as services I use and reommend to users for creating sites: Pixlr, CompressNow, Imgur
