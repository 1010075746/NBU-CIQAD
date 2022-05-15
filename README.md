# NBU-CIQAD and the proposed method for cartoon image quality assessment
NBU-CIQAD includes 100 reference images, 1800 SCCIs degraded only by one distortion on six degradation levels, and 800 MCCIs de-graded by two or three types of distortion on four degradation levels. 
##  📋 Table of content
1. 📎  [Paper Link](#-paper-link)
2. 💡 [Abstract](#-abstract)
3. 📃 [Requirement](#-requirement)
4. 👇 [Download](#-download)
5. 🍎 [Noting](#-noting)
6. ✨ [Statement](#-statement)
7. 🔍 [Citation](#-citation)
## 📎 Paper Link
- Article title: "Perceptual quality assessment of cartoon images" ([link](https://ieeexplore.ieee.org/document/9585540))
- Authors: Hangwei chen, Xiongli chai, Feng Shao, Xuejin Wang, Qiuping Jinag, Xiangchao Meng, Yo-Sung Ho
- Institution: The School of Information Science and Engineering, Ningbo University
## 💡 Abstract
In the animation industry, automatically predicting the quality of cartoon images based on the inputs of general distortions and color change is an urgent task, while the existing no-reference (NR) methods usually measure the perceptual quality of the natural images. In this paper, based on the observation that structure and color are the main factors affecting cartoon images quality, we proposed a new NR quality prediction metric for cartoon images, which fully takes gradient and color information into account. The experimental results on our newly constructed NBU-CIQAD dataset with color change and other existing cartoon image dataset demonstrate that the proposed method significantly outperforms existing no-references methods for the task of cartoon image quality assessment.
## 📃 Requirement
Matlab
## 👇 Download
- You can download NBU-CIQAD on [Baidu Cloud](https://pan.baidu.com/s/1CO1i1rdzmpHXQY2gf04Rhw) drive. [password]: 3r6i
- You can download the proposed method on [Baidu Cloud](https://pan.baidu.com/s/1tLsKhT-HwWGMMBZgLfKyXg) drive. [password]: ao7x
## 🍎 Noting 
- **Usage** :
   You can run 'demo.m' to get the feature vector and the predict score. 
   > **Input**:   
        img: test image  
   > **Output**:   
        features: the feature vector  
        score: the quality of the test image (Higher score means better image quality)
- **Train** :  
  We provide the folder ( i.e., Train).
  Run All_SVR.m / SCCIs_SVR.m / MCCIs_SVR.m to predict the quality scores and calculate the correlation 
  between subjective and objective scores.

## ✨ Statement
This project is for research purpose only, please contact us for the licence of commercial use. For any other questions please contact 1010075746@qq.com or shaofeng@nbu.edu.cn

## 🔍 Citation
If our datasets and criteria are helpful, please consider citing the following papers.

[1] H. Chen et al., "Perceptual Quality Assessment of Cartoon Images," in IEEE Transactions on Multimedia, doi: 10.1109/TMM.2021.3121875.
