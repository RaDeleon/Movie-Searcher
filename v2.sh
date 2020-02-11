# Change this to edit the years
for Y in {2019..2020}
do
    mkdir $Y
    cd $Y
    # edit the months its going to commit
    for M in {11..12}
    do mkdir $M
        cd $M
        # Days in month it will commit to
        for D in {01..30}
        do
            mkdir $D
            cd $D
            # number of commits (Random) in this case
            for i in $(seq 1 $((1 + RANDOM % 10)))
            do
                echo "$i on $M/$D/$Y" > commit.md
                export GIT_COMMITTER_DATE="$Y-$M-$D 12:$i:00"
                export GIT_AUTHOR_DATE="$Y-$M-$D 12:$i:00" 
                git add commit.md -f 
                git commit --date="$Y-$M-$D 12:0$i:00" -m "$i on $M $D $Y"
            done
            cd ../
        done
        cd ../
    done
    cd ../
done 
git push origin master
git rm -rf 20**
git commit -am "cleanup"
git push origin master