# Image-Processing-and-Enhancement

## 1. Histogram Specification: 
The histogram of the image (givenhist.jpg) is modified in such a way that the resulting histogram nearly approximates the histogram of the image (sphist.jpg). 

![alt text](https://github.com/AviKhandelwal/Image-Processing-and-Enhancement/blob/main/Raw%20Images/givenhist.jpg?raw=true)

![alt text](https://github.com/AviKhandelwal/Image-Processing-and-Enhancement/blob/main/Raw%20Images/sphist.jpg?raw=true)

## 2. Bilateral Filtering 
With the 3 images - spnoisy.jpg’, unifnoisy.jpg and spunifnoisy.jpg which are corrupted with different types of noise, an attempt has been made to reduce the effect of noise from each of them by applying bilateral filter with mask size 5 × 5 with appropriate values of σd2 and σr2, set through experimentation 

![alt text](https://github.com/AviKhandelwal/Image-Processing-and-Enhancement/blob/main/Raw%20Images/spnoisy.jpg?raw=true)

![alt text](https://github.com/AviKhandelwal/Image-Processing-and-Enhancement/blob/main/Raw%20Images/unifnoisy.jpg?raw=true)

![alt text](https://github.com/AviKhandelwal/Image-Processing-and-Enhancement/blob/main/Raw%20Images/spunifnoisy.jpg?raw=true)

## 3. Non-local means filtering
With the noisy picture of Lenna (Lenna noise.jpg) the image has been denoised using the non-local means filter. For faster implementation, the search has been restricted to similar patches in a window of size 5×5 pixels around the current patch and each patch of size 7 × 7 has been assumed. The bandwidth /scale of the Gaussian has been set experimentally. 

![alt text](https://github.com/AviKhandelwal/Image-Processing-and-Enhancement/blob/main/Raw%20Images/lenna.noise.jpg?raw=true)

## 4. Corner Detection 
Harris corner detector algorithm on the image IITG.jpg has been implemented with superimposing the corner points on to the relevant pixels in the image. A suitable threshold has been chosen to pick up the interest points followed by a non-maximal suppression step

![alt text](https://github.com/AviKhandelwal/Image-Processing-and-Enhancement/blob/main/Raw%20Images/IITG.jpg?raw=true)
