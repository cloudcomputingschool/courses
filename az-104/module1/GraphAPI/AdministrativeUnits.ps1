#Reference: https://learn.microsoft.com/en-us/azure/active-directory/roles/admin-units-members-add

#Use the Add a member API to add users, groups, or devices to an administrative unit or create a new group in an administrative unit.

#add users
#Request
POST https://graph.microsoft.com/v1.0/directory/administrativeUnits/{admin-unit-id}/members/$ref

#Body
{
    "@odata.id":"https://graph.microsoft.com/v1.0/users/{user-id}"
}

#Example
{
    "@odata.id":"https://graph.microsoft.com/v1.0/users/john@example.com"
}


# Add groups to an administrative unit
POST https://graph.microsoft.com/v1.0/directory/administrativeUnits/{admin-unit-id}/members/$ref

# Add devices to an administrative unit
POST https://graph.microsoft.com/v1.0/directory/administrativeUnits/{admin-unit-id}/members/$ref

# Create a new group in an administrative unit
POST https://graph.microsoft.com/v1.0/directory/administrativeUnits/{admin-unit-id}/members/



