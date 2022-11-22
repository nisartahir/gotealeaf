## How to run

1. Install `ruby 2.63`
2. `gem install sinatra pry thin`
3. From the command line, you can start the server by `ruby main.rb`
4. If you have the 'shotgun' gem installed, you can instead run `shotgun main.rb`
5. Note down the port number
6. Open browser and type `http://127.0.0.1:XXXX` <-- XXX is the port number
7. `Ctrl+c` to stop the server

## Troubeshooting

* `rm Gemfile.lock`
*  `bundle install`