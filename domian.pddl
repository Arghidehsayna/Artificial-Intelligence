(define (domain martian_rover)
    (:requirements :strips :typing)
    
    
;;;;;;;;;;;;;;;;;;;;;types;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Define types for entities in the domain
    (:types location instrument rover)
 
;;;;;;;;;;;;;;;;;;;;;;;;predicates;;;;;;;;;;;;;;;;;;;;;;

; Define predicates to represent properties and relationships
    (:predicates
        (at ?r - rover ?l - location)                                 ; Indicates that rover ?r is at location ?l
        (stable ?r - rover)                                           ; Indicates that rover ?r is stable
        (instrument_deployed ?r - rover ?l - location)                ; Indicates that an instrument is deployed on rover ?r at location ?l
        (instrument_on ?i - instrument)                               ; Indicates that instrument ?i is turned on
        (data_collected ?l - location ?i - instrument)                ; Indicates that data is collected at location ?l by instrument ?i
        (processed ?i - instrument ?l - location)                     ; Indicates that data from instrument ?i at location ?l is processed
        (transmission_window_open)                                    ; Indicates that the transmission window is open
        (data_transmitted ?r - rover ?l - location ?i - instrument)   ; Indicates that data from instrument ?i at location ?l by rover ?r is transmitted
        (task_completed ?r - rover ?l - location ?i - instrument)     ; Indicates that the task is completed by rover ?r at location ?l using instrument ?i
        (requird ?l - location ?i - instrument)                       ; Indicates that instrument ?i is required at location ?l
        (visit ?l - location)                                         ; Indicates that location ?l is visited
        (sensor_active)                                               ; Indicates that the sensor is active
    )


;;;;;;;;;;;;;;;;;;;;;action;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;Define action move : moving the rover from one location to another in the Martian terrain, considering parameters, preconditions, and effects.
   
    (:action move
        :parameters (?r - rover ?from ?to - location)
        :precondition (and (at ?r ?from) (not (stable ?r))
                        (not (visit ?to)))
        :effect (and (not (at ?r ?from)) (at ?r ?to) (visit ?to))
    )
 

;Define action position_stable : stabilize the rover at a location
    
    (:action position_stable
        :parameters (?r - rover ?l - location)
        :precondition (and (at ?r ?l) (not (stable ?r)))
        :effect (stable ?r)
    )
 
;Define action deploy_instrument :deploy an instrument at a location where the rover is stable.


    (:action deploy_instrument
        :parameters (?r - rover ?l - location)
        :precondition (and (at ?r ?l) (stable ?r) (not(instrument_deployed ?r ?l)))
        :effect (instrument_deployed ?r ?l)
    )
 
;Define action turn_on_instrument : activate an instrument at a location where it's deployed and required.
    
    (:action turn_on_instrument
        :parameters (?r - rover ?l - location ?i - instrument)
        :precondition (and (instrument_deployed ?r ?l) (not (instrument_on ?i))
                            (not (sensor_active)) 
                        (requird ?l ?i)
                        )
        :effect (and (instrument_on ?i) (sensor_active))
    )
    

;Define action collect_data : gather data using an instrument at a location where the rover is stable and the instrument is deployed

    
    (:action collect_data
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and (instrument_deployed ?r ?l) (instrument_on ?i) 
                    (at ?r ?l) (stable ?r) (not (data_collected ?l ?i)))
        :effect (data_collected ?l ?i)
    )
    
 
;Define action turn_off_instrument :deactivate an instrument after data collection at a location where it's deployed and data is collected.
    
    (:action turn_off_instrument
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and (instrument_deployed ?r ?l) (data_collected ?l ?i) (instrument_on ?i)
                            (sensor_active))
        :effect (and (not (instrument_on ?i)) (not (sensor_active)))
    )
    

;Define action retract_instrument:retract an instrument after deactivation and data collection at a location where it's deployed and data is collected.
    
    (:action retract_instrument
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and (instrument_deployed ?r ?l)  (not (instrument_on ?i)) 
                        (data_collected ?l ?i) (not (sensor_active)))
        :effect (not (instrument_deployed ?r ?l))
    )
    

;Define action process_data:process collected data after retracting the instrument at a location where it's collected and the rover is stable
    
    (:action process_data
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and (data_collected ?l ?i)
                        (not (instrument_deployed ?r ?l))
                        (not (processed ?i ?l))
                        (stable ?r) (not (instrument_on ?i)) (not (sensor_active)))
        :effect (processed ?i ?l)
    )


;Define action stand :destabilize the rover after data processing and transmission at a location where data is transmitted and the rover is stable
    
    (:action stand
    
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and (stable ?r)
                        (not (instrument_deployed ?r ?l))
                        (processed ?i ?l)
                        (not (sensor_active))
                        (not (instrument_on ?i))
                        (data_transmitted ?r ?l ?i)
                        (at ?r ?l)
                        )
        :effect (not (stable ?r))
    
    )
    
 
 
 ;Define action transmit_data :transmit_data" to transmit processed data after data processing at a location where data is processed and the rover is stable
    
    (:action transmit_data
        :parameters (?r - rover ?i - instrument ?l - location)
        :precondition (and  (processed ?i ?l) (stable ?r)
                            (not (data_transmitted ?r ?l ?i))
                            (at ?r ?l)
        
                        )
        :effect (data_transmitted ?r ?l ?i)
    )
    
    
    
)