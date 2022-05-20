export CODACY_REPORTER_VERSION=$CODACY_REPORTER_VERSION
export CODACY_PROJECT_TOKEN=$CODACY_PROJECT_TOKEN
report_array=$(printf "%s" "$CODACY_COVERAGE_REPORTS" | cut -d',' -f1)

params=''
for report in $report_array
do
    if [ -n "$report" ]
    then
        params="$params -r $report"
    fi
done

if $CODACY_SKIP; then
    skip_option="--skip"
else
    skip_option=""
fi


if [ -x "$(command -v curl)" ]; then
    curl -Ls https://coverage.codacy.com/get.sh > get.sh
elif [ -x "$(command -v wget)" ] ; then
    wget -qO - https://coverage.codacy.com/get.sh > get.sh
else
    printf "Could not find curl or wget, please install one."
fi

chmod +x get.sh

get.sh report $params --partial $skip_option &&\
get.sh final $skip_option
