#!/bin/bash

# Arrays for randomization
titles=("Sunlit" "Sweet" "Bitter" "Lost" "Broken" "Absent" "Cherished" "Quiet" "Tearful" "Empty" "Solitary")
nouns=("Face" "Day" "Place" "Hands" "Gate" "Home" "Sky" "Heart" "Eyes" "Sleep")
tags=("sad" "solitude" "joy" "free verse" "love")

# Target directory
mkdir -p content/poems

for i in {1..25}
do
    DAY=$(printf "%02d" $(( (i % 28) + 1 )))

    # Randomize metadata
    T1=${titles[$((RANDOM % 10))]}
    T2=${nouns[$((RANDOM % 10))]}
    TAG1=${tags[$((RANDOM % 5))]}
    TAG2=${tags[$((RANDOM % 5))]}
    
    # Ensure Tag 2 isn't the same as Tag 1 for better testing
    [[ "$TAG1" == "$TAG2" ]] && TAG2="general"

    # Create the file
    cat <<EOF > "content/poems/poetry-$i.md"
---
title: "$T1 $T2 No. $i"
draft: false
date: 2026-01-${DAY}
summary: "I was inspired by the $T1 $T2 when writing this poem. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."
tags: 
    - $TAG1
    - $TAG2
params: 
    cover: images/poetry-$i-cover.jpg
---

At vero eos et accusam $T2, 
The $T1 stet clita kasd gubergren, no sea takimata
And though the $TAG1 is now $TAG2,
Maecenas nec odio et ante tincidunt tempus.

Nulla consequat massa quis enim. 
Donec pede justo, 
fringilla vel, 
aliquet nec, 
vulputate eget, 
arcu. 

In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. 
Nullam dictum felis eu pede mollis pretium. 
Integer tincidunt. 
Cras dapibus. 

Vivamus elementum semper nisi.
EOF
done

echo "Successfully generated 25 unique poems in /content/poems/"