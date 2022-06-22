function fish_prompt
        set username (set_color brgreen; whoami)
        set atchar (set_color brgreen; echo "@")
        set netname (set_color brgreen; uname -n)
        set seperatemeloc (set_color brwhite; echo ":")

        set curwordir (pwd)
        switch $curwordir
        case "~*"
            set location (set_color brblue; string replace ~ '' (pwd))
        case '*'
                set location (set_color brblue; pwd)
        end

        set cdir (string replace $HOME "~" $location)

        set state (set_color brwhite; echo "\$ ")
        echo {$username}{$atchar}{$netname}{$seperatemeloc}{$cdir} {$state}
end
