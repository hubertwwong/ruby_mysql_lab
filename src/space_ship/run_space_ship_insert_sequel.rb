require_relative "space_ship_insert_sequel"

ss = SpaceShipInsertSequel.new
#ss.basic_insert
ss.bench_naive(1000)
ss.bench_transaction(1000)
ss.bench_transaction2(1000)
