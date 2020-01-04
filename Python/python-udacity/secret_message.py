import os

def rename_files():
    #1 read file names
    file_list = os.listdir("/Users/Arun/Downloads/prank")
    print(file_list)
    os.chdir("/Users/Arun/Downloads/prank")
    #2 rename file names
    for file_name in file_list:
        os.rename(file_name,file_name.translate(None,"0123456789"))
rename_files()
