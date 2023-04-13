import requests
from flask import render_template, Flask, request
from flask.views import MethodView
from wtforms import Form, SubmitField, StringField
import socket
app = Flask(__name__, template_folder='templates')


class Meaning_of_Word:
    def __init__(self, word):
        self.word = word

    def get(self):
        try:
            url = f"https://api.dictionaryapi.dev/api/v2/entries/en/{self.word}"
            response = requests.get(url)
            content = response.json()
            x = content[0]['meanings'][0]['definitions'][00]['definition']
            return x
        except ValueError:
            x = "Word not found"
            return x
        except KeyError:
            x = "Word not found"
            return x


class Home_Page(MethodView):
    def get(self):
        socketid =socket.gethostname()
        return render_template('index.html', socket_Id=socketid)


class Dictionary_Page(MethodView):
    def get(self):
        dictionary_ = Dictionary()
        return render_template('dictionary.html', dictionary=dictionary_)

    def post(self):
        the_word = Dictionary(request.form)
        Word = the_word.word.data
        _Meaning = Meaning_of_Word(word=str(Word))
        Meaning = _Meaning.get()
        if Meaning != "Word not found":
            return render_template('dictionary.html', meaning="meaning", dictionary=the_word, word=Meaning)
        else:
            Meaning = 'Oops !! Not found,Please check the word and try again'
            return render_template('dictionary.html', dictionary=the_word, word=Meaning)


class Dictionary(Form):
    word = StringField('Enter a Word :')
    button = SubmitField('Define')


class About_Page(MethodView):
    def get(self):
        return render_template("About.html")
class Logo_Page(MethodView):
    def get(self):
        return render_template("Logo.html")


app.add_url_rule('/', view_func=Home_Page.as_view('Home_Page'))
app.add_url_rule('/dictionary', view_func=Dictionary_Page.as_view('Dictionary_Page'))
app.add_url_rule('/about', view_func=About_Page.as_view('About_Page'))
app.add_url_rule('/logo', view_func=Logo_Page.as_view('Logo_Page'))
app.run(host='0.0.0.0', port=5000)
