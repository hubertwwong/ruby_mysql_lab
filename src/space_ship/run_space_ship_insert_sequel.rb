require_relative "space_ship_insert_sequel"

ss = SpaceShipInsert.new
ss.basic_insert
#ss.bench_naive(1000)
#ss.bench_transaction(1000)
