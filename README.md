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

![Connections manager empty](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager.png)

![Connections manager new connection](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/ConnectionDescription.png)

![Connection test](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/ConnectionDescription2.png =x400)

![Connection connect](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager1.png)

![Connection not checked](https://raw.githubusercontent.com/juliendelplanque/DBConnectionsManager/master/screenshots/DBConnectionsManager2.png)

