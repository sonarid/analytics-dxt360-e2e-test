import requests
import pickle

class CookieLibrary:
    def save_cookies_to_file(self, session, file_path):
        with open(file_path, 'wb') as f:
            pickle.dump(session.cookies, f)

    def load_cookies_from_file(self, session, file_path):
        with open(file_path, 'rb') as f:
            session.cookies.update(pickle.load(f))

    def load_saved_cookies(self):
        # Load the cookies from the file
        self.load_cookies_from_file(Browser.session(), 'cookies.pkl')

    def login_to_website(self):
        Open Browser To Login Page
        Input Username    demo.analytics@dxt360.app
        general.Input Password    p3iN%u49
        # TODO: Captcha bypass
        Wait Captcha
        Submit Credentials
        # Save the cookies to a file
        self.save_cookies_to_file(Browser.session(), 'cookies.pkl') 