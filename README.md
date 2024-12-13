# Introduction

Hello, I wrote this script using a little bit of the GPT chat and two other colleagues who helped me create the script logic. The script is designed to set a certain quota for a person.

## Why was it written?

There is one problem in TrueNAS CORE that is known to many users who use TrueNAS CORE.

The point is that we can set a certain quota in a pool for a group, but they will all share it together, which is not very convenient for huge projects.

## How does it work?

I solved this problem with a script, since in TrueNAS CORE you can assign cron tasks that will be automatically executed. Looking at the logic of the script, you will understand that it checks whether a quota is assigned to a person and whether it is greater than the one that each user should have. To this I would like to add that I solved the problem with the quota by simply assigning it to each user according to the script.

## Summary

After using this script, the Admins no longer have to think about how to set a quota for a group and how to give it to everyone. 

For example:
- A group quota of `1T` divided by `100GB` per user is problematic because TrueNAS does not work this way.
- This can lead to one user consuming `150GB` or even taking up the entire Terabyte, leaving other users unable to utilize their allocated space.

The alternative provided by this script:
- Simply assigns a specific quota to each user. 
- Solves the problem with group quotas as no division logic is required.

## Customization

You can also customize this script according to the principles used in your company. My case is just an example.

## Closing Note

I wish everyone a good time, and also hope that my script was useful!

