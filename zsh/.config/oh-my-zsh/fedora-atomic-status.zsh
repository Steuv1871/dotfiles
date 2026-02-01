# Fedora Atomic status
### Exist script on startup
if [ ! -z "$1" ]; then
    ### Check status on a Fedora Atomic distro
    if command -v rpm-ostree &> /dev/null; then
        # Decorator
        echo '\e[35m                                          ┌─────────────────────────────────────────────────────────────┐\e[0m' 
        
        # Image
        escape() {
            sed 's/[&/\]/\\&/g' <<< "$1"
        }
        IMAGE_INFO="/usr/share/ublue-os/image-info.json"
        IMAGE_NAME=$(jq -r '."image-name"' < $IMAGE_INFO)
        IMAGE_NAME_ESCAPED=$(escape "$IMAGE_NAME")
        IMAGE_BRANCH=$(jq -r '."image-branch"' < $IMAGE_INFO)
        IMAGE_BRANCH_ESCAPED=$(escape "$IMAGE_BRANCH")
        IMAGE_BASE=$(jq -r '."base-image-name"' < $IMAGE_INFO)
        IMAGE_BASE_ESCAPED=$(escape "$IMAGE_BASE")
        echo "\e[35m                                           OS \e[0m  $IMAGE_BASE_ESCAPED"
        echo "\e[35m                                          │ ├󱋩 \e[0m  $IMAGE_NAME_ESCAPED:$IMAGE_BRANCH_ESCAPED"
        # Check image age and prompt to update
        IMAGE_DATE=$(rpm-ostree status --booted | sed -n 's/.*Timestamp: \(.*\)/\1/p')
        IMAGE_DATE_SECONDS=$(date -d "$IMAGE_DATE" +%s)
        CURRENT_SECONDS=$(date +%s)
        DIFFERENCE=$((CURRENT_SECONDS - IMAGE_DATE_SECONDS))
        MONTH=$((30 * 24 * 60 * 60))
        if [ "$DIFFERENCE" -ge "$MONTH" ]; then
            echo '\e[35m                                          │ ├󰇻 \e[0m  Your current image is over 1 month old, run `ujust update`'
        fi
        
        # Boot status
        if grep -q "status is GREEN" /etc/motd.d/boot-status; then
            GREENBOOT='Boot Status: Healthy 󰄳'
        else
            GREENBOOT=$(cat /etc/motd.d/boot-status)
        fi
        echo "\e[35m                                          │ └󰟀 \e[0m  $GREENBOOT"
        
        # Decorator
        echo '\e[35m                                          └─────────────────────────────────────────────────────────────┘\e[0m'              
    fi
fi
