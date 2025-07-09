# discourse-point-assign

This plugin provides an admin interface to manually grant gamification points to users.

* Accessible only to admin users.
* Points are added to `gamification_scores` and recorded in `gamification_score_events` with description set to `manual`.
* A small form allows entering the user ID, point amount, and reason.
* Success or failure is displayed via alert after submission.
