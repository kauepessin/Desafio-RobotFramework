import os
from dotenv import load_dotenv

load_dotenv()

USER = os.getenv('USER')
PASS = os.getenv('PASS')
BASE_URL = os.getenv('BASE_URL')
HEADLESS = os.getenv('HEADLESS')
BROWSER = os.getenv('BROWSER')