  cee master project
  by jiacheng qu
  2017.1.1
  ![Front](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_0.jpg)
  ![Objectives](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_1.jpg)
  ![Approach](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_2.jpg)
  ![Pipeline](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_3.jpg)
  ![parameters](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_4.jpg)
  ![Doppler Effects](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_5.jpg)
  ![PSD Estimate](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_6.jpg)
  ![Box Plots](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_7.jpg)
  ![Scatter Plots](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_8.jpg)
  ![Take-away](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_9.jpg)
  ![Thanks](https://github.com/jqu224/masterProject/blob/master/PDF_files/JQu_Spectral_x.jpg)
  
  to execute: run .m file named 0zero to 0sixth in order
  
  ### Updates:
   Here is a pdf file that I used for presentations
  <object data="https://github.com/jqu224/masterProject/blob/master/JQu_Spectral_0.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://github.com/jqu224/masterProject/blob/master/JQu_Spectral_0.pdf">
        <p>This browser does not support PDFs. Please click here to view the PDF: <a     href="https://github.com/jqu224/masterProject/blob/master/JQu_Spectral_0.pdf">View PDF</a>.</p>
    </embed>
</object>
  
  ### zero_basic_plots: 
                  select .wav file and plot its features (could be randomized using randi() function) 
                                   
                  choosedialog_art.m: Choose a filename
                  (figure 1)        Spectrogram using short-time Fourier transform 
                  (figure 2)        inputdlg(): Enter Endpoints for selected freq
                  (figure 3)        pwelch(): Weltch Power Density using  
                  (figure 4 & 5)    loudness_1991.m: 
                                        plot the Partial Loudness sone/Bark (fig 5)
                                        inside the loudness_1991.m, call filter_third_octaves_downsample.m: plot 1/3-octave
                                          spectrum using bar() (fig 4)
                        
  
  ### first_welch_power_density:
                  this is the very first script that saves/plots welch_power_density of a particular category of noise
                    
                  choosedialog_art_all.m:                   Choose a category
                  choosedialog_plot_power_all_avg_dba.m:    let the user choose from 'save and plot all figures on one graph' or 'pull and save the data only' 
  
  
  ### second_avg_welch_power_density: 
                  plot avg of welch_power_densit
  
                  use mean() and std() to calculate the mean and stddiv
                  call plotRstyleUncert.m to print the avg wpd for each category
                  
  
  ### third_pull_fraction_of_power: 
                  pull the data?fraction_of_power 
  
                  choosedialog_art_all.m:                    choose a noise categroy
                  use inputdlg() to get the freq ranges and save them as seven_octave_freq_band.mat
                        for e.g.
                        type: '22','44','88','176','353','707','1414' 
                        for range sets: 0-22 23-44 45-88 89-176 177-353
                        354-707 708-1414 1415-3000 (Hz)
                  fractionPower.m: calculate the fraction of power according to the selected range set
                  and then, name them by 'fractionofpower_' CATEGORY '.mat'
  
  
  ### fourth_notboxplot_fraction_of_power:
                  plot 'notboxplots' of the power in different frequency bins 
  
                  load seven_octave_freq_band.mat: get the freq ranges
                        default freq bands are: {'0-22Hz','22-44Hz','44-88Hz','88-176Hz','176-353Hz','353-707Hz','707-1414Hz','1414-3000Hz'} ; 
                  use choosedialog_art.m to choose a category
                  load 'fractionofpower_' CATEGORY '.mat' and plot the
                  'notboxplots' by calling notBoxPlot(fractionofpower_category)
                    
  
  ### fifth_boxplot_of_fraction_of_power_side_by_side:
                  plot all the boxplots of fraction_of_power side by side 
  
                  load seven_octave_freq_band.mat: get the freq ranges
                        default freq bands are: {'0-22Hz','22-44Hz','44-88Hz','88-176Hz','176-353Hz','353-707Hz','707-1414Hz','1414-3000Hz'} ; 
                  load 'fractionofpower_' CATEGORY '.mat' 
                  plot the boxplots of 'fraction of power' side by side 
                        rail_fracpower = 'g' = green
                        truck_fracpower = 'm' = magenta
                        aircraft_fracpower = 'b' = blue
  
  
  ### sixth_gscatter_and_prediction:
                  plot gscatter labeled by group together with the classification process
  
                  load variance_all.mat, xmeans_all.mat, ALL_Xmean.mat; 
                  call gscatter() to plot Xmeans(dB) v Variance and label
                  them by group
                  callchoosedialog_classifier.m to choose a classifier
                    'Naive Bayes'
                    'Discriminant Analysis' 
                    'Classification Tree'
                    'K - Nearest Neighbor' 
                    '3D Classification Probability' 
                  plot the predicted class region
  
  
  
  
  
  
  
  
