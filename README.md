# Timekeeping API Docs

This is a simple RESTful Rails API for keeping track of your time. There are 2 main elements: **Time Cards** and **Time Entries**.

## Time Cards

Time Cards provide a basic structure for keeping track of time entries. Time Cards have the following methods:

### List All Time Cards

This method allows you to see all of the Time Cards in the database, along with their associated Time Entries (if any).

**URL:** <span class="verb">GET</span> <span class="highlight">https://timekeeping-api.herokuapp.com/api/v1/timecards.json</span>

**Status Codes:**

*   **200:** OK

### Show a Single Time Card

This method allows you to see a single Time Card and associated Time Entries.

**URL:** <span class="verb">GET</span> <span class="highlight">https://timekeeping-api.herokuapp.com/api/v1/timecards/**id**.json</span>

Replace **id** with the id number of the Time Card you want to see.

**Status Codes:**

*   **200:** OK

### Create a Time Card

This method allows you to create a new Time Card.

**URL:** <span class="verb">POST</span> <span class="highlight">https://timekeeping-api.herokuapp.com/api/v1/timecards.json</span>

**Parameters:**

*   timecard\[username\] (string)
*   timecard\[occurrence\] (date)

**Status Codes:**

*   **201:** Created
*   **422:** Unprocessable Entity

### Update a Time Card

This method allows you to update an existing Time Card.

**URL:** <span class="verb">PUT</span> <span class="highlight">https://timekeeping-api.herokuapp.com/api/v1/timecards/**id**.json</span>

Replace **id** with the id number of the Time Card you want to update.

**Parameters:**

*   timecard\[username\] (string)
*   timecard\[occurrence\] (date)

**Status Codes:**

*   **200:** OK
*   **422:** Unprocessable Entity

### Delete a Time Card

This method allows you to delete an existing Time Card.

**URL:** <span class="verb">DELETE</span> <span class="highlight">https://timekeeping-api.herokuapp.com/api/v1/timecards/**id**.json</span>

Replace **id** with the id number of the Time Card you want to delete.

**Status Codes:**

*   **200:** OK
*   **422:** Unprocessable Entity

## Time Entries

Time Entries are added to Time Cards to indicate the start and stop of the period you want to track. Once a Time Card has 2 Time Entries, it will automatically calculate **total hours worked**. Time Entries have the following methods:

### List All Time Entries

This method allows you to see all of the Time Entries in the database.

**URL:** <span class="verb">GET</span> <span class="highlight">https://timekeeping-api.herokuapp.com/api/v1/time_entries.json</span>

**Status Codes:**

*   **200:** OK

### Show a Single Time Entry

This method allows you to see a single Time Entry.

**URL:** <span class="verb">GET</span> <span class="highlight">https://timekeeping-api.herokuapp.com/api/v1/time_entries/**id**.json</span>

Replace **id** with the id number of the Time Entry you want to see.

**Status Codes:**

*   **200:** OK

### Create a Time Entry

This method allows you to create a new Time Entry on an existing Time Card. If this is the second Time Entry on said Time Card, **total hours worked** will be calculated on that Time Card.

**URL:** <span class="verb">POST</span> <span class="highlight">https://timekeeping-api.herokuapp.com/api/v1/time_entries.json</span>

**Parameters:**

*   time_entry\[time\] (date time)
*   time_entry\[timecard_id\] (integer)

**Status Codes:**

*   **201:** Created
*   **422:** Unprocessable Entity

### Update a Time Entry

This method allows you to update an existing Time Entry. If there are 2 existing Time Entries on a Time Card, **total hours worked** will be updated on that Time Card.

**URL:** <span class="verb">PUT</span> <span class="highlight">https://timekeeping-api.herokuapp.com/api/v1/time_entries/**id**.json</span>

Replace **id** with the id number of the Time Entry you want to update.

**Parameters:**

*   time_entry\[time\] (date time)
*   time_entry\[timecard_id\] (integer)

**Status Codes:**

*   **200:** OK
*   **422:** Unprocessable Entity

### Delete a Time Entry

This method allows you to delete an existing Time Entry. If the Time Card had 2 Time Entries and one is deleted, **total hours worked** will be set to nil.

**URL:** <span class="verb">DELETE</span> <span class="highlight">https://timekeeping-api.herokuapp.com/api/v1/time_entries/**id**.json</span>

Replace **id** with the id number of the Time Entry you want to delete.

**Status Codes:**

*   **200:** OK
*   **422:** Unprocessable Entity