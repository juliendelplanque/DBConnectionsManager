# DBConnectionsManager
A tool to manage connections to DBMS and their states from Pharo.

## Install
```
Metacello new
    baseline: 'DBConnectionsManager';
    repository: 'github://juliendelplanque/DBConnectionsManager/repository';
    load
```

## How to use

### Open the UI
The `DBConnectionsManager` comes with a simple UI allowing to check the state
of connections, to add/remove connection descriptions and to connect/disconnect
them. To open this UI, either use the world menu or run this script:
```
DBConnectionsManagerWidget openOnCurrent
```

Which leads to the following widget open:
![Connections manager empty](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager.png)

First, you need to create a new connection description. To do so, click on the
'New connection' button. You get a widget with a form to fill.

![Connections manager new connection](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/ConnectionDescription.png)

Once you filled the form with the correct information about your connection,
you can test your connection using the dedicated button.

![Connection test](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/ConnectionDescription2.png)

If you get a popup saying that 'Connection works perfectly.', your configuration is
good and you can click 'Ok' to create the connection description and to add it to
the connections manager.

Once it is done, you can right-click on the connection description appearing in the
list. A menu appears allowing you to connect the connection description.

![Connection connect](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager1.png)

Once you connected the connection description, the icon turns yellow meaning that it
hasn't been checked by the connections checker yet.

![Connection not checked](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager2.png)

Once the connection checker tested the connection description, the icon turns green.
Til the icon stays green, you know your connection to the database works perfectly.

![Connection green](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager3.png)

If a problem appears on your connection (e.g. the DBMS stops working, the server
is not reachable anymore, etc...), the icon will turn red.

![Connection red](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager4.png)

If you right click on the connection list, you get a list of actions. The first
set of actions concern the connection selected and will only appear if a connection
is selected in the list. The second set concerns actions to apply on all connections
or actions that do not require a connection to be selected.

![Connection actions](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager5.png)

### Store your connection descriptions on the disk
The ConnectionsManager lets you store your connection descriptions on the disk
for latter reuse. To save a connection description, left click on one of the
connection in the list and select 'Save on disk...' action. It will open a
file dialog allowing to select the location of the file that will store the
connection description serialized in JSON format.

To load a connection description previously stored on the disk, left click
on the connections list and select 'Load from disk...' action. This action will
let you select a JSON file containing a connection description serialized. Once
selected, confirm your choice in the file dialog and the connection description
will be loaded and added to the list of connection descriptions.
