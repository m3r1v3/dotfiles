#!/bin/bash

greeting() {
    clear
    figlet "choosetheme"
}

select_option() {
    echo
    echo "Select Option:"
    echo "
        1. Select CybertruckSetup
        2. Select H4CKSetup
        3. Select IcoSetup
        0. Quit
    "
    read -e -p "Enter option [0-3] > " -i 0
    check_option
}

check_option() {
    if [[ "$REPLY" =~ ^[0-3]$ ]]; then
        if [[ "$REPLY" == 0 ]]; then
            echo
            echo "Bye"
            exit
        fi
        if [[ "$REPLY" == 1 ]]; then
            echo
            echo "Selected CybertruckSetup"
            make_backup
            set_cybertruck
        fi
        if [[ "$REPLY" == 2 ]]; then
            echo
            echo "Selected H4CKSetup"
            make_backup
            set_h4ck
        fi
        if [[ "$REPLY" == 3 ]]; then
            echo
            echo "Selected IcoSetup"
            make_backup
            set_ico
        fi
    else
        echo
        invalid_option
    fi
}

make_backup() {
    mkdir -p ~/.backup > /dev/null
    cp -rf ~/.config/alacritty ~/.backup > /dev/null
    cp -rf ~/.config/i3 ~/.backup > /dev/null
    cp -rf ~/.config/polybar ~/.backup > /dev/null
    cp -rf ~/.vimrc ~/.backup > /dev/null
}

set_cybertruck() {
    # copy alacritty setup to .config folder
    cp -rf CybertruckSetup/alacritty ~/.config/ > /dev/null
    echo "* Alacritty config has been updated"

    # copy i3 setup to .config folder
    cp -rf CybertruckSetup/i3 ~/.config/ > /dev/null
    echo "* I3wm config has been updated"

    # copy polybar setup to .config folder
    cp -rf CybertruckSetup/polybar ~/.config/ > /dev/null
    echo "* Polybar config has been updated"

    # copy spicetify theme to spicetify themes folder 
    cp -rf CybertruckSetup/spicetify/CybertruckTheme ~/spicetify-cli/Themes/ > /dev/null
    spicetify config current_theme CybertruckTheme > /dev/null
    spicetify config color_scheme cybertruck > /dev/null
    spicetify apply > /dev/null
    echo "* Spicetify config has been updated"

    # copy vim config to user directory
    cp -rf CybertruckSetup/vim/.vimrc ~/ > /dev/null
    echo "* Vim config has been updated"

    # copy rofi files
    sudo cp -rf CybertruckSetup/rofi/tesla.rasi /usr/share/rofi/themes/
    cp -rf CybertruckSetup/rofi/tesla.rasi ~/.config/rofi/config.rasi
    echo '@theme "/usr/share/rofi/themes/tesla.rasi"' >> ~/.config/rofi/config.rasi
    echo "* Rofi config has been updated"

    # copy wallpapers
    cp -rf CybertruckSetup/wallpapers/* ~/Pictures
    echo "* Wallpapers has been updated (Needs restart)"

    echo "CybertruckSetup has been installed"
    exit
}

set_h4ck() {
    # copy alacritty setup to .config folder
    cp -rf H4CKSetup/alacritty ~/.config/ > /dev/null
    echo "* Alacritty config has been updated"

    # copy i3 setup to .config folder
    cp -rf H4CKSetup/i3 ~/.config/ > /dev/null
    echo "* I3wm config has been updated"

    # copy polybar setup to .config folder
    cp -rf H4CKSetup/polybar ~/.config/ > /dev/null
    echo "* Polybar config has been updated"
    
    # copy spicetify theme to spicetify themes folder
    cp -rf H4CKSetup/spicetify/H4CKTheme ~/spicetify-cli/Themes/ > /dev/null
    spicetify config current_theme H4CKTheme > /dev/null
    spicetify config color_scheme h4ck > /dev/null
    spicetify apply > /dev/null
    echo "* Spicetify config has been updated"

    # copy vim config to user directory
    cp -rf H4CKSetup/vim/.vimrc ~/ > /dev/null
    echo "* Vim config has been updated"

    # copy rofi files
    sudo cp -rf H4CKSetup/rofi/h4ck.rasi /usr/share/rofi/themes/
    cp -rf H4CKSetup/rofi/h4ck.rasi ~/.config/rofi/config.rasi
    echo '@theme "/usr/share/rofi/themes/h4ck.rasi"' >> ~/.config/rofi/config.rasi
    echo "* Rofi config has been updated"

    # copy wallpapers
    cp -rf H4CKSetup/wallpapers/* ~/Pictures
    echo "* Wallpapers has been updated (Needs restart)"

    echo "H4CKSetup has been installed"
    exit
}

set_ico() {
    # copy alacritty setup to .config folder
    cp -rf IcoSetup/alacritty ~/.config/ > /dev/null
    echo "* Alacritty config has been updated"

    # copy i3 setup to .config folder
    cp -rf IcoSetup/i3 ~/.config/ > /dev/null
    echo "* I3wm config has been updated"

    # copy polybar setup to .config folder
    cp -rf IcoSetup/polybar ~/.config/ > /dev/null
    echo "* Polybar config has been updated"

    # copy spicetify theme to spicetify themes folder
    cp -rf IcoSetup/spicetify/IcoTheme ~/spicetify-cli/Themes/ > /dev/null
    spicetify config current_theme IcoTheme > /dev/null
    spicetify config color_scheme ico > /dev/null
    spicetify apply > /dev/null
    echo "* Spicetify config has been updated"

    # copy vim config to user directory
    cp -rf IcoSetup/vim/.vimrc ~/ > /dev/null
    echo "* Vim config has been updated"
    
    # copy rofi files
    sudo cp -rf H4CKSetup/rofi/ico.rasi /usr/share/rofi/themes/
    cp -rf IcoSetup/rofi/ico.rasi ~/.config/rofi/config.rasi
    echo '@theme "/usr/share/rofi/themes/ico.rasi"' >> ~/.config/rofi/config.rasi
    echo "* Rofi config has been updated"
    
    # copy wallpapers
    cp -rf IcoSetup/wallpapers/* ~/Pictures
    echo "* Wallpapers has been updated (Needs restart)"

    echo "IcoSetup has been installed"
    exit
}

invalid_option() {
    echo "Invalid Option. Try again!"
    select_option
}

greeting
select_option
