clc
//Scilab Atom IPD has been installed and loaded in this Machine
global IPD_PATH;

//This Program Will Process Imagees
//This is the second Draft after reading through the Tutorial once

printf("-----------Welcome To Primal Image Processor A.2--------------- \n")
printf("\nThis Program Will Allow you to Process and edit Images, which can be used \nin various fields like Civil Surveying,Photo Editors,Artificially Intellegent Programs, \nThe Internet Of Things and even Big Data, but for all of these there \nis one thing they cant work without, Would You Kindly provide the Image ? \n")
printf("\n<<<<Since This Program will involve quite some Graphic Windows \nmake sure to check back on the console window often>>>>")
disp("")
printf("Would you Like to Use a pre-existing Image or Create your own Image? \nPress 1 to use Pre-existing Image \nPress 2 to Create your won Image \n")
ch=input("")

select ch

    case 1 then
temp=0;
while(temp~=1)
path=input("Pls. Enter Image File Path which is to be processed............")
RGB = ReadImage(IPD_PATH + path);
Image = RGB2Gray(RGB);//Converted to Gray Scale (Matrix of gray Values)
figure();ShowColorImage(RGB, 'Color Image');
printf("The no . Pixels in the row are %d \n",size(Image,1));
printf("The no . Pixels in the column are %d \n",size(Image,2));
temp = input("Enter 1 To Confirm This is The Image you wanted.............")
close()

printf("\nAs A Necessary step, the Image will now be converted to GrayScale \nand you will also be presented with its histogram \nPress ENTER to continue\n\n")
figure();
ShowImage(Image, 'Gray Level Image');
Hist = CreateHistogram(Image);
figure();plot(0:255, Hist)
input("");
close();close();
end

 case 2 then
     printf("How would you like to create your image? \n1. Derived from Magic Square \n2. Derived from Franck Matrix \n3.Randomized")//I though abt this quite late | Matlab has many more special Matrices
     ch1=input("")

     select ch1

     case 1 then
         Image = ((testmatrix("Magi", 240))/255)';
         ShowImage(Image, 'Image Derived from Magic Square');
         printf("The no . Pixels in the row are %d \n",size(Image,1));
         printf("The no . Pixels in the column are %d \n",size(Image,2));

     case 2 then
         Image = (testmatrix("frk", 240))';
         ShowImage(Image, 'Image Derived from Frank Matrix');
         printf("The no . Pixels in the row are %d \n",size(Image,1));
         printf("The no . Pixels in the column are %d \n",size(Image,2));

     case 3 then       
     r = input("Enter no. of Pixel Rows ........");
     c = input("Enter no. of Pixel Columns ........");
     Image = (floor(rand(r,c)*255))';
     ShowImage(Image, 'Randomized Image');
 end
 end
    
printf("\n You can now adjust the brightness of the Image \nEnter A positive value to increase its brightness and a negative value to decrease it\nKeep entering small values till you reach desired brightness\nEnter 0 when you want to Exit");
BImage=Image;
while(1)
    Bri=input("Enter Brightness Factor . . . . . ")
    if(Bri==0)
        break
        end
    BImage = BImage + Bri;
    ShowImage(BImage, 'Adjusted Image');
    input("")
    close()
end

printf("The Image Can now be converted into the following \n1.Logical Image \n2.Inverted Image")
ch=input("")
select(ch)
case 1 then
    printf("A threshold value is required for conversion :/ \n1.Provide one manually \n2.Let Computer Calculate")
    printf("WARNING : Letting computer calculate threshold for Magic matrix derived image\nMAY CAUSE IMMEDIATE CRASH, pls avoid its use in this case")
    ch1=input("")
select(ch1)
case 1 then
    thresh = input("Enter Threshold Value. . . . . ")
case 2 then 
    thresh = CalculateOtsuThreshold(Image)
end
Log = Image>thresh
ShowImage(Log, 'Logical Image');
    input("")
    close()
printf("You can further invert the Image !! \nEnter 1 to proceed\n")
pro=input("")
if pro == 1 then
    ShowImage(~Log, 'Inveted Logical Image');
    input("")
    close()
end
case 2 then
    Inv = 255*ones(size(Image,1),size(Image,2))-Image;
    ShowImage(Inv, 'Inveted Image');
    input("")
    close()
printf("You know, you can further convert the Image into a Logical one, FOR FREE !! \nEnter 1 to proceed\n") 
pro1=input("")
if pro1 == 1 then 
     printf("A threshold value is required for conversion :/ \n1.Provide one manually \n2.Let Computer Calculate")
    ch1=input("")
select(ch1)
case 1 then
    thresh = input("Enter Threshold Value. . . . . ")
case 2 then 
    thresh = CalculateOtsuThreshold(Image)
end
Log = Image>thresh
ShowImage(Log, 'Logical Image');
    input("")
    close()
printf("You can further invert the Image :o !! \nEnter 1 to proceed\n")
pro=input("")
if pro == 1 then
    Log = ~Log
    ShowImage(Log, 'Inveted Logical Image');
    input("")
    close()
    printf("You can furt....... \nOh wait its over now (Unless you want the program to become redundant) :P \nPress Enter to proceed\n")
    input("")
end
end
end
printf("The Program is Bascically over now,\nThank You for being a part of it\nAs a parting gift I will leave you with an Interactive Image-tool,Enjoy ^_^")
figure();
ImageTool(Image);




