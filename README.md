

# MR-1 Mars Rover Mission - PDDL Domain and Problem

## Overview

This project implements a planning domain using **PDDL (Planning Domain Definition Language)** to simulate the autonomous operations of a next-generation Mars rover, MR-1. The rover is designed to explore the Martian terrain and gather scientific data, relying on its advanced sensor suite and scientific instruments. The purpose of this project is to model the rover’s operations and interactions in a space exploration scenario.

The domain models the navigation, data collection, and data transmission activities of the MR-1 rover using PDDL actions, with a problem instance that generates a valid plan for completing the terrain analysis mission.

## Project Structure

This project contains two key files:

1. **`domain.pddl`**: This file describes the general domain for the MR-1 Mars Rover mission, including all the actions the rover can perform, the objects involved, and the predicates that represent the world state.
2. **`problem.pddl`**: This file defines a specific mission scenario in which the MR-1 rover must navigate to different locations, collect data using its scientific instruments, process the collected data, and return the information to Earth.

## Domain Description (domain.pddl)

The domain model describes the capabilities and operations of MR-1, including:

1. **Navigation and Positioning**: The rover navigates between different locations on the Martian surface using a topological map. The rover uses sensors such as cameras and IMU for positioning and stability.
   
2. **Deployment of Scientific Instruments**: MR-1 can deploy a manipulator to interact with the environment, positioning its end-effector to collect soil samples and data.
   
3. **Data Collection**: The rover activates its scientific instruments (e.g., spectrometer, radar, cameras) based on the requirements of the specific location.
   
4. **Data Processing**: MR-1 processes the data either onboard or transmits it to Earth for further analysis.
   
5. **Decision Making**: MR-1 knows the number of data readings required for each instrument at each location.
   
6. **Data Transmission**: After completing its mission, MR-1 transmits the collected data back to Earth within an available communication window.

### Key Actions Modeled

- **Move**: Moves the rover between locations on the topological map.
- **Deploy-Instrument**: Deploys scientific instruments for terrain analysis.
- **Collect-Data**: Collects soil or environmental data using the appropriate sensor.
- **Process-Data**: Performs data analysis based on the collected data.
- **Transmit-Data**: Transmits the processed data back to Earth.

## Problem Description (problem.pddl)

The problem instance defines a specific mission scenario where the MR-1 rover needs to:

1. Navigate to a series of locations on Mars.
2. Deploy scientific instruments at each location to collect required data.
3. Process the collected data onboard.
4. Return to its base and transmit the processed data back to Earth.

### Objects

- **Locations**: Different areas of the Martian surface the rover needs to explore.
- **Instruments**: The spectrometer, radar, and cameras the rover uses to gather data.
- **Data**: Information collected from the instruments that must be processed and transmitted.

### Goals

The goal of the problem is to generate a valid sequence of actions (plan) for the MR-1 rover that successfully navigates between locations, collects the required data, processes it, and returns the data to Earth.

## Instructions

### How to Run

1. Ensure you have a PDDL-compatible planner installed (e.g., **Fast Downward**, **LPG-td**, **OPTIC**).
2. Use the planner to load both the `domain.pddl` and `problem.pddl` files.
3. Run the planner to generate a valid plan that satisfies the goals outlined in the `problem.pddl` file.


### Expected Output

The planner should generate a sequence of actions that allow MR-1 to:

- Navigate to specified locations.
- Deploy the correct instruments for each location.
- Collect and process the required data.
- Transmit the data back to Earth.
