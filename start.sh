cd frontend/ && npm install &&npm run serve &
P1=$!
fresh &
P2=$!
wait $P1 $P2
