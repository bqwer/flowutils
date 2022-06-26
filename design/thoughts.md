# The flow pillars
* Configure
* Run
* Control

# FlowUtils
FlowUtils are just the tools! They *are not* the _flow_ itself.  
They are ment to be used.  

# How do you work with the flow utils?
- describe and define the configuration
- describe the steps
- generate flat scripts
- organize and perform runs

# Sidenotes
## Flow requirements and tasks
Debug is crucial task  

## YAML tools that can be useful
- yamllint -- check syntax, indents, etc. in yaml files  
- yq -- lightweight command line yaml processor (incl. merge)  

## Pipelining the flow
The main idea to give everything you _need_ to pipeline the flow.  
But pipelining itself should be done manually withing particular implementation.  

## The data handoff between steps
At the moment it's unclear how would you do the handoff from one stage to another.  
May be it would be best to define the variables which would be available later in the same way as configuration works.  
Because anyway we are already taking configuration into the account when we are doing step definitions.  

## Configure
 1. YAML _description_ of settings  
 2. YAML _configuration_ of the project/block/etc. --- we should check against description  

## Generating multiple branches
Sometimes we need to generate the whole bunch of similar parallel tasks  
YAML can *describe* it, but can't _generate_ it...  

## Organizing the results
Each tool has it's own results.  
It's impossible to define the universal directory structure to represent results.  
Then when and how do we want to organize outputs of each tool?  
And we can combine steps that belong to the same tool.  
Still each step should report to it's own report directory inside tool run directory.  

## Keeping track of the runs
It's necessary to be able to tell apart different runs and to recreate any run.  
We should keep track of all input files and configurations.  

