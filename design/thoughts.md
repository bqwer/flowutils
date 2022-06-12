# The flow pillars
* Configure
* Run
* Control

# FlowUtils
FlowUtils are tools! Not the flow itself.  
They are ment to be used.  

## Configure
 1. YAML _description_ of settings  
 2. YAML _configuration_ of the project/block/etc. --- we should check against description  

## Generating multiple branches
Sometimes we need to generate the whole bunch of similar parallel tasks  
YAML can *describe* it, but can't _generate_...  

## Flow requirements and tasks
Debug is crucial task  

### YAML tools that can be useful
yamllint -- check syntax, indents, etc. in yaml files  
yq -- lightweight command line yaml processor (incl. merge)  

somehow it's needed to combine population of the tool specific screepts and scheduler to run this scripts  

How do you specify the flow?  
Steps -> Scripts -> Runs  

