from bs4 import BeautifulSoup
from langdetect import detect
import requests

# Function to read URLs from a text file
def read_urls_from_file(file_path):
    with open(file_path, 'r') as file:
        urls = file.read().splitlines()
    return urls

# Function to extract main body text and detect language
def get_main_text_language(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')
    main_tag = soup.find('main')
    if main_tag:
        main_text = main_tag.get_text(strip=True)
        language = detect(main_text)
        return language
    return "Main tag not found"

# Read URLs from the text file
urls = read_urls_from_file('fr_fr_sitemap.txt')

# Create a table of URL and detected language
results = []
for url in urls:
    language = get_main_text_language(url)
    results.append((url, language))

# Print the results in tabular format
print("URL\t\t\t\t\tDetected Language")
print("-" * 60)
for result in results:
    print(f"{result[0]}\t{result[1]}")