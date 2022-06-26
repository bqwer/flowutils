# produce flow from steps + configuration
# flow::init should introduce flow requirements on the configuration
[flow::init]


[flow::read_settings /path/to/proj_settings.yml ]
[flow::read_steps    /path/to/innovus_steps.yml ]

[flow::read_cfg   /path/to/project.config ]
[flow::update_cfg /path/to/block.config   ]

[flow::check]
# [flow::check_step]
#

# this is like yaml merging
[flow::script::start $flow::config::script_dir/fusion_clock.tcl]
[flow::script::paste_step innovus.init]
set flow::setps::innovus.load_db::database /path/to/placed/database
[flow::script::paste_step innovus.load_db]
[flow::script::add_plain "
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

