#!/bin/sh

if [ $# -ne 1 ];
    then echo "usage: $0 <http://www.example.ru>" && exit 1
fi

rm -rf sitemap.xml; rm -rf spider.log;
wget --spider --recursive --no-verbose 
	--output-file=spider.log 
    --reject=.rss,.gif,.png,.jpg,.css,.js,.txt -e robots=off $1;
urls=(`sed -n 's/.\+ URL:\([^ ]\+\) .\+/\1/p' spider.log`);

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<urlset
      xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\"
      xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"
      xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">" > sitemap.xml;

for url in ${urls[*]}
do
echo "<url>
  <loc>$url</loc>
  <changefreq>daily</changefreq>
</url>" >> sitemap.xml;
done      
        
echo "</urlset>"; >> sitemap.xml;

