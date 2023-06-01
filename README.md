1. Fix the failing tests
Changes to fix failing test has been detailed in PR - https://github.com/Jayko14/hi-pages-360/pull/1

2. Add a test to validate the referential integrity of the `transactions` table (`contact_id` refers to a valid contact) and ensure it passes
The test will check every corresponding transaction contact_id has joins correctly to id within contacts table - PR https://github.com/Jayko14/hi-pages-360/pull/2

3. We want to ensure our `transactions` data is not older than 1 day. How to do this and when to run these checks?
This should be a handled by using a combination of the scheduling date - interval '1' day and filtered to only pull the latest day's transaction.
I.e. WHERE date(loaded_at_utc) = execution_date  - interval '1' day
The use of exectution_date means we can always backfill for a historic snapshot if needed.

An additional check if necessary (bit of an overkill) is to run a macro test to check date(loaded_at_utc) = execution_date  - interval '1' day.The test however needs to run around 10:30am as 10am is when it gets loaded.

4. Macro tests has been detailed in this PR https://github.com/Jayko14/hi-pages-360/pull/3

5. If else statement within the macro to switch between postgres and databricks depending on what the source layer is.

6. Added customer attributes in PR https://github.com/Jayko14/hi-pages-360/pull/4
