# Detecting and Analyzing Facial and Eye Features of Drug Abusers Using AI

This project aims to detect illicit drug abusers by analyzing facial and eye features using AI and deep learning techniques. It provides an efficient, fast, and low-cost alternative to traditional drug testing methods, which often require invasive procedures and take time.

## 📌 Project Overview

Traditional methods of detecting drug abuse such as blood tests are time-consuming and resource-intensive. This project proposes a novel AI-based system that uses facial or eye images to predict drug abuse status. The system leverages deep learning models to analyze visual indicators commonly associated with stimulant use, such as dilated pupils and facial asymmetry.

## 🎯 Objectives

- Develop a machine learning and deep learning model to detect drug abuse using facial and eye images.
- Compare different algorithms (YOLOv8-cls, VGG19+SVM, HOG+SVM) to identify the most accurate model.
- Deliver a web-based solution for use in health and security sectors.
- Achieve high accuracy while minimizing cost and processing time.

## 🗂 Dataset

Custom-built dataset consisting of:
- 224 eye images (drug users and non-users)
- 216 facial images (drug users and non-users)

Sources include FERET and various research datasets. Images were preprocessed using normalization and enhancement techniques like DFDNet.

## ⚙️ Models & Approaches

| Technique       | Accuracy (Face) | Accuracy (Eye) |
|----------------|------------------|----------------|
| VGG19 + SVM    | 98%              | 88%            |
| HOG + SVM      | 97%              | 75%            |
| YOLOv8-cls     | **98.9%**        | **92.86%**     |

YOLOv8-cls showed the highest accuracy and was chosen as the primary model.



## 🧑‍💻 Team Members

- [Sara Aljuhani](https://github.com/sara-aljuhani) 
- [Nada Alharbi](https://github.com/Nada-T-Alharbi)
- [Ruba Alharbi](https://github.com/Rubabdran)
- Raud Alsehli
- Areej Alsahli

## 📍 University

**Taibah University** – College of Computer Science and Engineering

## 📅 Academic Year

Second Semester 2023-2024

## 🔮 Future Work

- Increase dataset size for better generalization.
- Expand detection to include multiple types of drugs.
- Enhance the web interface for deployment at airports or clinics.
