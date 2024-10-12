(define (problem martian_rover_problem)
;; Specifies the domain for the Martian rover problem
    (:domain martian_rover)
    


;; Defines objects including the rover, locations, and instruments    
    (:objects
        mr1 - rover
        loc1 loc2 loc3 - location
        spectrometer camera radar - instrument
    )


;; Initial state setup with rover's initial location and instrument requirements at different locations    
    
    (:init
        (at mr1 loc1)
        (requird loc1 radar)
        (requird loc2 camera)
        (requird loc3 spectrometer)
        (requird loc3 radar)
        
        
    )

 ;; Goal state where data is transmitted from rover MR-1 at specific locations using specific instruments
    
    (:goal (and
        
        (data_transmitted mr1 loc1 radar)
        (data_transmitted mr1 loc2 camera)
        (data_transmitted mr1 loc3 spectrometer)
        (data_transmitted mr1 loc3 radar)
        (at mr1 loc1)
        
        
        
        
    ))
)