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

somehow it's needed to combine population of the tool specific scripts and scheduler to run this scripts  

## Pipelining the flow
The main idea to give everything you _need_ to pipeline the flow.
But pipelining itself should be done manually withing particular implementation.

## How do you specify the flow?  
- Describe Steps
- Generate Scripts
- Organize Runs

