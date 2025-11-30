
import os

def embed_image():
   
    with open('eagle_base64.txt', 'r') as f:
        base64_data = f.read().replace('\n', '')


    with open('index.html', 'r') as f:
        html_content = f.read()


    new_content = html_content.replace("image.src = 'PLACEHOLDER';", f"image.src = 'data:image/png;base64,{base64_data}';")


    with open('index.html', 'w') as f:
        f.write(new_content)

    print("Successfully embedded base64 image.")

if __name__ == "__main__":
    embed_image()
