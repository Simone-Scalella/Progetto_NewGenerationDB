#!/bin/bash

sc1 () {
    java -jar obda-mixer.jar --conf=configuration-sc1.conf &> results/mixer-out-sc1.txt
}

sc2 () {
    java -jar obda-mixer.jar --conf=configuration-sc2.conf &> results/mixer-out-sc2.txt
}

hom () { # homogeneous
    java -jar obda-mixer.jar --conf=configuration-hom.conf &> results/mixer-out-hom.txt
}

het () { # heterogeneous
    java -jar obda-mixer.jar --conf=configuration-het.conf &> results/mixer-out-het.txt
}

homOpt () {
    java -jar obda-mixer.jar --conf=configuration-hom-opt.conf &> results/mixer-out-hom-opt.txt
}

homOptMat () {
    java -jar obda-mixer.jar --conf=configuration-hom-opt-matv.conf &> results/mixer-out-hom-opt-matv.txt
}

hetOpt () {
    java -jar obda-mixer.jar --conf=configuration-het-opt.conf &> results/mixer-out-het-opt.txt
}

hetOptMat () {
    java -jar obda-mixer.jar --conf=configuration-het-opt-matv.conf &> results/mixer-out-het-opt-matv.txt
}

# profiles: source-sc1, source-sc2, homogeneous, heterogeneous

do_tests () {
    for i in 2000000 # 200000 # 2000000 20000
    do
        DIR=$PWD
        cd ../../edbt2022-docker
        cd $DIR
        echo "./replace_n_lines_cmd.sh \"SCALE=${i}\" 3 ../../edbt2022-docker/.env"
        ./replace_n_lines_cmd.sh "SCALE=${i}" 3 ../../edbt2022-docker/.env
        # for j in sc1 sc2
        # do
        #     echo "./replace_n_lines_cmd.sh \"COMPOSE_PROFILES=${j}\" 2 ../../edbt2022-docker/.env"
        #     ./replace_n_lines_cmd.sh "COMPOSE_PROFILES=${j}" 2 ../../edbt2022-docker/.env
        #     DIR=$PWD
        #     cd ../../edbt2022-docker
        #     docker-compose down -v --remove-orphans
        #     `docker-compose up &> docker_out.tmp` & # subshell with docker. Check docker_out.tmp to understand when docker has been initialized
        #     echo "Check docker_out.tmp. When docker has been correctly initialized, press 'y' to continue..."
        #     while [ true ]
        #     do
        #         read -n 1 k <&1
        #         if [[ $k = y ]] ; then
        #             printf "\nResuming tester.sh\n"
        #             break
        #         fi
        #     done
        #     cd $DIR
        #     echo "java -jar obda-mixer.jar --conf=configuration-${j}.conf &> results/mixer-out-${j}.txt"
        #     java -jar obda-mixer.jar --conf=configuration-${j}.conf &> results/mixer-out-${j}.txt
	# done
        for j in het # hom
        do
            echo "./replace_n_lines_cmd.sh \"COMPOSE_PROFILES=${j}\" 2 ../../edbt2022-docker/.env"
            ./replace_n_lines_cmd.sh "COMPOSE_PROFILES=${j}" 2 ../../edbt2022-docker/.env
            DIR=$PWD
            cd ../../edbt2022-docker
#            docker-compose down -v --remove-orphans
#            `docker-compose up &> docker_out.tmp` & # subshell with docker. Check docker_out.tmp to understand when docker has been initialized
            echo "Check docker_out.tmp. When docker has been correctly initialized, press 'y' to continue..."
            while [ true ]
            do
                read -n 1 k <&1
                if [[ $k = y ]] ; then
                    printf "\nResuming tester.sh\n"
                    break
                fi
            done
            cd $DIR
            echo "java -jar obda-mixer.jar --conf=configuration-${j}.conf &> results/mixer-out-${j}.txt"
            java -jar obda-mixer.jar --conf=configuration-${j}.conf &> results/mixer-out-${j}.txt
            echo "java -jar obda-mixer.jar --conf=configuration-${j}-opt.conf &> results/mixer-out-${j}-opt.txt"
            java -jar obda-mixer.jar --conf=configuration-${j}-opt.conf &> results/mixer-out-${j}-opt.txt
            echo "java -jar obda-mixer.jar --conf=configuration-${j}-opt-matv.conf &> results/mixer-out-${j}-opt-matv.txt"
            java -jar obda-mixer.jar --conf=configuration-${j}-opt-matv.conf &> results/mixer-out-${j}-opt-matv.txt
        done
    done
}

do_tests
