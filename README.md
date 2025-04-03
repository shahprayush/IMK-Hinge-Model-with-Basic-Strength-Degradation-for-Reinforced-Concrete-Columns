# IMK Hinge Model with Basic Strength Degradation for Reinforced Concrete Columns

## Description
This MATLAB script implements the Ibarra-Medina-Krawinkler (IMK) hinge model to simulate the nonlinear hysteretic behavior of reinforced concrete columns under seismic loading, specifically focusing on the basic strength degradation type. The script calculates the backbone curve for the moment-rotation relationship, incorporating key points such as yield, capping (peak strength), and post-capping degradation. It uses structural and material properties provided as inputs to compute these parameters and generates a plot of the normalized moment (M/My) versus rotation. This model is useful for researchers, students, and engineers studying the seismic performance of reinforced concrete structures.

## Detailed Overview
The code models a reinforced concrete column by:
1. **Defining Input Parameters**: Includes geometric dimensions, material properties, reinforcement details, and axial load.
2. **Calculating Key Parameters**: Computes yield curvature, yield moment, capping moment, and rotation capacities using empirical formulas and structural mechanics principles.
3. **Plotting the Backbone Curve**: Visualizes the moment-rotation relationship, showing elastic behavior up to yield, plastic deformation to the capping point, and strength degradation post-capping.

The resulting plot displays four key points:
- `(0, 0)`: Origin (no moment, no rotation).
- `(theta_y, 1)`: Yield point (normalized moment = 1).
- `(theta_y + theta_cap_pl, Mc/My)`: Capping point (peak strength).
- `(theta_y + theta_cap_pl + theta_pc, 0)`: Post-capping point (moment drops to zero).

## Input Parameters
The script requires the following inputs, which are hardcoded in the provided code but can be modified by users:
- **Geometric Properties**:
  - `b = 400;` % Width of the column (mm)
  - `h = 400;` % Depth of the column (mm)
  - `L = 1600;` % Span length (mm)
  - `d_prime = 62;` % Effective cover (mm)
- **Material Properties**:
  - `fc_prime = 25.6;` % Concrete cylinder strength (MPa)
  - `fy = 474;` % Longitudinal steel yield stress (MPa)
  - `fy_sh = 333;` % Transverse steel yield stress (MPa)
  - `Es = 200000;` % Modulus of elasticity of steel (MPa)
  - `Ec = 29934;` % Modulus of elasticity of concrete (MPa)
- **Loading**:
  - `P = 819000;` % Axial load (N)
- **Reinforcement Details**:
  - `Db_c = 20;` % Diameter of compression bars (mm)
  - `n_c = 3;` % Number of compression bars
  - `Db_s = 20;` % Diameter of tension bars (mm)
  - `n_s = 3;` % Number of tension bars
  - `s = 80;` % Spacing of shear reinforcement (mm)
  - `db_sh = 12;` % Diameter of shear reinforcement bars (mm)
  - `Db_w = 20;` % Diameter of web bars (mm)
  - `n_w = 2;` % Number of web bars
- **Other**:
  - `asl = 0;` % Undefined in the code (possibly axial strain, unused in calculations)

**Note**: Ensure all units are consistent (e.g., lengths in mm, forces in N, stresses in MPa) when modifying inputs.

## How to Use
1. **Requirements**: MATLAB installed on your system.
2. **Running the Code**:
   - Copy the provided code into a `.m` file (e.g., `IMK_hinge_model.m`).
   - Open MATLAB, navigate to the file location, and run the script.
   - The script will compute the backbone curve and display a plot titled "Moment-Rotation Plot".
3. **Modifying Parameters**: Edit the input variables at the top of the script to analyze different column configurations.
4. **Output**: A figure showing the normalized moment (M/My) versus rotation, with a grid and labeled axes.

## Assumptions and Limitations
- **Column Geometry**: Assumes a rectangular cross-section with symmetric reinforcement.
- **Material Behavior**: Uses simplified empirical relationships for concrete and steel behavior.
- **IMK Model**: Implements the "basic strength degradation" variant, which may not account for cyclic degradation or other advanced features of the IMK model.
- **No Error Handling**: The script assumes all inputs are valid and does not include checks for physical consistency.

## Example Output
Using the default parameters, the script generates a moment-rotation curve with:
- Yield rotation (`theta_y`) based on minimum yield curvature and span length.
- Capping moment (`Mc`) as a function of yield moment, axial load ratio, and concrete strength.
- Plastic and post-capping rotations (`theta_cap_pl`, `theta_pc`) influenced by shear reinforcement and axial load effects.

The plot visually represents the column's behavior from elastic response to complete strength loss.

## Credits
- **Author**: Prayush Shah
- **Roll Number**: 24V0052
- **Institution**: Indian Institute of Technology, Bombay

## Potential Enhancements
- Add comments to clarify intermediate calculations (e.g., purpose of `a_t`, `a_c`, `ky_c`, etc.).
- Include references to the IMK model formulation (e.g., Ibarra et al., 2005) if applicable.
- Implement user input prompts or a function structure for easier parameter modification.
- Add cyclic loading capabilities to extend beyond the backbone curve.
