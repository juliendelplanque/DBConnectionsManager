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

![Connection connect](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager1.png)

Once it is done, you can right-click on the connection description appearing in the
list. A menu appears allowing you to connect the connection description.

![Connection not checked](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager2.png)

Once you connected the connection description, the icon turns yellow meaning that it
hasn't been checked by the connections checker yet.

![Connection not checked](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager3.png)

Once the connection checker tested the connection description, the icon turns green.
Til the icon stays green, you know your connection to the database works perfectly.

![Connection not checked](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager4.png)


![Connection not checked](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager5.png)

