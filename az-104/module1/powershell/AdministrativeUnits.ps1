# Reference: https://learn.microsoft.com/en-us/azure/active-directory/roles/admin-units-members-add
# Use the Invoke-MgGraphRequest command from Azure Graph API to add user, groups, or devices to an administrative unit or create a new group in an administrative unit.

#region Powershell via Graph API
# Add users to an administrative unit
Invoke-MgGraphRequest -Method POST -Uri https://graph.microsoft.com/v1.0/directory/administrativeUnits/{ADMIN_UNIT_ID}/members/ -Body '{
         "@odata.id": "https://graph.microsoft.com/v1.0/users/{USER_ID}"
       }'
       
# Add groups to an administrative unit
Invoke-MgGraphRequest -Method POST -Uri https://graph.microsoft.com/v1.0/directory/administrativeUnits/{ADMIN_UNIT_ID}/members/ -Body '{
         "@odata.id": https://graph.microsoft.com/v1.0/groups/{GROUP_ID}
       }'
       
# Add devices to an administrative unit
Invoke-MgGraphRequest -Method POST -Uri https://graph.microsoft.com/v1.0/directory/administrativeUnits/{ADMIN_UNIT_ID}/members/ -Body '{
         "@odata.id": https://graph.microsoft.com/v1.0/devices/{DEVICE_ID}
       }'

# Create a new group in an administrative unit
$exampleGroup = Invoke-MgGraphRequest -Method POST -Uri https://graph.microsoft.com/v1.0/directory/administrativeUnits/{ADMIN_UNIT_ID}/members/ -Body '{
         "@odata.type": "#Microsoft.Graph.Group",
         "description": "{Example group description}",
         "displayName": "{Example group name}",
         "groupTypes": [
              "Unified"
          ],
         "mailEnabled": true,
          "mailNickname": "{exampleGroup}",
          "securityEnabled": false
       }'


#endregion
