# Data Punnet
A system of machine-learning-backed applications, organized in a
service-oriented architecture. See it live at [datapun.net](http://datapun.net).

The main application is Ruby on Rails, which handles rendering client-side
code and coordinating the other applications. A Python Flask application hosts
neural network code. A Spark application wrapped in a Scalatra application
performs statistical natural language processing tasks. An Elixir Phoenix web
application interacts with a Rust microservice via Redis and RabbitMQ to perform
live time series forecasting on streaming Twitter data.

 Nginx is layered over the top of all the applications, exposing only the default port to the outside world. Each application lives in its own Docker container. The applications communicate with each other by exposing RESTful JSON APIs between the containers.

A punnet is a small basket for berries.
