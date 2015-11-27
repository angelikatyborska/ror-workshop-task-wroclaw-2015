Netguru Wrocław 2015 Workshop Task Solution
================
This repository contains my solution to the task that has to be solved to qualify for Netuguru's RoR Workshop in Wrocław. The task can be found [here](https://github.com/netguru-training/wroclaw-ror-workshops-2015-december).

Travis
-------------------------
[![Build Status](https://travis-ci.org/angelikatyborska/ror-workshop-task-wroclaw-2015.svg)](https://travis-ci.org/angelikatyborska/ror-workshop-task-wroclaw-2015)

This app on Heroku
-------------------------
URL will be here

### Payments
Since the requirements for this part of the task were rather unclear, I decided to simplify this problem. I am assuming that:

- Each student can have as many payments as they want,

- A student has paid their tuition for the month if the total amount of payments made this month is higher than a given value (let's say, 42).

#### DataTables
I decided to include DataTables manually and not via the gem [datatables-rails](https://github.com/rweng/jquery-datatables-rails), because the gem does not use the newest version of DataTables. It uses 1.10.7, which has [a bug](https://github.com/DataTables/DataTables/issues/580)
 that was fixed in 1.10.8, which kept me from successfully using this plugin.