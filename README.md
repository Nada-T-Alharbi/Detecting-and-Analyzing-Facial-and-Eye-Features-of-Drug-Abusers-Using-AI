# Detecting and Analyzing Facial and Eye Features of Drug Abusers Using AI

This project aims to detect illicit drug abusers by analyzing facial and eye features using AI and deep learning techniques. It provides an efficient, fast, and low-cost alternative to traditional drug testing methods, which often require invasive procedures and take time.

## 📌 Project Overview

Traditional methods of detecting drug abuse such as blood tests are time-consuming and resource-intensive. This project proposes a novel AI-based system that uses facial or eye images to predict drug abuse status. The system leverages deep learning models to analyze visual indicators commonly associated with stimulant use, such as dilated pupils and facial asymmetry.

## 🎯 Objectives

- Develop a machine learning and deep learning model to detect drug abuse using facial and eye images.
- Compare different algorithms (YOLOv8-cls, VGG19+SVM, HOG+SVM) to identify the most accurate model.
- Deliver a web-based solution for use in health and security sectors.
- Achieve high accuracy while minimizing cost and processing time.

## 🧪 Technologies Used

- Python
- TensorFlow & Keras
- Scikit-learn
- OpenCV
- YOLOv8-cls
- Django
- HTML / CSS / JavaScript

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

## 🖥️ How to Run

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
pip install -r requirements.txt
python manage.py runserver
```

> Note: Requires Python 3.x, Django, and relevant packages in `requirements.txt`.

## 🧑‍💻 Team Members

- Sara Mansoor Aljuhani – 4050562
- Nada Thiab Alharbi – 4250814
- Ruba Talal Alharbi – 4050081
- Raud Mohammed Alsehli – 4052970
- Areej Farhan Alsahli – 4054826

## 📍 University & Supervision

**Taibah University** – College of Computer Science and Engineering  
Supervised by Dr. Ayman Ibrahim Hamza Noor  
In collaboration with Dr. Tawfeeq Reda Alsanoosy

## 📅 Academic Year

Second Semester – 1445H / 2023-2024

## 🔮 Future Work

- Increase dataset size for better generalization.
- Expand detection to include multiple types of drugs.
- Enhance the web interface for deployment at airports or clinics.