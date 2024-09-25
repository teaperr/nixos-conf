{ config, ... }

{
  home.file.".config/tint2/tint2rc".text = ''
#---- Catppuccin Mocha Theme ----
# Gradients
#-------------------------------------
# Backgrounds
# Background 1: Clock, Panel, Systray
rounded = 5
border_width = 0
border_sides = TBLR
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #1e1e2e 100   # Mocha base background
border_color = #f5c2e7 100       # Pink accent border
background_color_hover = #282a36 100  # Darker hover state
border_color_hover = #89b4fa 100  # Blue accent for hover
background_color_pressed = #12121c 100
border_color_pressed = #f38ba8 100   # Red accent for pressed state

# Background 2: Default task, Iconified task
rounded = 5
border_width = 1
border_sides = TBLR
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #1e1e2e 100   # Mocha base
border_color = #282a36 50        # Surface border
background_color_hover = #44475a 80  # Brighter hover for tasks
border_color_hover = #89b4fa 100  # Blue accent for hover
background_color_pressed = #6272a4 100
border_color_pressed = #a6e3a1 100   # Green for pressed tasks

# Background 3: Active task
rounded = 5
border_width = 1
border_sides = TBLR
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #44475a 100   # Highlighted active task
border_color = #f5c2e7 100       # Pink accent border for active task
background_color_hover = #6272a4 80
border_color_hover = #f5c2e7 100
background_color_pressed = #f38ba8 100
border_color_pressed = #f9e2af 100   # Yellow accent for pressed state

# Background 4: Urgent task
rounded = 5
border_width = 1
border_sides = TBLR
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #f38ba8 100   # Red urgent background
border_color = #f9e2af 100       # Yellow border for urgency
background_color_hover = #f38ba8 100
border_color_hover = #f9e2af 100
background_color_pressed = #f38ba8 100
border_color_pressed = #f9e2af 100

# Background 5: Tooltip
rounded = 2
border_width = 1
border_sides = TBLR
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #1e1e2e 100   # Mocha base background
border_color = #a6e3a1 100       # Green accent border for tooltips
background_color_hover = #f9e2af 100   # Yellow hover
border_color_hover = #a6e3a1 100
background_color_pressed = #f9e2af 100
border_color_pressed = #a6e3a1 100

# Background 6: Inactive desktop name
rounded = 2
border_width = 1
border_sides = TBLR
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #1e1e2e 100   # Darker for inactive desktops
border_color = #44475a 100       # Faint surface border
background_color_hover = #89b4fa 100
border_color_hover = #f5c2e7 100
background_color_pressed = #89b4fa 100
border_color_pressed = #f5c2e7 100

# Background 7: Active desktop name
rounded = 2
border_width = 1
border_sides = TBLR
border_content_tint_weight = 0
background_content_tint_weight = 0
background_color = #282a36 100   # More noticeable for active desktops
border_color = #f5c2e7 100
background_color_hover = #89b4fa 100
border_color_hover = #f5c2e7 100
background_color_pressed = #89b4fa 100
border_color_pressed = #f5c2e7 100

#-------------------------------------
# Panel
panel_items = TSC
panel_size = 100% 40
panel_margin = 0 0
panel_padding = 4 4 4
panel_background_id = 1
wm_menu = 1
panel_dock = 0
panel_pivot_struts = 0
panel_position = bottom center horizontal
panel_layer = normal
panel_monitor = 2
panel_shrink = 0
autohide = 1
autohide_show_timeout = 0
autohide_hide_timeout = 0
autohide_height = 1
strut_policy = none
panel_window_name = tint2
disable_transparency = 0
mouse_effects = 1
font_shadow = 0
mouse_hover_icon_asb = 100 0 10
mouse_pressed_icon_asb = 100 0 0
scale_relative_to_dpi = 0
scale_relative_to_screen_height = 0

#-------------------------------------
# Taskbar
taskbar_mode = single_desktop
taskbar_hide_if_empty = 0
taskbar_padding = 0 0 2
taskbar_background_id = 0
taskbar_active_background_id = 0
taskbar_name = 1
taskbar_hide_inactive_tasks = 0
taskbar_hide_different_monitor = 0
taskbar_hide_different_desktop = 0
taskbar_always_show_all_desktop_tasks = 1
taskbar_name_padding = 6 3
taskbar_name_background_id = 6
taskbar_name_active_background_id = 7
taskbar_name_font = Hack Nerd Font Mono 11
taskbar_name_font_color = #cdd6f4 100   # Catppuccin text color
taskbar_name_active_font_color = #ffffff 100
taskbar_distribute_size = 0
taskbar_sort_order = none
task_align = left

#-------------------------------------
# Task
task_text = 1
task_icon = 1
task_centered = 1
urgent_nb_of_blink = 100000
task_maximum_size = 140 35
task_padding = 4 3 4
task_font = Hack Nerd Font Mono 10
task_tooltip = 1
task_thumbnail = 1
task_thumbnail_size = 210
task_font_color = #cdd6f4 100   # Mocha text color for tasks
task_icon_asb = 100 0 0
task_background_id = 2
task_active_background_id = 3
task_urgent_background_id = 4
task_iconified_background_id = 2
mouse_left = toggle_iconify
mouse_middle = close
mouse_right = maximize_restore
mouse_scroll_up = prev_task
mouse_scroll_down = next_task

#-------------------------------------
# System tray (notification area)
systray_padding = 0 0 2
systray_background_id = 1
systray_sort = ascending
systray_icon_size = 22
systray_icon_asb = 100 0 0
systray_monitor = 2
systray_name_filter = 

#-------------------------------------
# Launcher
launcher_padding = 0 0 2
launcher_background_id = 0
launcher_icon_background_id = 0
launcher_icon_size = 22
launcher_icon_asb = 100 0 0
launcher_icon_theme_override = 0
startup_notifications = 1
launcher_tooltip = 1

#-------------------------------------
# Clock
time1_format = %H:%M
time2_format = %A %d %B
time1_font = Hack Nerd Font Mono Bold 10
time1_timezone = 
time2_timezone = 
time2_font = Hack Nerd Font Mono 7
clock_font_color = #cdd6f4 100   # Mocha text for clock
clock_padding = 1 0
clock_background_id = 1
clock_tooltip = 
clock_tooltip_timezone = 
clock_lclick_command = zenity --calendar --text ""
clock_rclick_command = date +"%Y-%m-%d %H:%M:%S" | xclip -selection clipboard
clock_mclick_command = 
clock_uwheel_command = 
clock_dwheel_command = 

#-------------------------------------
# Battery
battery_tooltip = 1
battery_low_status = 10
battery_low_cmd = xmessage 'tint2: Battery low!'
battery_full_cmd = 
bat1_font = sans 8
bat2_font = sans 6
battery_font_color = #cdd6f4 100  # Mocha text for battery
bat1_format = 
bat2_format = 
battery_padding = 1 0
battery_background_id = 0
battery_hide = 101
battery_lclick_command = 
battery_rclick_command = 
battery_mclick_command = 
battery_uwheel_command = 
battery_dwheel_command = 
ac_connected_cmd = 
ac_disconnected_cmd = 

#-------------------------------------
# Tooltip
tooltip_show_timeout = 0.5
tooltip_hide_timeout = 0.1
tooltip_padding = 2 2
tooltip_background_id = 5
tooltip_font_color = #cdd6f4 100  # Mocha text for tooltips
tooltip_font = sans 9
  '';
}
