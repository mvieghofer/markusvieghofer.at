---
layout: post
title: Shift Calendar
date: '2014-11-15 20:30:05'
disqus: true
tags:
- app-tag
- efficiency
- google-calendar
---


My girlfriend works as a nurse. In her job all nurses may choose theirs shifts on their own. In order to share her shifts with me we use a shared google calendar.

Adding her shifts to my google calendar was always a hassle. There are some features missing to map the process of adding the same type of event for multiple individual dates.

Of course if there is a certain regularity in the events, such as every Monday, Wednesday and Friday, you could create one event and repeat it. However, her shifts doesn’t have a regularity which makes adding shift events very hard.

The main feature I was missing was that you can’t define event templates that can, at least, be reused for creating multiple events. The workflow I had to use was creating on event of a certain shift type, duplicate it and change the date to the date I want the event to add.

After living with this hassle for some time, I’ve decided to create a little webapp that helps me adding the shifts to my calendar.

[![Shift Calendar Web](/assets/images/shift-calendar/demo-thumbnail.png)](/assets/images/shift-calendar/demo.png)

The main setup of the app is:

1. Create types of shifts you want to add to your calendar
2. Login to your google account

Then you can:

1. Select the type of shift you want to add
2. Select the calendar the shifts should be added to
3. Select the dates the shift should be added on

Then you apply the dates and all the predefined events are added to the selected calendar. The web app is hosted on [github](https://github.com/mvieghofer/shiftcalendar-web "github"). You may also take a look at it: [http://mvieghofer.github.io/ShiftCalendar/.](http://mvieghofer.github.io/ShiftCalendar/ "ShiftCalendar hosted on github")
