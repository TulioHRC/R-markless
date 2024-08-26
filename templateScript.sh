#!/bin/bash

SCRIPT_NAME="Rmarkless"
SCRIPT_PATH="$HOME/bin/Rmarkless/$SCRIPT_NAME"
SCRIPT_DIR="$HOME/bin/Rmarkless"

mkdir -p ~/bin
mkdir -p ~/bin/Rmarkless

cat <<EOL > "$SCRIPT_PATH"
#!/bin/bash

cp "$SCRIPT_DIR/template.Rmd" "./template.Rmd"
echo "'$SCRIPT_DIR/template.Rmd' copied to './template.Rmd'"

if [ -f "Makefile" ]; then
    echo "Makefile already exists. Copy these if you want:"
    cat "$SCRIPT_DIR/Makefile"
else
    cp "$SCRIPT_DIR/Makefile" "./Makefile"
    echo "'$SCRIPT_DIR/Makefile' copied to './Makefile'"
fi

EOL

if [ -f "template.Rmd" ]; then
    if [ -f "Makefile" ]; then
        cp "./template.Rmd" "$SCRIPT_DIR/template.Rmd"
        echo "Template copied to $SCRIPT_DIR."

        cp "./Makefile" "$SCRIPT_DIR/Makefile"
        echo "Makefile copied to $SCRIPT_DIR."

        chmod +x "$SCRIPT_PATH"

        if ! grep -q 'export PATH="\$HOME/bin/Rmarkless:\$PATH"' ~/.bashrc; then
            echo 'export PATH="$HOME/bin/Rmarkless:$PATH"' >> ~/.bashrc
            echo "Folder ~/bin/Rmarkless added to PATH in ~/.bashrc."
            echo "Run 'source ~/.bashrc' or restart the terminal to apply the changes."
        else
            echo "Folder ~/bin/Rmarkless is already in the PATH in ~/.bashrc."
        fi

        echo "Config concluded. You can use '$SCRIPT_NAME' anywhere."

    else
        echo "Makefile doesn't exists."
    fi
else
    echo "template.Rmd doesn't exists."
fi

