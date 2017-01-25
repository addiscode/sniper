#!/usr/bin/nawk
BEGIN {

	printf"Boom v1.0.0\n"
	printf "number of arguments %i\n", ARGC
	#print "Enter agentId "
	#getline agentId < "-"

	#SET FIELD SEPARATOR
	FS = "::"
}

match($1, sname "$") {

	
	print "variables ", $2
	split($2,k,",");
	for(x in k) {
		
		print "Enter ", k[x]
		#print x, k[x]
		getline map[k[x]] < "-"
	}

	#for(i in map) print i, map[i]
	#substitute variables in the snippet

	for(i in map) {
		#cmd = sprintf("sed s/@%s/%s/", i, map[i])
		gsub(sprintf("@%s",i),map[i], $3)	
	}

	printf "command [%s]\n",$3
	system($3)
	
}


END {

	print "END"

}
