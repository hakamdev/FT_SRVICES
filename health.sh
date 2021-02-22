if [ "$(pgrep telegraf)" = "" ]; then
        echo "process killed!"
else
        echo "process alive: $(pgrep telegraf)"
fi