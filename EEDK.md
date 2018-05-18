# Installing the MSI from EPO using EEDK

## Facter for EPO

The MSI build provided from the repo can be installed as a package for McAfee EPO.

THe installation on the downstream McAfee Managed Endpoints can be summarized:

1. Upload the `*.zip` file created by the EEDK builder to EPO server by adding a new package to the `EPO Repository`
2. Assign a new client task (McAfee Agent -> Product Deployment -> New Task) to the target endpoints.
3. Wait for the client to finish installation. This can be monitored on the endpoint within the Agent UI. 

![Screenshot](meta/eedk-batched.png?raw=true "Screenshot")

## Batch wrapper for EEDK to run msiexec

Attempting to run msiexec directly seems to fail, and best practice guide for EEDK recommends adding a batch file wrapper to execute the msiexec installation.

## Troubleshooting

You may see a failed package like this..

![Screenshot](meta/failed-eedk-facter.png?raw=true "Screenshot")