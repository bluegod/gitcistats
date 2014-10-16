#!/bin/bash
#
# gitcistats v0.1Beta - Shows the top GIT committers and outputs this into a HTML file
# Latest version:
# https://github.com/bluegod/gitcistats

OUTPUT_PREFIX="gitcistats"

timestamp=$( date +%Y-%m-%d )
output_file=$OUTPUT_PREFIX-$timestamp.html

cat <<EOF > $output_file
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top commiters - $timestamp</title>
    <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
</head>
<body>
<table class="pure-table">
    <thead>
        <tr>
            <th>#</th>
            <th>Num commits</th>
            <th>Author</th>
        </tr>
    </thead>
<tbody>
EOF

git shortlog -s -n | awk '{ print "<tr><td>" FNR "</td><td>" $1 "</td><td>" $2" "$3 "</td></tr>" }
     END   { print "</tbody></table>" }'  >> $output_file

echo "</body>" >> $output_file
echo "</html>" >> $output_file
