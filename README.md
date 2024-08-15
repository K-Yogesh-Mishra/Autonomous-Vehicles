
**https://www.electronicwings.com/users/YogeshMishra/projects/4563/classify-object-behavior-to-enhance-the-safety-of-autonomous-vehicles**
# Description
## ABSTRACT
The rapid progression of autonomous vehicles (AVs) necessitates the implementation of advanced safety measures to ensure their dependable and secure operation in a variety of environments. A critical element in enhancing AV safety is the precise classification and prediction of the behavior of surrounding objects, such as other vehicles, pedestrians, cyclists, and static obstacles. This project is dedicated to developing a robust object behavior classification framework utilizing machine learning and deep learning techniques. By integrating sensor data from radar and cameras, the proposed system processes real-time environmental information to accurately identify and categorize object behaviors. The project underscores the importance of feature extraction, data fusion, and model optimization in achieving high classification accuracy. Moreover, it addresses challenges related to dynamic environments, occlusions, and varying weather conditions, providing solutions to improve the robustness of the classification system.

## STEP 1: Design simulation scenarios
To design the simulation scenarios, the Automated Driving Toolbox is required. The driving scenario designer is used to design scenario test cases, configure sensors, and generate synthetic object detections. Driving Scenario Designer app helps us to create artificial driving scenarios for testing autonomous vehicles. The test scenarios are developed using the Driving Scenario Designer app which allows the users to create a scenario by drag and drop interface which will enable them to place roads, vehicles, pedestrians, and other actors.

<img width="330" alt="image" src="https://github.com/user-attachments/assets/1c645771-f6dc-417b-81cc-e35a4eb06699">


## STEP 2: Create a versatile scenario dataset to assess object behavior
A versatile dataset containing both safe and risky scenario test cases is required for the training and testing of the machine-learning model. So, 21 scenario cases have been developed for the implementation of this model.

Safe scenario:

<img width="330" alt="image" src="https://github.com/user-attachments/assets/1c3d2386-d1f9-4b03-96d3-42de23468f83">

Risky scenario:

<img width="330" alt="image" src="https://github.com/user-attachments/assets/d726f162-4f3a-408d-ad06-b24cb585f1dc">

## STEP 3: Mounting the sensor on the ego vehicle
Sensors, such as radar and camera, are to be mounted on the ego vehicle to acquire the data. These sensors are placed in such a way that they get maximum coverage of the whole scenario. These sensors acquire the data from the scenario test cases and are stored in a MATLAB function from which the sensor data can be extracted.

<img width="330" alt="image" src="https://github.com/user-attachments/assets/3009ee14-bfca-4966-adf4-9096c876f1a3">

A Simulink model is formed with this scenario test cases.

<img width="330" alt="image" src="https://github.com/user-attachments/assets/60341f7a-f351-4cc5-98a1-7a541a1b953d">

The scenario environment is visible clearly in the bird's eye plot wherein we get a clear view of the scenario, including the sensors.

## STEP 4: Acquiring sensor data
This scenario data is then exported into a MATLAB function. This MATLAB function contains all the data of the sensor and scenario readings. The sensor and scenario data from all the test cases are loaded into a single file to implement the machine-learning algorithms.

The Scenario Reader app extracts the positions of actors and roads from scenario files created with the Driving Scenario Designer app. It then outputs this information in the coordinate system of either the ego vehicle or the world coordinate system.


### Loading data into a single file and labeling the data:

All the scenario data sets are loaded into a single file for the study of the sensor data and to implement the machine learning algorithm on the loaded data. So, for the implementation, we need to label the data into safe and risky data for training purposes.


## Step 5: Apply machine learning algorithms for training and testing
The object classification system operates by continuously monitoring the sensor's readings and bird’s eye view plot to detect sudden changes in the movement of the other actors in the scenario which indicate a potential accident or collision. For this classification model, a machine learning model is implemented on this sensor data and scenario data. For applying machine-learning algorithms in the MATLAB, Statistics and Machine-Learning Toolbox is required. The in-built functions for various machine-learning algorithms are used to implement this model.


## STEP 6: Testing of the model
For testing purposes, a new test scenario test case is developed and then it is checked for the object behavior classification. Here, for an example test case, a risky scenario test case is developed and our object behavior classification model is implemented on it. 

Test scenario:

<img width="330" alt="w" src="https://github.com/user-attachments/assets/52767eda-3b3d-4d60-a8f4-53f71afe43f3">

Output:

![image](https://github.com/user-attachments/assets/2910e2f4-e91d-411c-8c43-02fd3748d2bc)

3D model:

Safe scenario

<img width="437" alt="image" src="https://github.com/user-attachments/assets/86136a1c-8184-4eb9-acfc-79080e800aef">

Risky scenario:

<img width="437" alt="image" src="https://github.com/user-attachments/assets/62579335-112b-41f7-8114-8c7499934f45">






