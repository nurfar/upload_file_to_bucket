#/bin/bash
. ./libs/libraries.sh
file_name_path=$1
bucket_name=$2

check_file_exists
check_bucket_exists

check_bucket_file=$(aws s3api list-objects --bucket $bucket_name --query 'Contents[*].Key' --output text | grep -o $file_name_path )
	#echo $file_name_path

file_name_path_2=$(echo $file_name_path | awk -F "/" '{print $NF}')
	#echo $file_name_path_2

file_name_path_3=$(echo $file_name_path | grep -q $file_name_path_2)


if [ "$check_bucket_file" = "$file_name_path_2" ]; then
	echo "$file_name_path exists in the bucket"
	exit 22
else 
	echo "$file_name_path doesn't exists in the bucket and it will be copied"
	
fi
