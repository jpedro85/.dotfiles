#!/bin/bash

# Start Brave on Workspace 1
i3-msg 'workspace 1; exec brave-browser'

# Start Discord on Workspace 2
i3-msg 'workspace 2; exec discord'

# Start Spotify on Workspace 4
i3-msg 'workspace 4; exec flatpak run com.spotify.Client' 

# Start Thunderbird on Workspace 5
i3-msg 'workspace 5; exec thunderbird'

# Start Teams on Workspace 9
i3-msg 'workspace 9; exec flatpak run com.github.IsmaelMartinez.teams_for_linux'
