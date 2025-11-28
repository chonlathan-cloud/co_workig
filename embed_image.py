import os

def embed_image():
    # อ่าน base64 จากไฟล์
    with open('eagle_base64.txt', 'r', encoding='utf-8') as f:
        base64_data = f.read().replace('\n', '')

    # อ่าน index.html แบบ ignore ตัวอักษรแปลก ๆ
    with open('index.html', 'rb') as f:
        html_content = f.read().decode('utf-8', errors='ignore')

    # แทนที่ placeholder
    new_content = html_content.replace(
        "image.src = 'PLACEHOLDER';",
        f"image.src = 'data:image/png;base64,{base64_data}';"
    )

    # เขียนกลับเป็น utf-8 ปกติ
    with open('index.html', 'w', encoding='utf-8') as f:
        f.write(new_content)

    print("Successfully embedded base64 image.")

if __name__ == "__main__":
    embed_image()