# whirlwhim
A system of machine-learning-backed applications, organized in a
service-oriented architecture. See it live at [whirlwh.im](http://whirlwh.im).

The main application is Ruby on Rails, which handles rendering client-side
code and coordinating the other applications. A Python Flask application hosts
neural network code. A Spark application wrapped in a Scalatra application
performs statistical natural language processing tasks.  Redis and RabbitMQ handle scheduling and background jobs. Nginx is layered over the top of all the applications, exposing only the default port to the outside world. Each application lives in its own Docker container. The applications communicate with each other by exposting RESTful JSON APIs between the containers.

A simple Haskell Snap application is in place but dormant, eventually to be used for time series analysis. There is also a dormant Python Django application,
which may find some use someday.
