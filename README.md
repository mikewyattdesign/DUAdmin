# AB Shock Top Discover Unfiltered Admin

Admin application for the Discover Unfiltered contest.  Entries are aggregated from the iPad app and the Facebook quiz.  This admin will be able to email and text people who have made successful entries in the iPad app and invite them to take the Facebook quiz.

## Application Links ##

### Production (on Heroku) ###

* App: [http://du-admin.herokuapp.com](http://du-admin.herokuapp.com)
* Git: [git@heroku.com:du-admin.git](git@heroku.com:du-admin.git)

### Staging (on Heroku) ###

* App: [http://du-admin-staging.herokuapp.com](http://du-admin-staging.herokuapp.com)
* Git: [git@heroku.com:du-admin-staging.git](git@heroku.com:du-admin-staging.git)

## Deployment ##
### Development to Staging ###
Push to the master branch of the staging remote repository as usual.

```
#!shell

git push master staging
```



### Staging to Production ###
Promote the staging app to production.


```
#!shell

heroku pipeline:promote -a du-admin-staging
```


## Labor ##

50/50 Split between:

* 704887 (Shock Top Warrior Dash App)
* 705507 (Shock Top DU Facebook App)