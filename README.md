# Introduction

Hello, I wrote this script using the JPT chat and two other colleagues who helped me create the script logic. The script is designed to set a certain quota for a person.

## Why was it written?

There is one problem in TrueNAS KORE that is known to many users who use this TrueNAS KORE.

The point is that we can set a certain quota in a pool for a group, but they will all share it together, which is not very convenient for huge projects.

## How does it work?

I solved this problem with a script, since in TrueNAS KORE you can assign cron tasks that will be automatically executed. Looking at the logic of the script, you will understand that it checks whether a quota is assigned to a person and whether it is greater than the one that each user should have. To this I would like to add that I solved the problem with the quota by simply assigning it to each user according to the script.

## Summary

After using this script, the user no longer has to think about how to set a quota for a group and how to give it to everyone. 

For example:
- A group quota of `1T` divided into `100GB` per user is problematic because TrueNAS does not enforce individual limits within a group. 
- This can lead to a single user consuming more than their fair share (e.g., `150GB`) or even the entire quota.

The script solves this issue by:
- Adding a specific quota to each user individually. 
- Eliminating the need for dividing a group quota among users manually.

## Customization

You can also customize this script according to the principle as it is built in your company. My case is just an example.

## Closing Note

I wish everyone a good time, and also hope that my script was useful!

