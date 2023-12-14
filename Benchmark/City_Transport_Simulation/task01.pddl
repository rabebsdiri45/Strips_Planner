(define (problem city-transport)
  (:domain public_transport)

  ; Define the specific objects in the problem
  (:objects
    bus1 - bus
    passenger1 passenger2 - passenger
    stop1 stop2 stop3 - bus_stop
  )

  ; Define the initial state of the world
  (:init
    (at_bus bus1 stop1)
    (at_passenger passenger1 stop1)
    (at_passenger passenger2 stop2)
    (waiting passenger1 stop1)
    (waiting passenger2 stop2)
    (has_destination passenger1 stop2)
    (has_destination passenger2 stop3)
    (bus_route bus1 stop1 stop2)
    (bus_route bus1 stop2 stop3)
  )

  ; Define the goal state
  (:goal
    (and
      (at_passenger passenger1 stop2)
      (at_passenger passenger2 stop3)
    )
  )
)
