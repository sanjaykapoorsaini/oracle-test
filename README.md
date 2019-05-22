# Basic Flask App for GLS Fullstack Exercise

This small repo demonstrates a proper file structure for a Flask app. The folders named *static* and *templates* are required.

**Routes** and **static files** are handled correctly in all `src` and `href` attributes in the template files.

The template file `base.html` is used as a shell by the other HTML template. This means they insert content into `base.html` according to Jinja2 template rules.



For linux systems:
**Installing all dependencies:**
    Following command will create virtual environment and install required dependencies.
        `$ make setup`

**Run the Application:**
    Following command will run the application on local machine at 5000 port.
        `$ make run`



For windows:
**Installing all dependencies:**
    Install all dependencies using the following command
        `$ pip install -r requirements.txt`

**Run the Application:**
    Following command will run the application on local machine at 5000 port.
        `$ python app.py`
