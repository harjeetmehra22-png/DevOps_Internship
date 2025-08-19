#!/bin/bash
# Linux Basics Automation Script

echo "Starting Linux Basics Task..."

# Step 1: Navigation
echo "Current directory:"
pwd
cd ~
echo "Navigated to home directory"
ls -a

# Step 2: File & Directory Management
mkdir practice
cd practice
touch temp.txt
mv temp.txt myfile.txt
echo "Created and renamed file inside 'practice' folder"

# Step 3: Editing
echo "This is content file" > myfile.txt
nano myfile.txt

# Step 4: Searching
echo -e "hello world\nthis is a test\nhello again" > search.txt
grep 'hello' search.txt

# Step 5: Permissions
echo -e "#!/bin/bash\necho 'This is my script'" > myscript.sh
chmod +x myscript.sh
./myscript.sh

# Step 6: Help
man mkdir

echo "Linux basics workflow completed."
