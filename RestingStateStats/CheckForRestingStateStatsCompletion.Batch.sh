#!/bin/bash

project="${1}"
subject_file_name="${project}.RestingStateStats.subjects"
echo "Retrieving subject list from: ${subject_file_name}"
subject_list_from_file=( $( cat ${subject_file_name} ) )
subjects="`echo "${subject_list_from_file[@]}"`"

rm -f ${project}.complete.status
rm -f ${project}.incomplete.status

for subject in ${subjects} ; do
	if [[ ${subject} != \#* ]]; then
		./CheckForRestingStateStatsCompletion.sh --project=${project} --subject=${subject}  #--details
	fi
done
