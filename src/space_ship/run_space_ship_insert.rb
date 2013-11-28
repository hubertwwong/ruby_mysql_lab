require_relative "space_ship_insert"

ss = SpaceShipInsert.new
#ss.basic_insert
#ss.bench_naive(1000)
#ss.bench_transaction(1000)
ss.bench_csv
