#!/bin/bash
### Grabs sitemaps
LANG_FILE='langs.txt'
while read LANG; do
  wget -O "${LANG}_sitemap.xml" "https://www.jmp.com/${LANG}/sitemap/sitemap.xml"
  echo "Grabbed ${LANG} sitemap.xml"
  if [ -f "${LANG}_sitemap.xml" ]; then
    cat "${LANG}_sitemap.xml" | grep 'jmp.com' | grep -v 'www.sitemaps.org' | cut -d':' -f2 | cut -d'<' -f1 | sed 's/^/https:/' > "${LANG}_sitemap.txt"
  fi
done < ${LANG_FILE}
echo "Completed"
## If something goes wrong, you can delete all processed sitemaps via rm -rf *_sitemap.*