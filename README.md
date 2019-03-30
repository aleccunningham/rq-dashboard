# Introduction

[![Build Status](https://travis-ci.org/eoranged/rq-dashboard.svg?branch=master)](https://travis-ci.org/eoranged/rq-dashboard)
[![Python Support](https://img.shields.io/pypi/pyversions/rq-dashboard.svg)](https://pypi.python.org/pypi/rq-dashboard)

Run the image:

```bash
$ docker run -d -p 3123:3123 --name rq-dashboard \
    -e RQ_DASHBOARD_USERNAME=$user \
    -e RQ_DASHBOARD_PASSWORD=$password \
    -e RQ_DASHBOARD_REDIS_URL=redis://redis:6379/0 \
    r.alec.cx/rq-dashboard -p 3123 -u $user $password
```

`rq-dashboard` is a general purpose, lightweight, Flask-based web
front-end to monitor your RQ queues, jobs, and workers in realtime. You
can install it with `pip install rq-dashboard`, or use the docker image.

## Screenshots

![image1](https://i.imgur.com/XGmoKQA.png)
![image2](https://i.imgur.com/nStM6H7.png)

## Running the dashboard

Run the dashboard standalone, like this:
```
$ rq-dashboard
* Running on http://127.0.0.1:9181/
```

## Integrating the dashboard in your Flask app


The dashboard can be integrated in to your own Flask app by accessing the
blueprint directly in the normal way, e.g.:

```Python

    from flask import Flask
    import rq_dashboard

    app = Flask(__name__)
    app.config.from_object(rq_dashboard.default_settings)
    app.register_blueprint(rq_dashboard.blueprint, url_prefix="/rq")

    @app.route("/")
    def hello():
        return "Hello World!"

    if __name__ == "__main__":
        app.run()
```

If you start the Flask app on the default port, you can access the dashboard at http://localhost:5000/rq. The ``cli.py:main`` entry point provides a simple working example.


## Developing

We use piptools to keep our development dependencies up to date

```
$ pip install --upgrade pip
$ pip install pip-tools
```

Now make changes to the `requirements.in` file, and resolve all the
2nd-level dependencies into `requirements.txt` like so:

```
$ pip-compile --annotate requirements.in
```

Develop in a virtualenv and make sure you have all the necessary build time (and
run time) dependencies with

```
$ pip install -r requirements.txt
```

Develop in the normal way with

```
$ python setup.py develop
```

## Maturity notes

The RQ dashboard is currently being developed and is in beta stage.


- [piptools](https://github.com/nvie/pip-tools)
- [Flask](http://flask.pocoo.org/)
- [RQ](http://python-rq.org/)
