#!/bin/bash

# Define the dataset path, which is where ZFS is mounted.
DATASET="datapool/datapool" # Replace this with your actual ZFS dataset path.

# Set the default quota to 1T (terabyte) unless a value is passed as an argument.
QUOTA="${1:-1T}" 

# Get a list of all users from wbinfo (likely Samba/AD users) and store them as a single string.
USERS=$(wbinfo -u | tr '\n' ' ')
echo $USERS # Printing the list of users, after cleaning.

# Loop through each user from the USERS list.
for USER in $USERS; do
    echo "Checked user: $USER" # Print the current user being processed.

    # Retrieve the current quota for the user in the ZFS dataset.
    CURRENT_QUOTA=$(zfs get -Hp userquota@"$USER" $DATASET 2>/dev/null | awk '{print $3}')

    echo "Current QUOTA: $CURRENT_QUOTA" # Display the current quota.

    # Check if the quota is undefined, "none", "0", or "unlimited".
    if [[ -z "$CURRENT_QUOTA" || "$CURRENT_QUOTA" == "none" || "$CURRENT_QUOTA" == "0" || "$CURRENT_QUOTA" == "unlimited" ]]; then
       echo "Setting QUOTA of $QUOTA for $USER..." # Indicate setting a new quota.
       echo "$CURRENT_QUOTA -------" # Display the existing quota before changing it.

       # Set the quota for the current user.
       zfs set userquota@"$USER"=$QUOTA $DATASET

       echo "$CURRENT_USAGE IS THIS USAGE" # Placeholder for usage data (not yet defined).

       # Check if the command succeeded.
       if [ $? -eq 0 ]; then
          echo "QUOTA HAS BEEN SUCCESSFULLY SET" # Confirm quota was applied.
       else
         echo "Error setting QUOTA for $USER" # Print error if the quota change failed.
       fi
    fi

    echo $CURRENT_USAGE # Placeholder, likely unused.

    # Check if the current quota is greater than or equal to 1T (in bytes: 1TB = 1099511627776 bytes).
    if [ "$CURRENT_QUOTA" -ge 1099511627776 ]; then
       echo "CURRENT_USAGE $CURRENT_QUOTA IS THIS -------" # Placeholder for debugging.
       echo "$USER already has 1T or more, quota will not be changed" # Explain no change needed.
    else
        echo "QUOTA IS CORRECT OR User has less than 1TB utilized" # Indicate quota is fine.
    fi
done