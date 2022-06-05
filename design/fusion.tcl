#produce flow from steps + configuration
[flow::init]

[flow::read_steps /path/to/fusion.yml     ]
[flow::read_steps /path/to/prime_time.yml ]

[flow::read_cfg   /path/to/project.cfg    ]
[flow::update_cfg /path/to/block.cfg      ]

[flow::check]

[flow::start_script]
set script_path $flow::config::script_dir/fusion_clock.tcl
set flow::fusion::load_db::database /path/to/placed/database
[flow::paste_step fusion.load_db]
[flow::paste_step fusion.clock]
[flow::paste_step fusion.save_db]
[flow::write_script]

foreach corner $flow::general::views {
  [flow::start_script]
  [flow::paste_step prime_time.setup]
  [flow::paste_step prime_time.run_sta]
  [flow::write_script]
}
