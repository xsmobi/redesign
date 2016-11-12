Sites created are single page sites (or single page applications, SPA), build with Bootstrap 4
* The HTML <code>head</code> and <code>body</code> layout are created dynamically from the server: [dynamic site example](http://redesign.mobi/cards/?site=black-forest-hotel-talblick), content is filled into the template via AJAX
* <code>body</code> layout consists of a header, a navigation (if there are pages created), an article section and a footer
* The layout can easily be customized, presently there are two standard layouts with top and side nav, respectively
* These sites can be uploaded at any time to static URLs: [static site example](http://cms.redesign.mobi/black-forest-hotel-talblick/)

## General features
Extensive descriptions and examples on [rwd.io](http://www.rwd.io)
* Sites can easyily be transferred to other servers: only one HTML page, less than 100 lines. A canonical link can be set.
* Each article is also a stand-alone web page [dynamic article page examample](http://redesign.mobi/cards/?site=black-forest-hotel-talblick) consisting of the respective article content, navigation and footer. There is a [preview template](http://redesign.mobi/cards/?site=black-forest-hotel-talblick&post=1788&apreview), too, without nav and footer, used during editing
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
