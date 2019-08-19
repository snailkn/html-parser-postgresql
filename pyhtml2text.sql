-- add extension PL/Python
create language plpython3u;

-- create the function with html module
create or replace function pyhtml2text(html_content text) returns text as $$

from html.parser import HTMLParser

class MyHtmlParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.text = ''
    def handle_starttag(self, tag, attrs):
        if tag == 'p' or tag == 'br':
            self.text += '\n'

    def handle_data(self, data):
        self.text += data if isinstance(data, str) else ''

parser = MyHtmlParser()
parser.feed(html_content)
return parser.text.strip()

$$ language plpython3u;
