
###########################################################################
# newnode: mortalityAccessFlowDiagram
# REQUIRES THE DISENTANGLE REPO FROM https://github.com/ivanhanigan/disentangle
# Clone into a tools directory, or change the following line
source('~/tools/disentangle/src/newnode.r')

###########################################################################
# Getting access

nodes <- newnode(name='Browse Catalogue',
                 inputs = 'Search for Data',
                 outputs = 'Request Access',
                 newgraph = T
                 )
## NEEDS ETHICS COMMITTEE PROCESS HERE

<<<<<<< HEAD
nodes <- newnode(name= 'Get Ethics Committee Approval',
                inputs='Request Access',
                 outputs = 'Ethics Committee Approves Project')
 
nodes <- newnode(name= 'Add Study Description in ANU-User-DB',
                inputs= 'Ethics Committee Approves Project'
                 )
     
nodes <- newnode(name = 'BDM Reviews Project Application',
                 inputs = 'Add Study Description in ANU-User-DB'
=======
nodes <- newnode(name= 'Add Study Description in Registry',
                inputs='Request Access')

## NEEDS ETHICS COMMITTEE PROCESS HERE

nodes <- newnode(name='Review Application',
                 inputs = 'Add Study Description in Registry'
>>>>>>> original/master
                 )
## INSERT BDM APPROVAL PROCESS HERE

## INSERT BDM APPROVAL PROCESS HERE

nodes <- newnode(name='Approve Access',
                 inputs = 'BDM Reviews Project Application'

                 )

nodes <- newnode(name='Deny Access',
                 inputs = 'BDM Reviews Project Application'

)



###########################################################################
# Provide data
# nodes <- newnode(name='Add to Study Description in ANU-User-DB',
#                  inputs='Request Access',
#                  outputs= 'Review Application',
#
#                  )

# notify approval

nodes <- newnode(name='Notify User of Approval',
                 inputs='Approve Access',
                 outputs='Add Access Record in ANU-User-DB',
                 )

# or record why not

nodes <- newnode(name='Notify User of Non-approval',
                 inputs='Deny Access',
                 outputs='Note Reason in Study Description in ANU-User-DB',
                 )



nodes <- newnode(name='Give access to Restricted Server', newgraph = F,
                 inputs = 'Add Access Record in ANU-User-DB'
                 )


nodes <- newnode(name='Extract to Restricted Server', newgraph = F,
                 inputs = 'Give access to Restricted Server'
                 )

nodes <- newnode(name= 'Store data extract in appropriate location', newgraph = F,
                 inputs = c('Extract to Restricted Server'),
                 outputs = c('Low Risk Data')
                 )

nodes <- newnode(name = 'CSV',
                 inputs = 'Low Risk Data')

nodes <- newnode(name = 'High Risk Data', outputs =
                 c('Database schema', 'Rstudio user workspace'),
                 inputs = 'Store data extract in appropriate location'
                 )

nodes <- newnode(name= 'Add File Record to ANU-User-DB', newgraph = F,
                 inputs = c('CSV', 'Database schema', 'Rstudio user workspace'),


                 outputs = c('Notify User of Access')
)

nodes <- newnode(name = 'Modify file and access records in ANU-User-DB',
                 inputs = 'Notify User of Access')

dev.copy2pdf(file='DataAccessFlowDiagram-GettingAccess.pdf')
dev.off()

###########################################################################
# newnode Manage Access

nodes <- newnode(name= 'List Current Users',
                 inputs = c('Modify file access record in ANU-User-DB'),
                 outputs = c('Email Users'),
                 newgraph = T
                 )

nodes <- newnode(name= 'Receive Reminder',
                 inputs = c('Email Users')

                 )

nodes <- newnode(name= 'Report Status',
                 inputs = c('Receive Reminder'),
                 outputs = c('No Change', 'Changed Status')
                 )


nodes <- newnode(name= 'Input Response',
                 inputs = c('No Change', 'Changed Status'),
                 outputs = c('Write Report',
                 'Modify file access record in ANU-User-DB', 'Review Report'))

################################################################
# name:plotnodes
    dev.copy2pdf(file='DataAccessFlowDiagram-ManagingAccess.pdf')
    dev.off()

###########################################################################
# newnode End Access
nodes <- newnode(name= 'Query Registered End Dates',
                 inputs = c('Start Periodic Review'),
                 outputs = c('Send Prompt to Users'),
                 newgraph = T)

nodes <- newnode(name= 'User Receives Prompt',
                 inputs = c('Send Prompt to Users')
                 )

nodes <- newnode(name= 'User Reviews Status',
                 inputs = c('User Receives Prompt'),
                 outputs = c('Project Continuing', 'Project Concluded')
                 )

nodes <- newnode(name= 'Request Extension',
                 inputs = c('Project Continuing'),
                 outputs = 'Extension of Access Implemented'
                 )

nodes <- newnode(name= 'Low Risk Data',
                 inputs = c('Project Concluded')

                 )

nodes <- newnode(name= 'High Risk Data',
                 inputs = c('Project Concluded')

                 )

nodes <- newnode(name = 'User Creates Data Archives Package',
                 inputs = 'Low Risk Data'
                 )

nodes <- newnode(name = 'Data Admin Creates Data Archives Package',
                 inputs = 'High Risk Data'
                 )

nodes <- newnode(name = 'Data Admin Stores Data',
                 inputs = 'Data Admin Creates Data Archives Package',
                 outputs = c('Notify User Admin of Storage',
                   'Notify User of Storage',
                 'Notify Registries of Project Conclusion')
                 )

nodes <- newnode(name= 'Data Archives Receives Data',
                 inputs = c('User Creates Data Archives Package')
                 )

nodes <- newnode(name= 'Store Archive Data',
                 inputs = 'Data Archives Receives Data',
                 outputs = c('Notify User of Archive Storage',
                 'Notify Registries of Project Conclusion')
                 )

nodes <- newnode(name= 'User Data Archiving',
                 inputs = 'Notify User of Archive Storage',
                 outputs = c('User Destroys Data',
                 'User Stores Data and Informs User Admin of Security')
                 )

nodes <-  newnode(name = 'User Admin Records Status in ANU-User-DB',
                  inputs =
                  'User Stores Data and Informs User Admin of Security'
                  )

################################################################
# name:plotnodes
    dev.copy2pdf(file='DataAccessFlowDiagram-EndAccess.pdf')
    dev.off()
