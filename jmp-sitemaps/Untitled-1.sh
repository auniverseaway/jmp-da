wget -O "es_ar_sitemap.xml" "https://www.jmp.com/es_ar/sitemap/sitemap.xml" && \
cat "es_ar_sitemap.xml" | grep 'jmp.com' | cut -d'>' -f2 | cut -d'<' -f1 | grep -v '^\s*$' > "es_ar_sitemap.txt"