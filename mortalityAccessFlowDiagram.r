
###########################################################################
# newnode: mortalityAccessFlowDiagram
dir()
source('~/tools/disentangle/src/newnode.r')
nodes <- newnode(name='Add Study to Registry',
                 inputs='Request Access',
                 outputs='Approve Access',
                 newgraph=T)

nodes <- newnode(name='Give access to Restricted Server', newgraph = F,
                 inputs = 'Approve Access',
                 outputs = 'Add accessor record to registry'
                 )


nodes <- newnode(name='Extract to Restricted Server', newgraph = F,
                 inputs = 'Give access to Restricted Server'
                 )

nodes <- newnode(name= 'Store data extract in appropriate location', newgraph = F,
 inputs = c('Extract to Restricted Server'),
 outputs = c('CSV', 'Database schema', 'Rstudio user workspace')
 )

nodes <- newnode(name= 'Add File to Registry', newgraph = F,
 inputs = c('CSV', 'Database schema', 'Rstudio user workspace'),
 outputs = c('Modify file access record in registry', 'Notify User')
 )



dev.copy2pdf(file='mortalityAccessFlowDiagram.pdf')
dev.off()
