from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
import cv2
from ultralytics import YOLO
import numpy as np
from PIL import Image
import tensorflow as tf

app = Flask(__name__)
model = YOLO("eye.pt")
eye_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_eye.xml")
interpreter = tf.lite.Interpreter(model_path="face.tflite")
interpreter.allocate_tensors()


@app.route("/api/detect", methods=["POST"])
def detect():
    file = request.files["image"]
    selectedIndex = int(request.form.get("selectedIndex"))  # Get index -> eye or face
    print(selectedIndex)

    filename = secure_filename(file.filename)
    file.save(filename)

    if selectedIndex == 0:
        # eye
        image = cv2.imread(filename)
        gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        eyes = eye_cascade.detectMultiScale(gray_image, 1.3, 5)

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

        avg_abnormal_prob = tot_abnormal_prob / eye_count
        avg_normal_prob = tot_normal_prob / eye_count
        if avg_abnormal_prob > avg_normal_prob:
            response = jsonify(
                {"result": "Abnormal", "probability": round(avg_abnormal_prob, 2)}
            )
        else:
            response = jsonify(
                {"result": "Normal", "probability": round(avg_normal_prob, 2)}
            )
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
        if predicted_class == 0:
            class_name = "Abnormal"
        else:
            class_name = "Normal"
        predicted_probability = float(output_data[0][predicted_class])
        response = jsonify(
                {"result": class_name, "probability": round(predicted_probability, 2)}
            )

    return response


if __name__ == "__main__":
    app.run(debug=True)
