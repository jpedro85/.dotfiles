#!/bin/bash

# Start Brave on Workspace 1
i3-msg 'exec brave-browser'

# Start Discord on Workspace 2
i3-msg 'exec discord'

# Start Spotify on Workspace 4
i3-msg 'exec flatpak run com.spotify.Client' 

# Start Thunderbird on Workspace 5
i3-msg 'exec thunderbird'

# Start Teams on Workspace 9
i3-msg 'exec flatpak run com.github.IsmaelMartinez.teams_for_linux'
