import os
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseBadRequest, JsonResponse
import pandas as pd
import numpy as np
from ultralytics import YOLO
from django.core.files.storage import default_storage

import cv2
from ultralytics import YOLO
import numpy as np
from PIL import Image
import tensorflow as tf


def detect(request,index):
    model = YOLO("eye.pt")
    eye_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_eye.xml")
    interpreter = tf.lite.Interpreter(model_path="face.tflite")
    interpreter.allocate_tensors()

    file =  request.FILES['image']
    selectedIndex = index  # Get index -> eye or face
    print(selectedIndex)
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    filename = default_storage.save(os.path.join(BASE_DIR, file.name), file)
            

    if selectedIndex == 0:
        # eye
        image = cv2.imread(filename)
        gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        eyes = eye_cascade.detectMultiScale(gray_image, 1.3, 5)
        print(eyes,"imageimageimageimage",eye_cascade)
        file_path = os.path.join(BASE_DIR, file.name)
        if default_storage.exists(file_path):
            default_storage.delete(file_path)
        tot_abnormal_prob = 0
        tot_normal_prob = 0
        eye_count = 0

        for ex, ey, ew, eh in eyes:
            cropped_eye = image[ey : ey + eh, ex : ex + ew]
            eye_count += 1
            eye_img_resized = cv2.resize(cropped_eye, (512, 512))
            eye_img_rgb = cv2.cvtColor(eye_img_resized, cv2.COLOR_BGR2RGB)
            results = model.predict(eye_img_rgb)
            probs = results[0].probs.data
            abnormal_prob = probs[0].item()
            normal_prob = probs[1].item()
            tot_abnormal_prob += abnormal_prob
            tot_normal_prob += normal_prob
        if eye_count==0:
            return JsonResponse({'status':'0','msg':'Use another photo'})
        avg_abnormal_prob = tot_abnormal_prob / eye_count
        avg_normal_prob = tot_normal_prob / eye_count
        print(avg_abnormal_prob,"avg_abnormal_probavg_abnormal_prob")

        if avg_abnormal_prob > avg_normal_prob:
            return JsonResponse({'status':'1','msg':'Abnormal'})
        else:
            return JsonResponse({'status':'1','msg':'Normal'})
    elif selectedIndex == 1:
        img = Image.open(filename).convert("RGB")
        img = img.resize((224, 224), Image.Resampling.LANCZOS)
        img_array = np.array(img, dtype=np.float32)
        img_array = img_array / 255.0
        img_array = np.transpose(img_array, (2, 0, 1))
        img_array = np.expand_dims(img_array, axis=0)

        input_details = interpreter.get_input_details()
        output_details = interpreter.get_output_details()
        interpreter.set_tensor(input_details[0]["index"], img_array)
        interpreter.invoke()
        output_data = interpreter.get_tensor(output_details[0]["index"])
        predicted_class = int(np.argmax(output_data))
        class_name = ""
        file_path = os.path.join(BASE_DIR, file.name)
        if default_storage.exists(file_path):
            default_storage.delete(file_path)
        if predicted_class == 0:
            class_name = "Abnormal"
        else:
            class_name = "Normal"
        return JsonResponse({'status':'1','msg':class_name})
        # predicted_probability = float(output_data[0][predicted_class])
        # response = jsonify(
        #         {"result": class_name, "probability": round(predicted_probability, 2)}
        #     )

    
    # return response


def homepage(request):
    
    if request.method == 'POST':
        


        model_type=request.POST.get("type")
        if model_type=="eye":
            index=0
        elif model_type=="face":
            index=1            
        
        try:
            detect(request,index)
            
            # Process the results
            return detect(request,index)
        except TypeError as e:
            error_message = f"Unsupported image type. {str(e)}"
            return HttpResponseBadRequest(error_message)
    return render(request, 'index.html')  