1. Citation:
Please cite the following paper when using the code. 
Author: Hangwei Chen, Xiongli Chai, Feng Shao, Xuejin Wang, Qiuping Jiang, Xiangchao Meng, and Yo-Sung Ho, 
Title: "Perceptual Quality Assessment of Cartoon Images ,"
IEEE TRANSACTIONS ON MULTIMEDIA, Accept, 2021.

2. Usage: 
   You can run 'demo.m' to get the feature vector and the predict score. 

   Input: 
        img: test image
   Output: 
        features: the feature vector
        score: the quality of the test image

3. Train: 
    
We provide the folder ( i.e., Train).
Run All_SVR.m / SCCIs_SVR.m / MCCIs_SVR.m to predict the quality scores and calculate the correlation 
between subjective and objective scores.

note: the subjective and objective scores have already stored in ".mat" file (i.e., MOS_all, MOS_SCCIs.....)
   
    
4. Please contact with us if you have any question, by Email: 1010075746@qq.com or shaofeng@nbu.edu.cn