
# VueJs Flask SocketIO Example Template

This is another fun project that can be useful to starters in web-development. The main purpose of this project is to setup the server, client sides and the communication inbetween. The template is a good fit if you are thinking to build a real-time application, as the communciation is handled via websockets.

<ins>Server:</ins> Flask, Flask-SocketIO
<ins>Client:</ins> VueJs, SocketIO

# Server
### Prerequisites
`pip install -r requirements.txt`

### Start the server
Go to the directory of server. Run flask at the port 8050 in command line (where client listens):
1. set FLASK_APP=server.py
2. set FLASK_ENV=development
3. flask run -h localhost -p 8050

# Client
### Prerequisites

1. Install [nodejs]([https://nodejs.org/en/download/](https://nodejs.org/en/download/))
2. Install vuejs cli globally:
	
		npm install -g @vue/cli


### Start the client
Go to the directory of the client. Run below commands in a separate command line. And in browser, go to the directory shown once the client starts.

1. npm install
2. npm run serve

# Notes
I included the docker files as well. It is encouraged to use the docker files while developing and deploying. Please see further details [here]([https://www.docker.com/](https://www.docker.com/)).

I didn't implement any database or any other components. As is, it is in a very simple form, might consider improving in future.

I couldn't find a simple and working example of these tech, so I decided to publicly share this. Hope it helps.