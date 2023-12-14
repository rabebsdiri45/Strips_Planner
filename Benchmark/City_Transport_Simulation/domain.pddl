(define (domain public_transport)
  (:requirements :strips :typing)
  (:types
    bus passenger - object
    bus_stop - location
     location - object
  )

  (:predicates
    (at_bus ?b - bus ?bs - bus_stop)
    (at_passenger ?p - passenger ?bs - bus_stop)
    (waiting ?p - passenger ?bs - bus_stop)
    (bus_route ?b - bus ?bs1 ?bs2 - bus_stop)
    (has_destination ?p - passenger ?bs - bus_stop)
    (passenger_boarded ?p - passenger ?b - bus)
  )

  (:action board_bus
    :parameters (?p - passenger ?b - bus ?bs - bus_stop)
    :precondition (and (at_passenger ?p ?bs) (at_bus ?b ?bs) (waiting ?p ?bs))
    :effect (and (passenger_boarded ?p ?b) (not (waiting ?p ?bs)) (not (at_passenger ?p ?bs)))
  )

  (:action disembark_bus
    :parameters (?p - passenger ?b - bus ?bs - bus_stop)
    :precondition (and (passenger_boarded ?p ?b) (has_destination ?p ?bs) (at_bus ?b ?bs))
    :effect (and (at_passenger ?p ?bs) (not (passenger_boarded ?p ?b)))
  )

  (:action move_bus
    :parameters (?b - bus ?bs1 ?bs2 - bus_stop)
    :precondition (and (bus_route ?b ?bs1 ?bs2) (at_bus ?b ?bs1))
    :effect (and (at_bus ?b ?bs2) (not (at_bus ?b ?bs1)))
  )
)
