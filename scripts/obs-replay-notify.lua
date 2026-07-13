obs = obslua

-- Shell-escape a string for safe use inside single quotes
local function shell_escape(s)
    return "'" .. tostring(s):gsub("'", "'\\''") .. "'"
end

local function on_event(event)
    if event == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_SAVED then
        local path = obs.obs_frontend_get_last_replay()

        local body = "Replay buffer saved"
        if path ~= nil and path ~= "" then
            body = path
        end

        local cmd = string.format(
            "notify-send -a 'OBS Studio' -i video-x-generic -t 4000 'Replay Saved' %s",
            shell_escape(body)
        )
        os.execute(cmd)
    end
end

function script_description()
    return "Sends a notify-send desktop notification (with the saved file path) whenever the replay buffer is saved.\n\nRequires libnotify (notify-send) and a running notification daemon."
end

function script_load(settings)
    obs.obs_frontend_add_event_callback(on_event)
end

function script_unload()
    obs.obs_frontend_remove_event_callback(on_event)
end
