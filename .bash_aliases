alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

kt() {
    if [ -f "$1".kt ]; then
        if kotlinc "$1".kt -include-runtime -d "$1".jar; then 
            echo "Compilation succeeded!"
            java -jar "$1".jar
        else
            echo "Compilation failed!"
        fi
    else 
        echo "File $1.kt not found!"
    fi
}

kr() {
    if [ -f "$1".jar ]; then
        java -jar "$1".jar
    else
        echo "File $1.jar not found!"
    fi
}

mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

contest ()
{
    if [ -d ~/competitive-programming/Contests/"$1" ]; then
        cd ~/competitive-programming/Contests/"$1"
    else
        cd ~/competitive-programming/Contests
        mkdir "$1"
        mkdir "$1"/bits
        cp ../stdc++.h "$1"/bits
        cp ../Makefile "$1"
        cd $1
        g++ -std=c++17 bits/stdc++.h
    fi
}

cf ()
{
    if [ -d ~/competitive-programming/ojs/cf/"$1" ]; then
        cd ~/competitive-programming/ojs/cf/"$1"
    else
        cd ~/competitive-programming/ojs/cf/
        mkdir "$1"
        mkdir "$1"/bits
        cp ../../stdc++.h "$1"/bits
        g++ -std=c++17 bits/stdc++.h
        cp ../../Makefile "$1"
        cd $1
    fi
}

rsb () 
{
    service bluetooth restart 
}

getbits ()
{
    mkdir bits
    cp /home/gafeol/competitive-programming/stdc++.h ./bits/
    g++ -std=c++17 bits/stdc++.h
    cp ~/competitive-programming/Makefile ./
}

export PATH=/usr/lib/postgresql/10.2/bin/:$PATH
