### No app specified error  

If you come across this error when trying to run commands on an existing Heroku app, run this code:

```
heroku git:remote -a YOUR_HEROKU_APP

```

### undefined method '[]' for nil:NilClass

If you come across this error when trying to run rake:db:test:prepare, check the indenting in the
database.yml file.  

```
test:
  <<: *default
  database: idea_box_test
```

^ The above code was indented too much and caused this to fail!!  Crazy.
