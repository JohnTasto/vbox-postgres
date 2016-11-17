Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html).  Mac users also need [XQuartz](https://www.xquartz.org/).

Then run:
```
$ vagrant plugin install vagrant-vbguest
$ vagrant up       # takes a while, ignore all the errors...
$ vagrant ssh
```

Once logged in, run:
```
$ cd proj/edu_test
$ python manage.py migrate
$ python manage.py createsuperuser
    # choose email and password
$ python manage.py runserver
```

In a new terminal, run `vagrant ssh` again, and run:
```
$ psql < proj/edu_test/pg/load_data.sql
$ firefox
```

In Firefox, browse to localhost:8000/admin, sign in with your new Django superuser credentials, and browse data under EDU_DATA.
