fresh &
P1=$!
cd frontend/ && npm run serve &
P2=$!
wait $P1 $P2
