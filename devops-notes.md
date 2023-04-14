#DevOps Zero to Hero

## Day 1:

What is DevOps?

process of improving the delivery by ensuring below checks
proper Automation, that the quality in place, continous monitoring and testing.

## Day 2:

What is SDLC?
         
is a process followed by industry to `Design`, `Develop` and Test a high quality product.
it includes:

`Planning`(Requirements), `Defining`(Documentation), `Designing`(LLD, HLD), `Building`(Developing, storing source code in centralized repo(git)), `Testing`(deployed in testing environment for QA), `Deploying`(later deployed in production for end-users/customers).
    
Why is it important in DevOps? Where does it fit in SDLC? Can DevOps improve SDLC process?

DevOps ensures that the building, testing and deployment is automated and no manual intervention is required to achieve efficiency for product delivery.

## Day 3:

Virtual Machines

hypervisor breaks a server's resourses logically to create multiple VM's(logical isolation).
        
What is a server?

are physical servers that are used to run our applications / product.

## Day 4: Creating a Virtual Machine with AWS, Azure
    
    
## Day 5: Create EC2, S3 with Console, CLI and Boto3

## Day 6: Linux

Linux is Free, Open source, secure, has distributions and fast.
Kernel is the heart of OS and responsible for Device Management, Memory Management, Process, Handling System Calls.
It establishes the communication between Hardware and the OS.

### Shell Scripting Fundamentals:

Commands are most common across distributions.
 
## Day 7: AWS Project with Shell

## Day 8: DevOps Project using Shell

## Day 9: Git and Github

Frequently used git commands:

```
git add . # To track the changes in the mentioned file / directory
git commit -m "first commit" # commiting the changes in local
git push # pushing the changes to the remote respository
git log  # to see the changes made in the file / directory.
git reset --hard <commit id> # to restore the to the previous commit. 
```

## Day 10: Git Branching

The Developers will be working on different `feature branches` which may be exclusive for specific features, once the feature is complete they merge with the `master/main branches`. 

When they want to release the feature to customers, they will create an new `release branch`.

Sometimes we may have `hotfix branches` when there are issues in production, which involves the same process - having the feature branch later merging with master then to release branch to fix the issue in production.

Note:  Code will be shipped to production from release branches. The master branch must be upto date.

## Day 11: Git Commands for DevOps

```
git init  # initialize a git repository

git add <file-name>  # change has been made, file being tracked by git.

git diff  # shows the changes in files being tracked, that are to be commited.

git commit -m "<message>"  # the changes has been commited which can be tracked.

git log  # can check the changes made using commit.

git push  # can push the entire code to the respository, can be either github or git lab or a self hosted repository.

git clone <url>  # can clone the existing repository and work on the code then later can push them to the repository.

git remote -v  #

git remote add ""  #


