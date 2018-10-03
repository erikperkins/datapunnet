# Data Punnet
A system of machine-learning-backed applications, organized in a service-oriented architecture. See it live at [datapun.net](http://datapun.net).
The main application is written in Elixir/Phoenix, which handles rendering client-side code and coordinating the other applications.
A Python Flask application hosts neural network code.
Custom Scala code embedded in a Finch-based JSON API performs statistical natural language processing tasks.
A Rust microservice supplied with data from Redis calculates live time series forecasts of Twitter data.
Nginx is layered over the top of all the applications, exposing only the default port to the outside world. Each application lives in its own Docker container. The applications communicate with each other by exposing RESTful JSON APIs between the containers.

A punnet is a small basket for berries.
