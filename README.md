Netguru Wrocław 2015 Workshop Task Solution
================
This repository contains my solution to the task that has to be solved to qualify for Netuguru's RoR Workshop in Wrocław. The task can be found [here](https://github.com/netguru-training/wroclaw-ror-workshops-2015-december).

Travis
-------------------------
[![Build Status](https://travis-ci.org/angelikatyborska/ror-workshop-task-wroclaw-2015.svg)](https://travis-ci.org/angelikatyborska/ror-workshop-task-wroclaw-2015)

This app on Heroku
-------------------------
[ror-workshop-tyborska.herokuapp.com](https://ror-workshop-tyborska.herokuapp.com/)

Clarifications
-------------------------

### Payments
Since the requirements for this part of the task were rather unclear, I decided to simplify this problem. I am assuming that:

- Each student can have as many payments as they want,

- A student has paid their tuition for the month if the total amount of payments made this month is higher than a given value (let's say, 42).

#### DataTables
I decided to include DataTables manually and not via the gem [datatables-rails](https://github.com/rweng/jquery-datatables-rails), because the gem does not use the newest version of DataTables. It uses 1.10.7, which has [a bug](https://github.com/DataTables/DataTables/issues/580)
 that was fixed in 1.10.8, which kept me from successfully using this plugin.
 
### Report_subjects_path
Throughout the specs the helper method `report_subjects_path` was used, but the [sample application on Heroku](http://ror-workshops.herokuapp.com) has a path `reports/subjects`. I'm not sure if that is on purpose and I had to find a clever way to make it work this way, but I couldn't. I decided that changing anything in the specs is cheating, so instead I defined a `report/subject` (and not `reports/path`) path to match the usage of `report_subjects_path` helper method.