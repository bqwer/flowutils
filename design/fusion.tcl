#produce flow from steps + configuration
[flow::init]

[flow::read_steps /path/to/fusion.yml     ]
[flow::read_steps /path/to/prime_time.yml ]

[flow::read_cfg   /path/to/project.cfg    ]
[flow::update_cfg /path/to/block.cfg      ]

[flow::check]

# this is like yaml merging
[flow::script::start $flow::config::script_dir/fusion_clock.tcl]
set flow::fusion::load_db::database /path/to/placed/database
[flow::script::paste_step fusion.init]
[flow::script::paste_step fusion.load_db]
[flow::script::add_tcl "
  some\
  tcl\
  goes\
  here\
"]
[flow::script::paste_step fusion.clock_design]
[flow::script::paste_step fusion.save_db]
[flow::script::write]

foreach view $flow::general::views {
  [flow::script::start $flow::config::script_dir/${view}_sta.tcl]]
  [flow::script::paste_step prime_time.init]
  [flow::script::paste_step prime_time.run_sta]
  [flow::script::write]
}

#---
#flow:
#  task: floorplan
#    depends: none 
#    tool: /path/to/fc
#    script: /path/to/script/fp.tcl
#    run_cmd: "$tool -script $script"
#    resource_cmd: "qsub ..."
#
#  task: place
#    depends: floorplan
#    tool: /path/to/fc
#    script: /path/to/script/place.tcl
#    run_cmd: "$tool -script $script"
#    resource_cmd: "qsub ..."
#
#  task: qrc
#    depends: route
#    tool: /path/to/qrc
#    script: 
#
#  task: sta
#    depends: [qrc, write_def]
#    tool: /path/to/primetime
#    script:
