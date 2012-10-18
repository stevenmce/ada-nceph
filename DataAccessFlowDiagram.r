
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

nodes <- newnode(name= 'Add Study Description in Registry',
                inputs='Request Access')

nodes <- newnode(name='Review Application',
                 inputs = 'Add Study Description in Registry'
                 )

nodes <- newnode(name='Approve Access',
                 inputs = 'Review Application'

                 )

nodes <- newnode(name='Deny Access',
                 inputs = 'Review Application'

)



###########################################################################
# Provide data
# nodes <- newnode(name='Add to Study Description in Registry',
#                  inputs='Request Access',
#                  outputs= 'Review Application',
#
#                  )

# notify approval

nodes <- newnode(name='Notify User of Approval',
                 inputs='Approve Access',
                 outputs='Add Access Record in Registry',
                 )

# or record why not

nodes <- newnode(name='Notify User of Non-approval',
                 inputs='Deny Access',
                 outputs='Note Reason in Study Description in Registry',
                 )



nodes <- newnode(name='Give access to Restricted Server', newgraph = F,
                 inputs = 'Add Access Record in Registry'
                 )


nodes <- newnode(name='Extract to Restricted Server', newgraph = F,
                 inputs = 'Give access to Restricted Server'
                 )

nodes <- newnode(name= 'Store data extract in appropriate location', newgraph = F,
                 inputs = c('Extract to Restricted Server'),
                 outputs = c('CSV', 'Database schema', 'Rstudio user workspace')
                 )

nodes <- newnode(name= 'Add File to Registry', newgraph = F,
                 inputs = c('Store data extract in appropriate location'),
                 outputs = c('Notify User of Access')
)

nodes <- newnode(name = 'Modify file and access records in registry',
                 inputs = 'Notify User of Access')

dev.copy2pdf(file='DataAccessFlowDiagram-GettingAccess.pdf')
dev.off()

###########################################################################
# newnode Manage Access

nodes <- newnode(name= 'List Current Users',
                 inputs = c('Modify file access record in registry'),
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
                 'Modify file access record in registry', 'Review Report'))

################################################################
# name:plotnodes
    dev.copy2pdf(file='DataAccessFlowDiagram-ManagingAccess.pdf')
    dev.off()

###########################################################################
# newnode End Access
nodes <- newnode(name= 'Query Registered End Dates',
                 inputs = c('Modify file access record in registry'),
                 outputs = c('Prompt Users'))

nodes <- newnode(name= 'Receive Prompt',
                 inputs = c('Prompt Users')
                 )

nodes <- newnode(name= 'Review Status',
                 inputs = c('Receive Prompt'),
                 outputs = c('Project Concluded', 'Project Continuing')
                 )

nodes <- newnode(name= 'Request Extension',
                 inputs = c('Project Continuing'),
                 outputs = 'Extend Access Approved'
                 )

nodes <- newnode(name= 'Request Archive Data',
                 inputs = c('Project Concluded')
                 )

nodes <- newnode(name= 'Prepare Archive Data',
                 inputs = c('Request Archive Data')
                 )

nodes <- newnode(name= 'Prepare Archive Data',
                 inputs = c('Request Archive Data')
                 )

nodes <- newnode(name= 'Store Archive Data',
                 inputs = 'Prepare Archive Data',
                 outputs = 'Notify User'
                 )

nodes <- newnode(name= 'User Data Archiving',
                 inputs = 'Notify User',
                 outputs = c('Destroy Data',
                 'Store Data and Inform Data Admin of Security')
                 )

nodes <-  newnode(name = 'Record Status',
                  inputs =
                  'Store Data and Inform Data Admin of Security'
                  )
