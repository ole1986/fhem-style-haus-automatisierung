# Contribute

**Required Tools**

- git
- nodejs with npm (>= 10)
- sass (through npm)
- FHEM (to test the changes)

## Installation

The installation is focused on a raspberry pi
All necessary debian packages can be installed through `apt`

 ```
 sudo apt-get install git nodejs
 ```

Followed by the use of `npm` to globally install the `sass` cli

```
sudo npm install -g sass
```

## Checkout

I prefer to clone the repository in users (pi) home directory.

```
pi@raspberrypi:~ $ git clone https://github.com/ole1986/fhem-style-haus-automatisierung.git
pi@raspberrypi:~ $ cd fhem-style-haus-automatisierung
```

With the `./contribute.sh` script can be executed and create necessary symbolic link in the `/opt/fhem` directory to comfortable see changes at runtime

```
pi@raspberrypi:~/fhem-style-haus-automatisierung $ ./contribute.sh
```

Use `./contribute clean` to remove the symlinks again

## Running sass

To compile sass files into css at runtime, please use the below command

```
sass sass/:www/pgm2/ --no-source-map --watch
```