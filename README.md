# Augmented-Reality-with-Planar-Homographies
## Overview:
The project "Augmented Reality with Planar Homographies" is an advanced exploration into the realm of computational vision. It involves leveraging the mathematical concept of homographies to superimpose digital content onto real-world images, creating an augmented reality (AR) experience. Through a series of tasks, the project demonstrates the practical application of feature detection, description, and matching, as well as the robust computation of homographies and their normalization to maintain numerical stability. By utilizing algorithms like RANSAC for model fitting in the presence of noisy data, the project culminates in the development of an AR application that overlays digital images, such as a Harry Potter book cover, onto a target surface within a live video feed.

## Objectives:
### 1.Feature Detection and Matching:
      - Implement and analyze feature detection and matching using different thresholds and ratios to find correspondences between images.
      - Apply algorithms like FAST (Features from Accelerated Segment Test) and BRIEF (Binary Robust Independent Elementary Features) for efficient feature extraction.

### 2.BRIEF and SURF Descriptors:
      - Compare the BRIEF descriptor's performance with the SURF (Speeded Up Robust Features) descriptor under various image rotations.
      - Generate histograms to analyze the behavior and robustness of these descriptors to image transformations.

### 3.Homography Computation and Normalization:
      - Develop a function computeH to estimate planar homographies from point correspondences.
      - Improve the solution's numerical stability by normalizing the coordinate data before homography computation.

### 4.RANSAC Algorithm:
      - Employ the RANSAC (Random Sample Consensus) algorithm to fit the homography model to noisy data.
      - Identify the best point pairs that align with the computed model despite outliers.

### 5.Augmented Reality Application:
      - Create an AR application that overlays a digital image onto a real-world book cover using the computed homography.
      - Test and refine the application to respond to real-time video input, achieving a seamless AR effect.

## Deliverables:
### 1.Code Implementation:
      - A comprehensive set of MATLAB scripts that perform feature detection, descriptor comparison, homography computation, and AR application development.

### 2.Visual Results:
      - A collection of images and histograms visualizing the feature matching process, descriptor behavior, and the effectiveness of the homography transformation.
      - A video demonstrating the final AR application in action, with digital content accurately overlaid onto the target surface.

### 3.Report:
      - A detailed report documenting the approach, methodology, and findings of each task within the project.
      - The report should include visualizations, code snippets, and a discussion on the challenges faced and solutions implemented.

#### This project offers a hands-on experience with the challenges and techniques of computational vision in the context of augmented reality, promoting a deeper understanding of both theoretical concepts and practical applications.
