# Star Wars Squadrons Dedicated Server

There is no facility in game to create a proper 'dedicated server'. The only option is for a client to create a game and load the options they want themselves.

This is the start of an implementation, through [AutoHotKey](https://www.autohotkey.com/), to automate the process of creating a server from any PC SWS Client (that has started on the main menu screen).

If you would like your server to have a name ... like SCL Official | Server #1 - then that needs to be set as your player name.

* Press F1 to start the system from the menu screen.
* Press F4 to stop the script running and reload.

The first settings config stored on the client will be used for the server settings.

Once the client has started a server in spectator mode, it then will repeatedly cycle to start the game as soon as a player joins.

You can take this code and use it freely for your own purposes but please share your changes and updates with the wider community. This can easily be adapted to run from multiple hotkeys and setup to run your own practise servers much more quickly than before.

You can check out more about how I put this together [on my YouTube channel](https://www.youtube.com/watch?v=3m_ELtZh9Vg)
