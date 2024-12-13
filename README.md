# Introduction
Hello, I wrote this script using littel bit of the GPT chat and two other colleagues who helped me create the script logic. The script is designed to set a certain quota for a person.

# Why was it written?
There is one problem in TrueNAS CORE that is known to many users who use TrueNAS CORE.

The point is that we can set a certain quota in a pool for a group, but they will all share it together, which is not very convenient for huge projects.

# How does it work?
I solved this problem with a script, since in TrueNAS CORE you can assign cron tasks that will be automatically executed. Looking at the logic of the script, you will understand that it checks whether a quota is assigned to a person and whether it is greater than the one that each user should have. To this I would like to add that I solved the problem with the quota by simply assigning it to each user according to the script.

# Summary
After using this script, the Admins no longer has to think about how to set a quota for a group and how to give it to everyone (for example, a group quota of 1T and you divide it by 100 GB for each, but the problem is that TrueNAS does not work this way, and this will lead to the fact that one user can use 150 GB or even take up the entire Terabyte and users in this group will no longer be able to use their gigabytes, which is very inconvenient).

But the alternative that I made is simply adding a specific quota to each user (this solves the problem with the group quota, since no logic of division by the number of people in the group is needed here).

# Customization
You can also customize this script according to the principle as it is built in your company, my case is just an example.

# Closing Note
I wish everyone a good time, and also hope that my script was useful!

